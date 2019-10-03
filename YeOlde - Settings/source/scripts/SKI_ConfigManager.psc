scriptname SKI_ConfigManager extends SKI_QuestBase hidden 

; SCRIPT VERSION ----------------------------------------------------------------------------------
;
; History
;
; 1:	- Initial version
;
; 2:	- Added lock for API functions
;
; 3:	- Removed lock again until I have time to test it properly
;
; 4:	- Added redundancy for registration process
;
; 4.1	- (YeOldeDragon): Added option for enabling/disabling MCM menus

int function GetVersion()
	return 4
endFunction


; CONSTANTS ---------------------------------------------------------------------------------------

string property		JOURNAL_MENU	= "Journal Menu" autoReadonly
string property		MENU_ROOT		= "_root.ConfigPanelFader.configPanel" autoReadonly


; PRIVATE VARIABLES -------------------------------------------------------------------------------

; -- Version 1 --

SKI_ConfigBase[]	_modConfigs
string[]			_modNames
int					_curConfigID	= 0
int					_configCount	= 0

SKI_ConfigBase		_activeConfig

; -- Version 2 --

; keep those for now
bool				_lockInit		= false
bool				_locked			= false

; -- Version 4 --

bool				_cleanupFlag	= false
int					_addCounter		= 0
int					_updateCounter	= 0

; -- YeOlde -- 
SKI_ConfigBase[]	_allMods
string[]			_allNames
bool[]				_isModEnabled
bool 				_yeoldeModInitialized = false

; YeOlde
string[] function GetAllModNames()
	return _allNames
endFunction

; YeOlde
bool[] function GetAllEnabledModFlags()
	return _isModEnabled
endFunction

; ; YeOlde
; SKI_ConfigBase[] function GetAllMods()
; 	return _allMods
; endFunction

int function GetNbMods()
	return _configCount
endFunction

Function SortArray (string[] array)
	Int Index1
	Int Index2 = array.Length - 1
	 
	While (Index2 > 0)
		Index1 = 0
		While (Index1 < Index2)
			If (array[Index1] == "")
				array[Index1] = array[Index1 + 1]
				array[Index1 + 1] = None
			elseif (array[Index1] > array[Index1 + 1])
				string swapVal = array[Index1]
				array[Index1] = array[Index1 + 1]
				array[Index1 + 1] = swapVal
			EndIf
			Index1 += 1
		EndWhile
		Index2 -= 1
	EndWhile
EndFunction

; INITIALIZATION ----------------------------------------------------------------------------------

event OnInit()
	_modConfigs	= new SKI_ConfigBase[128]
	_modNames	= new string[128]
	_allMods	= new SKI_ConfigBase[128]
	_allNames	= new string[128]
	_isModEnabled	= new bool[128]

	int i = 0
	while (i<_isModEnabled.Length)
		_isModEnabled[i] = true
		i += 1
	endWhile
	_yeoldeModInitialized = true

	OnGameReload()
endEvent

; @implements SKI_QuestBase
event OnGameReload()
	if (!_yeoldeModInitialized)	
		_allMods	= new SKI_ConfigBase[128]
		_allNames	= new string[128]
		_isModEnabled	= new bool[128]
		_curConfigID = 0

		int i = 0
		while (i<_allMods.Length)
			_isModEnabled[i] = true
			_allMods[i] = _modConfigs[i]
			_allNames[i] = _modNames[i]
			i += 1
		endWhile

		_yeoldeModInitialized = true
	endif


	RegisterForModEvent("SKICP_modSelected", "OnModSelect")
	RegisterForModEvent("SKICP_pageSelected", "OnPageSelect")
	RegisterForModEvent("SKICP_optionHighlighted", "OnOptionHighlight")
	RegisterForModEvent("SKICP_optionSelected", "OnOptionSelect")
	RegisterForModEvent("SKICP_optionDefaulted", "OnOptionDefault")
	RegisterForModEvent("SKICP_keymapChanged", "OnKeymapChange")
	RegisterForModEvent("SKICP_sliderSelected", "OnSliderSelect")
	RegisterForModEvent("SKICP_sliderAccepted", "OnSliderAccept")
	RegisterForModEvent("SKICP_menuSelected", "OnMenuSelect")
	RegisterForModEvent("SKICP_menuAccepted", "OnMenuAccept")
	RegisterForModEvent("SKICP_colorSelected", "OnColorSelect")
	RegisterForModEvent("SKICP_colorAccepted", "OnColorAccept")
	RegisterForModEvent("SKICP_dialogCanceled", "OnDialogCancel")

	Log("SKSE version: " + SKSE.GetVersionRelease())
	if(SKSE.GetVersionRelease() == 58) ; Skyrim VR   
		RegisterForModEvent("SKICP_inputSelected", "OnInputSelect")
		RegisterForModEvent("SKICP_inputAccepted", "OnInputAccept")
	endif

	RegisterForMenu(JOURNAL_MENU)

	; no longer used but better safe than sorry
	_lockInit = true

	_cleanupFlag = true

	CleanUp()
	SendModEvent("SKICP_configManagerReady")

	_updateCounter = 0
	RegisterForSingleUpdate(5)
