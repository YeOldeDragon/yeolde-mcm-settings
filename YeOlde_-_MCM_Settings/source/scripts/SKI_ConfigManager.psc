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
Quest property YeOldeBackupQuest auto


SKI_ConfigBase[]	_allMods
string[]			_allNames
bool[]				_isModEnabled
bool 				_yeoldeModInitialized = false

yeolde_mcm_settings _backup_mod

int					_jModSelection		= 0  	; Mods/pages to skip when importing.
int					_jConfig		= 0		; file to store YeOlde Config content

; YeOlde
string[] function GetAllModNames()
	return _allNames
endFunction

; YeOlde
bool[] function GetAllEnabledModFlags()
	return _isModEnabled
endFunction


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
	RegisterForModEvent("SKICP_inputSelected", "OnInputSelect")
	RegisterForModEvent("SKICP_inputAccepted", "OnInputAccept")

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

; YeOlde
function ForceModSelect(int modIndex)
	if (modIndex > -1)
		if (_activeConfig != none)
			_activeConfig.CloseConfig()
		endIf

		_activeConfig = _modConfigs[modIndex]

		if (_activeConfig != none)
			; _activeConfig.OpenConfig(false)
			_activeConfig.OpenConfig()
		else
			Error("ForceModSelect -> no active config")
		endif
	endIf
endfunction

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

; YeOlde
function ForcePageSelect(int a_index, string a_pageName)
	Log("ForcePageSelect -> str:" + a_pageName + ", index:" + a_index)
	_activeConfig.SetPage(a_pageName, a_index)
	; YeOlde: Leave here or remove???
	UI.InvokeBool(JOURNAL_MENU, MENU_ROOT + ".unlock", true)
endfunction

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

function OnInputSelect(String a_eventName, String a_strArg, Float a_numArg, Form a_sender)
	Int optionIndex = a_numArg as Int
	_activeConfig.RequestInputDialogData(optionIndex)
endFunction

function OnInputAccept(String a_eventName, String a_strArg, Float a_numArg, Form a_sender)
	_activeConfig.SetInputText(a_strArg)
	ui.InvokeBool(self.JOURNAL_MENU, self.MENU_ROOT + ".unlock", true)
endFunction




; FUNCTIONS ---------------------------------------------------------------------------------------


; YeOlde 
bool function IsBackupRestorePatchActive(string modName, int modIndex)
	if (_jConfig == 0)
		_jConfig = YeOldeConfig.Load()
	endif

	if (YeOldeConfig.isModNeedPatch(_jConfig, modName))		
		if (modIndex > -1)
			yeolde_patches patcher = YeOldeBackupQuest as yeolde_patches
			if (!patcher.IsInitialized)
				patcher.Initialize(_jConfig)
			endif
			return _allMods[modIndex].IsBackupRestoreEnabled() || patcher.isPatchAvailable(modName)
		endif
	endif

	return false
endfunction



function InitializeModSelectionList()
	if (_jModSelection > 0)
		JValue.release(_jModSelection)
		_jModSelection = 0
	endif

	_jModSelection = JValue.readFromFile(YeOldeConfig.GetDefaultModSelectionFilePath())	
	if (_jModSelection == 0)
		GenerateDefaultModSelectionList()
	endif
	
	JValue.retain(_jModSelection)
endfunction

function GenerateDefaultModSelectionList()
	Log("GenerateDefaultModSelectionList()")

	if (_jModSelection > 0)
		JValue.release(_jModSelection)
		JVAlue.zeroLifetime(_jModSelection)
		_jModSelection = 0
	endif

	_jModSelection = JArray.object()

	int jConfig = YeOldeConfig.Load()

	int i = 0
	while(i < _allNames.Length)
		if (_allNames[i] != "" && (!YeOldeConfig.isModInList(jConfig, _allNames[i]) \
			|| YeOldeConfig.isModHaveInternalPatch(jConfig, _allNames[i])) \
			|| YeOldeConfig.isModOK(jConfig, _allNames[i]) \
			|| IsBackupRestorePatchActive(_allNames[i], i))
			; Mod is not listed at risk, so we enable it
			JArray.addStr(_jModSelection, _allNames[i])
		endif
		i += 1
	endwhile

	JArray.sort(_jModSelection)
	JValue.writeToFile(_jModSelection, YeOldeConfig.GetDefaultModSelectionFilePath())
endfunction


; YeOlde
bool function IsModBlackListed(string mod)
	return (JArray.findStr(_jModSelection, mod) == -1)
endfunction