endEvent


; EVENTS ------------------------------------------------------------------------------------------

event OnUpdate()

	if (_cleanupFlag)
		CleanUp()
	endIf

	if (_addCounter > 0)
		Debug.Notification("MCM: Registered " + _addCounter + " new menu(s).")
		_addCounter = 0
	endIf

	SendModEvent("SKICP_configManagerReady")

	if (_updateCounter < 6)
		_updateCounter += 1
		RegisterForSingleUpdate(5)
	else
		RegisterForSingleUpdate(30)
	endIf
endEvent

event OnMenuOpen(string a_menuName)
	GotoState("BUSY")
	_activeConfig = none
	UI.InvokeStringA(JOURNAL_MENU, MENU_ROOT + ".setModNames", _modNames);
endEvent

event OnMenuClose(string a_menuName)
	GotoState("")
	if (_activeConfig)
		_activeConfig.CloseConfig()
	endIf

	_activeConfig = none
endEvent

event OnModSelect(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int configIndex = a_numArg as int
	if (configIndex > -1)

		; We can clean the buffers of the previous menu now
		if (_activeConfig)
			_activeConfig.CloseConfig()
		endIf

		_activeConfig = _modConfigs[configIndex]
		_activeConfig.OpenConfig()
	endIf
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent

event OnPageSelect(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	string page = a_strArg
	int index = a_numArg as int
	_activeConfig.SetPage(page, index)
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent

event OnOptionHighlight(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int optionIndex = a_numArg as int
	_activeConfig.HighlightOption(optionIndex)
endEvent

event OnOptionSelect(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int optionIndex = a_numArg as int
	_activeConfig.SelectOption(optionIndex)
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent

event OnOptionDefault(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int optionIndex = a_numArg as int
	_activeConfig.ResetOption(optionIndex)
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent

event OnKeymapChange(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int optionIndex = a_numArg as int
	int keyCode = UI.GetInt(JOURNAL_MENU, MENU_ROOT + ".selectedKeyCode")

	; First test vanilla controls
	string conflictControl = Input.GetMappedControl(keyCode)
	string conflictName = ""

	; Then test mod controls
	int i = 0
	while (conflictControl == "" && i < _modConfigs.length)
		if (_modConfigs[i] != none)
			conflictControl = _modConfigs[i].GetCustomControl(keyCode)
			if (conflictControl != "")
				conflictName = _modNames[i]
			endIf
		endIf
			
		i += 1
	endWhile

	_activeConfig.RemapKey(optionIndex, keyCode, conflictControl, conflictName)
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent

event OnSliderSelect(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int optionIndex = a_numArg as int
	_activeConfig.RequestSliderDialogData(optionIndex)
endEvent

event OnSliderAccept(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	float value = a_numArg
	_activeConfig.SetSliderValue(value)
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent

event OnMenuSelect(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int optionIndex = a_numArg as int
	_activeConfig.RequestMenuDialogData(optionIndex)
endEvent

event OnMenuAccept(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int value = a_numArg as int
	_activeConfig.SetMenuIndex(value)
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent

event OnColorSelect(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int optionIndex = a_numArg as int
	_activeConfig.RequestColorDialogData(optionIndex)
endEvent

event OnColorAccept(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	int color = a_numArg as int
	_activeConfig.SetColorValue(color)
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent

event OnDialogCancel(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endEvent


; FUNCTIONS ---------------------------------------------------------------------------------------

; YeOlde
int function FindModIndex(SKI_ConfigBase a_menu)
	int i = 0
	while (i < _allMods.length)
		if (_allMods[i] == a_menu)
			return i
		endIf			
		i += 1
	endWhile

	return -1
endFunction


; YeOlde
int function EnableModByName(string a_modName)
	Debug.Trace("yeolde_SKI_ConfigManager::EnableModByName -> " + a_modName)
	; We aren't supposed to add/remove menu while in menu mode. This is an exception.
	GotoState("")
	SKI_ConfigBase menu = none

	int i = 0
	while (i < _allNames.Length)
		if (_allNames[i] == a_modName)
			menu = _allMods[i]

			i = _allNames.Length
		endif
		i += 1
	endWhile

	if (menu == none)		
		Debug.Trace("yeolde_SKI_ConfigManager::EnableModByName -> Can't find menu '" + a_modName + "'")
		return -1
	endif

	int result = EnableMod(menu, a_modName)
	GotoState("BUSY")	
    return result
endFunction


; YeOlde
int function EnableMod(SKI_ConfigBase a_menu, string a_modName)
    Debug.Trace("yeolde_SKI_ConfigManager::EnableMod -> " + a_modName)
	
	int configID = RegisterMod(a_menu, a_modName)
	
	GotoState("BUSY")	
	UI.InvokeStringA(JOURNAL_MENU, MENU_ROOT + ".setModNames", _modNames);
	GotoState("")
    
	RegisterForSingleUpdate(2)
    return configID
endFunction


; YeOlde
int function DisableModByName(string a_modName)
	Debug.Trace("yeolde_SKI_ConfigManager::DisableModByName -> " + a_modName)
	; We aren't supposed to add/remove menu while in menu mode. This is an exception.
	GotoState("")
	SKI_ConfigBase menu = none

	int i = 0
	while (i < _allNames.Length)
		if (_allNames[i] == a_modName)
			menu = _allMods[i]

			i = _allNames.Length
		endif
		i += 1
	endWhile

	if (menu == none)		
		Debug.Trace("yeolde_SKI_ConfigManager::DisableModByName -> Can't find menu '" + a_modName + "'")
		return -1
	endif
	
	int result = DisableMod(menu, a_modName)
	GotoState("BUSY")

    return result
endFunction


; YeOlde
int function DisableMod(SKI_ConfigBase a_menu, string a_modName)
	Debug.Trace("yeolde_SKI_ConfigManager::DisableMod -> " + a_modName)

	int index = FindModIndex(a_menu)
	_isModEnabled[index] = false
	_modConfigs[index] = none
	_modNames[index] = ""
	
	; int configID = UnregisterMod(a_menu)
	
	UI.InvokeStringA(JOURNAL_MENU, MENU_ROOT + ".setModNames", _modNames);
	GotoState("")
	
    RegisterForSingleUpdate(2)
    return index
endFunction


; @interface
int function RegisterMod(SKI_ConfigBase a_menu, string a_modName)
	GotoState("BUSY")
	;Log("Registering config menu: " + a_menu + "(" + a_modName + ")")

	if (_configCount >= 128)
		GotoState("")
		return -1
	endIf

	; Already registered?
	int i = 0
	while (i < _allMods.length)
		if (_allMods[i] == a_menu)
			if (_modConfigs[i] == none)
				; The mod is registered, but disabled
				_isModEnabled[i] = true;
				_modConfigs[i] = a_menu
				_modNames[i] = a_modName
				
				; Track mods added in the current cycle so we don't have to display one message per mod
				_addCounter += 1
			endif
			
			GotoState("")
			return i
		endIf
			
		i += 1
	endWhile

	; New registration
	int configID = NextID()
	
	if (configID == -1)
		GotoState("")
		return -1
	endIf

	_allMods[configID] = a_menu
	_modConfigs[configID] = a_menu
	_modNames[configID] = a_modName
	_allNames[configID] = a_modName
	_isModEnabled[configID] = true
	
	_configCount += 1

	; Track mods added in the current cycle so we don't have to display one message per mod
	_addCounter += 1

	GotoState("")

	return configID
endFunction

; @interface
int function UnregisterMod(SKI_ConfigBase a_menu)
	GotoState("BUSY")
	;Log("Unregistering config menu: " + a_menu)

	int i = 0
	while (i < _modConfigs.length)
		if (_modConfigs[i] == a_menu)
			_modConfigs[i] = none
			_modNames[i] = ""
			_allNames[i] = ""
			_allMods[i] = none
			_configCount -= 1

			GotoState("")
			return i
		endIf
			
		i += 1
	endWhile

	GotoState("")
	return -1
endFunction

; YeOlde
function ForceResetFromMCMMenu()	
	; We aren't supposed to add/remove MSM menu while in menu mode. This is an exception.	
	GotoState("")
	ForceReset()

	; Since we are in menu mode, we set back the BUSY state.
	GotoState("BUSY")
endfunction

; @interface
function ForceReset()
	Log("Forcing config manager reset...")
	SendModEvent("SKICP_configManagerReset")

	GotoState("BUSY")

	int i = 0
	while (i < _modConfigs.length)
		_modConfigs[i] = none
		_modNames[i] = ""
		_allNames[i] = ""
		_allMods[i] = none
		i += 1
	endWhile

	_curConfigID = 0
	_configCount = 0

	GotoState("")

	SendModEvent("SKICP_configManagerReady")
endFunction

function CleanUp()
	GotoState("BUSY")

	_cleanupFlag = false

	_configCount = 0
	int i = 0
	while (i < _allMods.length)
		if (_allMods[i] == none || _allMods[i].GetFormID() == 0)
			_modConfigs[i] = none
			_allMods[i] = none
			_modNames[i] = ""
			_allNames[i] = ""
		else
			if (_isModEnabled[i] == true)
				_modConfigs[i] = _allMods[i]
				_modNames[i] = _allNames[i]
			endif
			_configCount += 1
		endIf

		i += 1
	endWhile

	GotoState("")
endFunction

int function NextID()
	int startIdx = _curConfigID
	
	while (_allMods[_curConfigID] != none)
		_curConfigID += 1
		if (_curConfigID >= 128)
			_curConfigID = 0
		endIf
		if (_curConfigID == startIdx)
			return -1 ; Just to be sure. 
		endIf
	endWhile
	
	return _curConfigID
endFunction

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction

; Only for Skyrim VR (won't be used in SE)
function OnInputSelect(String a_eventName, String a_strArg, Float a_numArg, Form a_sender)
	Int optionIndex = a_numArg as Int
	_activeConfig.RequestInputDialogData(optionIndex)
endFunction

; Only for Skyrim VR (won't be used in SE)
function OnInputAccept(String a_eventName, String a_strArg, Float a_numArg, Form a_sender)
	_activeConfig.SetInputText(a_strArg)
	ui.InvokeBool(self.JOURNAL_MENU, self.MENU_ROOT + ".unlock", true)
endFunction

; STATES ---------------------------------------------------------------------------------------

state BUSY
	int function EnableMod(SKI_ConfigBase a_menu, string a_modName)
		return -2
	endFunction

	int function DisableMod(SKI_ConfigBase a_menu, string a_modName)
		return -2
	endFunction

	int function RegisterMod(SKI_ConfigBase a_menu, string a_modName)
		return -2
	endFunction

	int function UnregisterMod(SKI_ConfigBase a_menu)
		return -2
	endFunction

	function ForceReset()
		Log("ForceReset called while in busy state")
	endFunction

	function CleanUp()
		Log("CleanUp called while in busy state")
	endFunction
endState