; YeOlde
function BackupAllModValues(yeolde_mcm_settings settings_mod)
	Log("BackupAllModValues -> START")
	SKI_ConfigBase config
	_backup_mod = settings_mod

	InitializeModSelectionList()

	if (_jConfig == 0)
		_jConfig = YeOldeConfig.Load()
	endif

	int i = 0
	int nbMods = 0
	while (i<_allMods.Length)
		if(_allMods[i] != none)
			nbMods += 1
		endif
		i += 1
	endwhile

	BackupConfig.RemoveModFilesFromDisk()
	
	int jBackup = BackupConfig.createInstance()
	JValue.retain(jBackup)
	YeOldeBackupThreadManager threadMgr = YeOldeBackupQuest as YeOldeBackupThreadManager
	yeolde_patches patcher = YeOldeBackupQuest as yeolde_patches
	if (!patcher.IsInitialized)
		patcher.Initialize(_jConfig)
	endif
	threadMgr.Initialize(_backup_mod, patcher, _jConfig)

    RegisterForModEvent("YeOlde_BackupCompletedCallback", "BackupCompletedCallback")

	i = 0
	int nbModsDone = 0
	while (i<_allMods.Length && nbModsDone < nbMods)
		if(_allMods[i] != none)
			string modName = _allMods[i].ModName
			if(IsModBlackListed(modName))
				Log("YeOlde_JSON:ModName -> " + modName)	
				ShowBackupModStatus(modName, "skipped", 0)
				ShowBackupInfoMsg("Mod '" + modName + "' is on your blacklist. Mod skipped.")
			else
				Log("YeOlde_JSON:ModName -> " + modName)	
				
				threadMgr.doBackupTaskAsync(_allMods[i])
			endif
			nbModsDone += 1		
		endif
		i += 1
	endwhile

	threadMgr.wait_all() ; Start multi-thread backup tasks

	JValue.release(jBackup)
	JValue.release(_jModSelection)
	
	Log("BackupAllModValues -> BACKUP COMPLETED")
endfunction

int _backupCompletedCount = 0
int _backupFailedCount = 0

bool locked = false
Event BackupCompletedCallback(int a_result, string modName)
	Log("BackupCompletedCallback("+ a_result + ", " + modName + ")")
	;A spin lock is required here to prevent us from writing two guards to the same variable
	while locked
		Utility.waitMenuMode(0.1)
	endWhile
	locked = true
 
	if (a_result == 0)
		_backupCompletedCount += 1
		ShowBackupModStatus(modName, "success", a_result)	
		ShowBackupInfoMsg("Mod '" + modName + "' DONE.")
	else
		_backupFailedCount += 1
		ShowBackupModStatus(modName, "failed", a_result)
		ShowBackupInfoMsg("Mod '" + modName + "' FAILED to backup.")
	endif
 
	locked = false
endEvent

; YeOlde
function RestoreAllModValues(yeolde_mcm_settings settings_mod)	
	Log("RestoreAllModValues()")
	SKI_ConfigBase config

	if (_jConfig == 0)
		_jConfig = YeOldeConfig.Load()
	endif
	
	_backup_mod = settings_mod

	int jBackup = BackupConfig.CreateImportInstance()
	if(jBackup == 0)
		ShowBackupInfoMsg("ERROR: Backup file not found")
		Log("RestoreMcmValues() -> ERROR: Backup file not found")
		return
	endif

	Log("RestoreAllModValues() -> allKeysPArray()")
	string[] mods = JMap.allKeysPArray(jBackup)
	Log("RestoreAllModValues() -> nbMods: " + mods.length)
	
	YeOldeRestoreThreadManager threadMgr = YeOldeBackupQuest as YeOldeRestoreThreadManager
	yeolde_patches patcher = YeOldeBackupQuest as yeolde_patches
	if (!patcher.IsInitialized)
		patcher.Initialize(_jConfig)
	endif
	threadMgr.Initialize(_backup_mod, patcher, _jConfig)
    RegisterForModEvent("YeOlde_RestoreCompletedCallback", "RestoreCompletedCallback")

	int i = 0
	while (i< mods.length)
		int modIndex = FindModIndexByFileName(mods[i])
		if (modIndex > -1)
			int jMod = JMap.getObj(jBackup, mods[i])			
			threadMgr.doRestoreTaskAsync(_allMods[modIndex], jMod)
		endif
		i += 1
	endWhile
	
	threadMgr.wait_all() ; Start multi-thread backup tasks
	
	Log("RestoreAllModValues -> RESTORATION COMPLETED")

endfunction

bool restoreLocked = false
Event RestoreCompletedCallback(int a_result, string modName)
	Log("RestoreCompletedCallback("+ a_result + ", " + modName + ")")
	;A spin lock is required here to prevent us from writing two guards to the same variable
	while restoreLocked
		Utility.waitMenuMode(0.1)
	endWhile
	restoreLocked = true
 
	if (a_result == 0)
		_backupCompletedCount += 1
		ShowBackupModStatus(modName, "success", a_result)		
		ShowBackupInfoMsg("Mod " + modName + " DONE")	
	else
		_backupFailedCount += 1	
		ShowBackupModStatus(modName, "failed", a_result)
		ShowBackupInfoMsg("Mod " + modName + " FAILED")	
	endif
 
	restoreLocked = false
endEvent


; YeOlde
int function FindModIndexByFileName(string a_modName)
	Log("FindModIndexByFileName() -> " + a_modName)
	int i = 0
	while (i < _allNames.length)
		if ((_allNames[i] + ".json") == a_modName)
			return i
		endIf			
		i += 1
	endWhile

	return -1
endFunction


; YeOlde
int function EnableModByName(string a_modName, bool a_updateUI = true)
	Debug.Trace("EnableModByName -> " + a_modName)
	; We aren't supposed to add/remove menu while in menu mode. This is an exception.
	string lastState = GetState()
	GotoState("")
	SKI_ConfigBase menu = none

	int index = _allNames.Find(a_modName)
	if (index == -1)		
		Debug.Trace("EnableModByName() -> Can't find menu '" + a_modName + "'")
		return -1
	endif

	int result = EnableMod(_allMods[index], a_modName, a_updateUI)
	GotoState(lastState)	
    return result
endFunction


; YeOlde
int function EnableMod(SKI_ConfigBase a_menu, string a_modName, bool a_updateUI = true)
    Debug.Trace("EnableMod() -> " + a_modName)
	
	int configID = RegisterMod(a_menu, a_modName)
	
	if (a_updateUI)
		GotoState("BUSY")	
		UI.InvokeStringA(JOURNAL_MENU, MENU_ROOT + ".setModNames", _modNames);
		GotoState("")
	endif
    
	RegisterForSingleUpdate(2)
    return configID
endFunction


; YeOlde
int function DisableModByName(string a_modName)
	Debug.Trace("DisableModByName() -> " + a_modName)
	; We aren't supposed to add/remove menu while in menu mode. This is an exception.
	string lastState = GetState()
	GotoState("")
	SKI_ConfigBase menu = none

	int index = _allNames.Find(a_modName)
	if (index == -1)		
		Debug.Trace("EnableModByName() -> Can't find menu '" + a_modName + "'")
		return -1
	endif
	
	int result = DisableMod(_allMods[index], a_modName)
	GotoState(lastState)

    return result
endFunction


; YeOlde
int function DisableMod(SKI_ConfigBase a_menu, string a_modName)
	Log("DisableMod() -> " + a_modName)

	int index = _allMods.Find(a_menu)
	_isModEnabled[index] = false
	_modConfigs[index] = none
	_modNames[index] = ""
		
	UI.InvokeStringA(JOURNAL_MENU, MENU_ROOT + ".setModNames", _modNames);
	GotoState("")
	
    RegisterForSingleUpdate(2)
    return index
endFunction


; @interface
int function RegisterMod(SKI_ConfigBase a_menu, string a_modName)
	GotoState("BUSY")

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
	string lastState = GetState()
	GotoState("")
	ForceReset()

	; Since we are in menu mode, we set back the BUSY state.
	GotoState(lastState)
endfunction

; @interface
function ForceReset()
	Log("ForceReset() -> Forcing config manager reset...")
	SendModEvent("SKICP_configManagerReset")

	string lastState = GetState()
	GotoState("")

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

	GotoState(lastState)

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


; STATES ---------------------------------------------------------------------------------------

state BUSY
	int function EnableMod(SKI_ConfigBase a_menu, string a_modName, bool a_updateUI = true)
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
	endFunction

	function CleanUp()
	endFunction
endState


; DEBUG  ----------------------------------------------------------------------------------------

; YeOlde: Show task status on YeOlde-Settings MCM page when backuping/restoring configs.
function ShowBackupInfoMsg(string a_msg)
	if (_backup_mod != none)
		_backup_mod.UpdateInfoMsg(a_msg)		
	endif
endfunction

function ShowBackupModStatus(string a_modName, string type, int error_no)
	if (_backup_mod != none)
		_backup_mod.AddModStatus(a_modName, type, error_no)		
	endif
endfunction

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction

function Error(string a_msg)
	Debug.Trace(self + " ERROR: " +  a_msg)
endFunction