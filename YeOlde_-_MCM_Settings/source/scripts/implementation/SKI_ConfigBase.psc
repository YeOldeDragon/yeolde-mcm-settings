scriptname SKI_ConfigBase extends SKI_QuestBase

; CONSTANTS ---------------------------------------------------------------------------------------

string property		JOURNAL_MENU	= "Journal Menu" autoReadonly
string property		MENU_ROOT		= "_root.ConfigPanelFader.configPanel" autoReadonly

int property		STATE_DEFAULT	= 0 autoReadonly
int property		STATE_RESET		= 1 autoReadonly
int property		STATE_SLIDER	= 2 autoReadonly
int property		STATE_MENU		= 3 autoReadonly
int property		STATE_COLOR		= 4 autoReadonly
int property		STATE_INPUT		= 5 autoReadonly

int property		OPTION_TYPE_EMPTY	= 0x00 autoReadonly
int property		OPTION_TYPE_HEADER	= 0x01 autoReadonly
int property		OPTION_TYPE_TEXT	= 0x02 autoReadonly
int property		OPTION_TYPE_TOGGLE	= 0x03 autoReadonly
int property 		OPTION_TYPE_SLIDER	= 0x04 autoReadonly
int property		OPTION_TYPE_MENU	= 0x05 autoReadonly
int property		OPTION_TYPE_COLOR	= 0x06 autoReadonly
int property		OPTION_TYPE_KEYMAP	= 0x07 autoReadonly
int property		OPTION_TYPE_INPUT	= 0x08 autoReadonly

int property		OPTION_FLAG_NONE		= 0x00 autoReadonly
int property		OPTION_FLAG_DISABLED	= 0x01 autoReadonly
int property		OPTION_FLAG_HIDDEN		= 0x02 autoReadonly
int property		OPTION_FLAG_WITH_UNMAP	= 0x04 autoReadonly

int property		LEFT_TO_RIGHT	= 1	autoReadonly
int property		TOP_TO_BOTTOM	= 2 autoReadonly

int property		RESULT_SUCCESS	= 0 autoReadonly
int property		RESULT_ERROR_TIMEOUT	= -1 autoReadonly
int property		RESULT_ERROR_UNKNOWN	= 1 autoReadonly
int property		RESULT_ERROR_VERSION	= 2 autoReadonly


; PRIVATE VARIABLES -------------------------------------------------------------------------------

SKI_ConfigManager	_configManager
bool				_initialized		= false
int					_configID			= -1
string				_currentPage		= ""
int					_currentPageNum		= 0			; 0 for "", real pages start at 1

; Keep track of what we're doing at the moment for stupidity checks
int					_state				= 0

int					_cursorPosition		= 0
int					_cursorFillMode		= 1			;LEFT_TO_RIGHT

; Local buffers
int[]				_optionFlagsBuf					; byte 1 type, byte 2 flags
string[]			_textBuf
string[]			_strValueBuf
float[]				_numValueBuf

float[]				_sliderParams
int[]				_menuParams
int[]				_colorParams

int					_activeOption		= -1

string				_infoText
string				_inputStartText

bool				_messageResult		= false
bool				_waitForMessage		= false

string[]			_stateOptionMap


; YEOLDE CONSTANTS & VARIABLES

string[] 			_currentMenuOptions   				; Keep current menu options

string				_bak_currentPage		= ""
int					_bak_currentPageNum		= 0	

bool 				_isBackupMode = false
int[]				_bak_optionFlagsBuf					; byte 1 type, byte 2 flags
string[]			_bak_textBuf
string[]			_bak_strValueBuf
float[]				_bak_numValueBuf
string[]			_bak_stateOptionMap

int					_bak_cursorPosition		= 0
int					_bak_cursorFillMode		= 1	

int 				_bak_optionType = 0



; PROPERTIES --------------------------------------------------------------------------------------

string property		ModName auto

string[] property	Pages auto

string property		CurrentPage
	string function get()
		return  _currentPage
	endFunction
endProperty

SKI_ConfigManager property	ConfigManager
	SKI_ConfigManager function get()
		return  _configManager
	endFunction
endProperty


; INITIALIZATION ----------------------------------------------------------------------------------

event OnInit()
	OnGameReload()
endEvent

; @implements SKI_QuestBase
event OnGameReload()
	if (!_initialized)
		_initialized = true

		; 0 startValue
		; 1 defaultValue
		; 2 minValue
		; 3 maxValue
		; 4 interval
		_sliderParams	= new float[5]

		; 0 startIndex
		; 1 defaultIndex
		_menuParams		= new int[2]

		; 0 currentColor
		; 1 defaultColor
		_colorParams	= new int[2]

		OnConfigInit()

		Debug.Trace(self + " INITIALIZED")
	endIf

	RegisterForModEvent("SKICP_configManagerReady", "OnConfigManagerReady")
	RegisterForModEvent("SKICP_configManagerReset", "OnConfigManagerReset")

	CheckVersion()
endEvent


; EVENTS ------------------------------------------------------------------------------------------

; @interface
event OnConfigInit()
	{Called when this config menu is initialized}
endEvent

; @interface
event OnConfigRegister()
	{Called when this config menu registered at the control panel}
endEvent

; @interface
event OnConfigOpen()
	{Called when this config menu is opened}
endEvent

; @interface
event OnConfigClose()
	{Called when this config menu is closed}
endEvent

; @interface(SKI_QuestBase)
event OnVersionUpdate(int a_version)
	{Called when a version update of this script has been detected}
endEvent

; @interface
event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}
endEvent

; @interface
event OnOptionHighlight(int a_option)
	{Called when highlighting an option}
endEvent

; @interface
event OnOptionSelect(int a_option)
	{Called when a non-interactive option has been selected}
endEvent

; @interface
event OnOptionDefault(int a_option)
	{Called when resetting an option to its default value}
endEvent

; @interface
event OnOptionSliderOpen(int a_option)
	{Called when a slider option has been selected}
endEvent

; @interface
event OnOptionSliderAccept(int a_option, float a_value)
	{Called when a new slider value has been accepted}
endEvent

; @interface
event OnOptionMenuOpen(int a_option)
	{Called when a menu option has been selected}
endEvent

; @interface
event OnOptionMenuAccept(int a_option, int a_index)
	{Called when a menu entry has been accepted}
endEvent

; @interface
event OnOptionColorOpen(int a_option)
	{Called when a color option has been selected}
endEvent

; @interface
event OnOptionColorAccept(int a_option, int a_color)
	{Called when a new color has been accepted}
endEvent

; @interface
event OnOptionKeyMapChange(int a_option, int a_keyCode, string a_conflictControl, string a_conflictName)
	{Called when a key has been remapped}
endEvent

; @interface
event OnHighlightST()
	{Called when highlighting a state option}
endEvent

; @interface
event OnSelectST()
	{Called when a non-interactive state option has been selected}
endEvent

; @interface
event OnDefaultST()
	{Called when resetting a state option to its default value}
endEvent

; @interface
event OnSliderOpenST()
	{Called when a slider state option has been selected}
endEvent

; @interface
event OnSliderAcceptST(float a_value)
	{Called when a new slider state value has been accepted}
endEvent

; @interface
event OnMenuOpenST()
	{Called when a menu state option has been selected}
endEvent

; @interface
event OnMenuAcceptST(int a_index)
	{Called when a menu entry has been accepted for this state option}
endEvent

; @interface
event OnColorOpenST()
	{Called when a color state option has been selected}
endEvent

; @interface
event OnColorAcceptST(int a_color)
	{Called when a new color has been accepted for this state option}
endEvent

; @interface
event OnKeyMapChangeST(int a_keyCode, string a_conflictControl, string a_conflictName)
	{Called when a key has been remapped for this state option}
endEvent

event OnConfigManagerReset(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	_configManager = none
endEvent

event OnConfigManagerReady(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	SKI_ConfigManager newManager = a_sender as SKI_ConfigManager
	; Already registered?
	if (_configManager == newManager || newManager == none)
		return
	endIf

	_configID = newManager.RegisterMod(self, ModName)

	; Success
	if (_configID >= 0)
		_configManager = newManager
		OnConfigRegister()
		Debug.Trace(self + ": Registered " + ModName + " at MCM.")
	endIf
 endEvent

event OnMessageDialogClose(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	_messageResult = a_numArg as bool
	_waitForMessage = false
endEvent


; FUNCTIONS ---------------------------------------------------------------------------------------

; @interface(SKI_QuestBase)
int function GetVersion()
	{Returns version of this script}
	return 1
endFunction

; @interface
string function GetCustomControl(int a_keyCode)
	{Returns the name of a custom control mapped to given keyCode, or "" if the key is not in use by this config}
	return ""
endFunction

; @interface
function ForcePageReset()
	{Forces a full reset of the current page}
	if (!_isBackupMode)
		UI.Invoke(JOURNAL_MENU, MENU_ROOT + ".forcePageReset")
	endif
endFunction

; @interface
function SetTitleText(string a_text)
	UI.InvokeString(JOURNAL_MENU, MENU_ROOT + ".setTitleText", a_text)
endFunction

; @interface
function ForceInfoText(string a_text)
	_infoText = a_text
	
	UI.InvokeString(JOURNAL_MENU, MENU_ROOT + ".setInfoText", _infoText)
endFunction

; @interface
function SetInfoText(string a_text)
	_infoText = a_text
endFunction

; @interface
function SetCursorPosition(int a_position)
	if (a_position < 128)
		if (_isBackupMode)
			_bak_cursorPosition = a_position
		else
			_cursorPosition = a_position
		endif
	endIf
endFunction

; @interface
function SetCursorFillMode(int a_fillMode)
	if (a_fillMode == LEFT_TO_RIGHT || a_fillMode == TOP_TO_BOTTOM)
		if (_isBackupMode)
			_bak_cursorFillMode = a_fillMode
		else
			_cursorFillMode = a_fillMode
		endif
	endIf
endFunction

; @interface
int function AddEmptyOption()
	return AddOption(OPTION_TYPE_EMPTY, none, none, 0, 0)
endFunction

; @interface
int function AddHeaderOption(string a_text, int a_flags = 0)
	return AddOption(OPTION_TYPE_HEADER, a_text, none, 0, a_flags)
endFunction

; @interface
int function AddTextOption(string a_text, string a_value, int a_flags = 0)
	return AddOption(OPTION_TYPE_TEXT, a_text, a_value, 0, a_flags)
endFunction

; @interface
int function AddToggleOption(string a_text, bool a_checked, int a_flags = 0)
	return AddOption(OPTION_TYPE_TOGGLE, a_text, none, a_checked as int, a_flags)
endfunction

; @interface
int function AddSliderOption(string a_text, float a_value, string a_formatString = "{0}", int a_flags = 0)
	return AddOption(OPTION_TYPE_SLIDER, a_text, a_formatString, a_value, a_flags)
endFunction

; @interface
int function AddMenuOption(string a_text, string a_value, int a_flags = 0)
	return AddOption(OPTION_TYPE_MENU, a_text, a_value, 0, a_flags)
endFunction

; @interface
int function AddColorOption(string a_text, int a_color, int a_flags = 0)
	return AddOption(OPTION_TYPE_COLOR, a_text, none, a_color, a_flags)
endFunction

; @interface
int function AddKeyMapOption(string a_text, int a_keyCode, int a_flags = 0)
	return AddOption(OPTION_TYPE_KEYMAP, a_text, none, a_keyCode, a_flags)
endFunction

; @interface
function AddTextOptionST(string a_stateName, string a_text, string a_value, int a_flags = 0)
	AddOptionST(a_stateName, OPTION_TYPE_TEXT, a_text, a_value, 0, a_flags)
endFunction

; @interface
function AddToggleOptionST(string a_stateName, string a_text, bool a_checked, int a_flags = 0)
	AddOptionST(a_stateName, OPTION_TYPE_TOGGLE, a_text, none, a_checked as int, a_flags)
endfunction

; @interface
function AddSliderOptionST(string a_stateName, string a_text, float a_value, string a_formatString = "{0}", int a_flags = 0)
	AddOptionST(a_stateName, OPTION_TYPE_SLIDER, a_text, a_formatString, a_value, a_flags)
endFunction

; @interface
function AddMenuOptionST(string a_stateName, string a_text, string a_value, int a_flags = 0)
	AddOptionST(a_stateName, OPTION_TYPE_MENU, a_text, a_value, 0, a_flags)
endFunction

; @interface
function AddColorOptionST(string a_stateName, string a_text, int a_color, int a_flags = 0)
	AddOptionST(a_stateName, OPTION_TYPE_COLOR, a_text, none, a_color, a_flags)
endFunction

; @interface
function AddKeyMapOptionST(string a_stateName, string a_text, int a_keyCode, int a_flags = 0)
	AddOptionST(a_stateName, OPTION_TYPE_KEYMAP, a_text, none, a_keyCode, a_flags)
endFunction

; @interface
function LoadCustomContent(string a_source, float a_x = 0.0, float a_y = 0.0)
	if (_isBackupMode)
		return
	endif
	
	float[] params = new float[2]
	params[0] = a_x
	params[1] = a_y
	UI.InvokeFloatA(JOURNAL_MENU, MENU_ROOT + ".setCustomContentParams", params)
	UI.InvokeString(JOURNAL_MENU, MENU_ROOT + ".loadCustomContent", a_source)
endFunction

; @interface
function UnloadCustomContent()
	if (_isBackupMode)
		return
	endif

	UI.Invoke(JOURNAL_MENU, MENU_ROOT + ".unloadCustomContent")
endFunction

; @interface
function SetOptionFlags(int a_option, int a_flags, bool a_noUpdate = false)
	if (_isBackupMode)
		return
	endif

	if (_state == STATE_RESET)
		Error("Cannot set option flags while in OnPageReset(). Pass flags to AddOption instead")
		return
	endIf

	int index = a_option % 0x100

	; Update flags buffer
	int oldFlags = _optionFlagsBuf[index] as int
	oldFlags %= 0x100 			; Clear upper bytes, keep type
	oldFlags += a_flags * 0x100	; Set new flags

	; Update display
	int[] params = new int[2]
	params[0] = index
	params[1] = a_flags
	UI.InvokeIntA(JOURNAL_MENU, MENU_ROOT + ".setOptionFlags", params)

	if (!a_noUpdate)
		UI.Invoke(JOURNAL_MENU, MENU_ROOT + ".invalidateOptionData")
	endIf
endFunction

; YeOlde
function ResetTextOptionValues(int a_option, string a_text, string a_value, bool a_noUpdate = false)
	{Modify a specific TextOption text & value}
	Log("ResetTextOptionValue(" + a_option + ", " + a_text + ", " + a_value + ") -> BackupMode: " + _isBackupMode)


	int index = a_option % 0x100
	int type = _optionFlagsBuf[index] % 0x100

	if (type != OPTION_TYPE_TEXT)
		int pageIdx = ((a_option / 0x100) as int) - 1
		if (pageIdx != -1)
			Error("Option type mismatch. Expected text option, page \"" + Pages[pageIdx] + "\", index " + index)
		else
			Error("Option type mismatch. Expected text option, page \"\", index " + index)
		endIf
		return
	endIf
	
	string menu = JOURNAL_MENU
	string root = MENU_ROOT
	
	_textBuf[index] = a_text
	_strValueBuf[index] = a_value

	UI.SetInt(menu, root + ".optionCursorIndex", index)
	UI.SetString(menu, root + ".optionCursor.text", a_text)
	UI.SetString(menu, root + ".optionCursor.strValue", a_value)
	if (!a_noUpdate)
		UI.Invoke(menu, root + ".invalidateOptionData")
	endIf
endFunction

; @interface
function SetTextOptionValue(int a_option, string a_value, bool a_noUpdate = false)
	Log("SetTextOptionValue(" + a_option + ", " + a_value + ") -> BackupMode: " + _isBackupMode)
	if (_isBackupMode)
		int index = a_option % 0x100
		SetOptionStrValue(index, a_value, a_noUpdate)
		return
	endif

	int index = a_option % 0x100
	int type = _optionFlagsBuf[index] % 0x100

	if (type != OPTION_TYPE_TEXT)
		int pageIdx = ((a_option / 0x100) as int) - 1
		if (pageIdx != -1)
			Error("Option type mismatch. Expected text option, page \"" + Pages[pageIdx] + "\", index " + index)
		else
			Error("Option type mismatch. Expected text option, page \"\", index " + index)
		endIf
		return
	endIf

	SetOptionStrValue(index, a_value, a_noUpdate)
endFunction

; @interface
function SetToggleOptionValue(int a_option, bool a_checked, bool a_noUpdate = false)
	if (_isBackupMode)
		int index = a_option % 0x100
		SetOptionNumValue(index, a_checked as int, a_noUpdate)
		return
	endif

	int index = a_option % 0x100
	int type = _optionFlagsBuf[index] % 0x100

	if (type != OPTION_TYPE_TOGGLE)
		int pageIdx = ((a_option / 0x100) as int) - 1
		if (pageIdx != -1)
			Error("Option type mismatch. Expected toggle option, page \"" + Pages[pageIdx] + "\", index " + index)
		else
			Error("Option type mismatch. Expected toggle option, page \"\", index " + index)
		endIf
		return
	endIf

	SetOptionNumValue(index, a_checked as int, a_noUpdate)
endfunction

; @interface
function SetSliderOptionValue(int a_option, float a_value, string a_formatString = "{0}", bool a_noUpdate = false)
	if (_isBackupMode)
		int index = a_option % 0x100
		SetOptionValues(index, a_formatString, a_value, a_noUpdate)
		Return
	endif

	int index = a_option % 0x100
	int type = _optionFlagsBuf[index] % 0x100

	if (type != OPTION_TYPE_SLIDER)
		int pageIdx = ((a_option / 0x100) as int) - 1
		if (pageIdx != -1)
			Error("Option type mismatch. Expected slider option, page \"" + Pages[pageIdx] + "\", index " + index)
		else
			Error("Option type mismatch. Expected slider option, page \"\", index " + index)
		endIf
		return
	endIf

	SetOptionValues(index, a_formatString, a_value, a_noUpdate)
endFunction

; @interface
function SetMenuOptionValue(int a_option, string a_value, bool a_noUpdate = false)
	if (_isBackupMode)
		int index = a_option % 0x100
		SetOptionStrValue(index, a_value, a_noUpdate)
		return
	endif

	Log("SetMenuOptionValue(" + a_option + ", " + a_value + ")")
	int index = a_option % 0x100
	int type = _optionFlagsBuf[index] % 0x100

	if (type != OPTION_TYPE_MENU)
		int pageIdx = ((a_option / 0x100) as int) - 1
		if (pageIdx != -1)
			Error("Option type mismatch. Expected menu option, page \"" + Pages[pageIdx] + "\", index " + index)
		else
			Error("Option type mismatch. Expected menu option, page \"\", index " + index)
		endIf
		return
	endIf

	SetOptionStrValue(index, a_value, a_noUpdate)
endFunction

; @interface
function SetColorOptionValue(int a_option, int a_color, bool a_noUpdate = false)
	if (_isBackupMode)
		int index = a_option % 0x100
		SetOptionNumValue(index, a_color, a_noUpdate)
		return
	endif

	int index = a_option % 0x100
	int type = _optionFlagsBuf[index] % 0x100

	if (type != OPTION_TYPE_COLOR)
		int pageIdx = ((a_option / 0x100) as int) - 1
		if (pageIdx != -1)
			Error("Option type mismatch. Expected color option, page \"" + Pages[pageIdx] + "\", index " + index)
		else
			Error("Option type mismatch. Expected color option, page \"\", index " + index)
		endIf
		return
	endIf

	SetOptionNumValue(index, a_color, a_noUpdate)
endFunction

; @interface
function SetKeyMapOptionValue(int a_option, int a_keyCode, bool a_noUpdate = false)
	if (_isBackupMode)
		int index = a_option % 0x100
		SetOptionNumValue(index, a_keyCode, a_noUpdate)
		return
	endif

	int index = a_option % 0x100
	int type = _optionFlagsBuf[index] % 0x100

	if (type != OPTION_TYPE_KEYMAP)
		int pageIdx = ((a_option / 0x100) as int) - 1
		if (pageIdx != -1)
			Error("Option type mismatch. Expected keymap option, page \"" + Pages[pageIdx] + "\", index " + index)
		else
			Error("Option type mismatch. Expected keymap option, page \"\", index " + index)
		endIf
		return
	endIf

	SetOptionNumValue(index, a_keyCode, a_noUpdate)
endFunction

; @interface
function SetOptionFlagsST(int a_flags, bool a_noUpdate = false, string a_stateName = "")
	if (_state == STATE_RESET)
		Error("Cannot set option flags while in OnPageReset(). Pass flags to AddOption instead")
		return
	endIf

	int index = GetStateOptionIndex(a_stateName)
	if (index < 0)
		Error("Cannot use SetOptionFlagsST outside a valid option state")
		return
	endIf

	SetOptionFlags(index, a_flags, a_noUpdate)
endFunction

; @interface
function SetTextOptionValueST(string a_value, bool a_noUpdate = false, string a_stateName = "")
	int index = GetStateOptionIndex(a_stateName)
	if (index < 0)
		Error("Cannot use SetTextOptionValueST outside a valid option state (val: " + a_value + ", state:" + a_stateName + ")")
		return
	endIf

	SetTextOptionValue(index, a_value, a_noUpdate)
endFunction

; @interface
function SetToggleOptionValueST(bool a_checked, bool a_noUpdate = false, string a_stateName = "")
	int index = GetStateOptionIndex(a_stateName)
	if (index < 0)
		Error("Cannot use SetToggleOptionValueST outside a valid option state")
		return
	endIf

	SetToggleOptionValue(index, a_checked, a_noUpdate)
endFunction

; @interface
function SetSliderOptionValueST(float a_value, string a_formatString = "{0}", bool a_noUpdate = false, string a_stateName = "")
	int index = GetStateOptionIndex(a_stateName)
	if (index < 0)
		Error("Cannot use SetSliderOptionValueST outside a valid option state")
		return
	endIf

	SetSliderOptionValue(index, a_value, a_formatString, a_noUpdate)
endFunction

; @interface
function SetMenuOptionValueST(string a_value, bool a_noUpdate = false, string a_stateName = "")
	int index = GetStateOptionIndex(a_stateName)
	if (index < 0)
		Error("Cannot use SetMenuOptionValueST outside a valid option state")
		return
	endIf

	SetMenuOptionValue(index, a_value, a_noUpdate)
endFunction

; @interface
function SetColorOptionValueST(int a_color, bool a_noUpdate = false, string a_stateName = "")
	int index = GetStateOptionIndex(a_stateName)
	if (index < 0)
		Error("Cannot use SetColorOptionValueST outside a valid option state")
		return
	endIf

	SetColorOptionValue(index, a_color, a_noUpdate)
endFunction

; @interface
function SetKeyMapOptionValueST(int a_keyCode, bool a_noUpdate = false, string a_stateName = "")
	int index = GetStateOptionIndex(a_stateName)
	if (index < 0)
		Error("Cannot use SetKeyMapOptionValueST outside a valid option state")
		return
	endIf

	SetKeyMapOptionValue(index, a_keyCode, a_noUpdate)
endFunction

; @interface
function SetSliderDialogStartValue(float a_value)
	if (_isBackupMode)
		return
	endif
	if (_state != STATE_SLIDER)
		Error("Cannot set slider dialog params while outside OnOptionSliderOpen()")
		return
	endIf

	_sliderParams[0] = a_value
endFunction

; @interface
function SetSliderDialogDefaultValue(float a_value)
	if (_isBackupMode)
		return
	endif

	if (_state != STATE_SLIDER)
		Error("Cannot set slider dialog params while outside OnOptionSliderOpen()")
		return
	endIf

	_sliderParams[1] = a_value
endFunction

; @interface
function SetSliderDialogRange(float a_minValue, float a_maxValue)
	if (_isBackupMode)
		return
	endif

	if (_state != STATE_SLIDER)
		Error("Cannot set slider dialog params while outside OnOptionSliderOpen()")
		return
	endIf

	_sliderParams[2] = a_minValue
	_sliderParams[3] = a_maxValue
endFunction

; @interface
function SetSliderDialogInterval(float a_value)
	if (_isBackupMode)
		return
	endif

	if (_state != STATE_SLIDER)
		Error("Cannot set slider dialog params while outside OnOptionSliderOpen()")
		return
	endIf

	_sliderParams[4] = a_value
endFunction

; @interface
function SetMenuDialogStartIndex(int a_value)
	if (_isBackupMode)
		return
	endif

	if (_state != STATE_MENU)
		Error("Cannot set menu dialog params while outside OnOptionMenuOpen()")
		return
	endIf

	_menuParams[0] = a_value
endFunction

; @interface
function SetMenuDialogDefaultIndex(int a_value)
	if (_isBackupMode)
		return
	endif

	if (_state != STATE_MENU)
		Error("Cannot set menu dialog params while outside OnOptionMenuOpen()")
		return
	endIf

	_menuParams[1] = a_value
endFunction

; @interface
function SetMenuDialogOptions(string[] a_options)
	if (_isBackupMode)
		_currentMenuOptions = a_options
		return
	endif

	if (_state != STATE_MENU)
		Error("Cannot set menu dialog params while outside OnOptionMenuOpen()")
		return
	endIf

	; YeOlde - we keep this in case we are importing data.
	_currentMenuOptions = a_options

	UI.InvokeStringA(JOURNAL_MENU, MENU_ROOT + ".setMenuDialogOptions", a_options)
endFunction

; @interface
function SetColorDialogStartColor(int a_color)
	if (_isBackupMode)
		return
	endif

	if (_state != STATE_COLOR)
		Error("Cannot set color dialog params while outside OnOptionColorOpen()")
		return
	endIf

	_colorParams[0] = a_color
endFunction

; @interface
function SetColorDialogDefaultColor(int a_color)
	if (_isBackupMode)
		return
	endif

	if (_state != STATE_COLOR)
		Error("Cannot set color dialog params while outside OnOptionColorOpen()")
		return
	endIf

	_colorParams[1] = a_color
endFunction

; @interface
bool function ShowMessage(string a_message, bool a_withCancel = true, string a_acceptLabel = "$Accept", string a_cancelLabel = "$Cancel")
	if (_waitForMessage)
		Error("Called ShowMessage() while another message was already open")
		return false
	endIf

	_waitForMessage = true
	_messageResult = false

	string[] params = new string[3]
	params[0] = a_message
	params[1] = a_acceptLabel
	if (a_withCancel)
		params[2] = a_cancelLabel
	else
		params[2] = ""
	endIf

	RegisterForModEvent("SKICP_messageDialogClosed", "OnMessageDialogClose")
	UI.InvokeStringA(JOURNAL_MENU, MENU_ROOT + ".showMessageDialog", params)

	; Wait for result
	while (_waitForMessage)
		Utility.WaitMenuMode(0.1)
	endWhile

	UnregisterForModEvent("SKICP_messageDialogClosed")

	return _messageResult
endFunction

function Error(string a_msg)
	Debug.Trace(self + " ERROR: " +  a_msg)
endFunction

function OpenConfig()
	; Alloc
	_optionFlagsBuf	= new int[128]
	_textBuf		= new string[128]
	_strValueBuf	= new string[128]
	_numValueBuf	= new float[128]
	_stateOptionMap	= new string[128]

	SetPage("", -1)

	OnConfigOpen()

	UI.InvokeStringA(JOURNAL_MENU, MENU_ROOT + ".setPageNames", Pages)
endFunction

function CloseConfig()
	OnConfigClose()
	ClearOptionBuffers()
	_waitForMessage = false

	; Free
	_optionFlagsBuf	= new int[1]
	_textBuf		= new string[1]
	_strValueBuf	= new string[1]
	_numValueBuf	= new float[1]
	_stateOptionMap	= new string[1]
endFunction

; YeOlde
function FakeSetPage(string a_page, int a_index)
	{Simulate a set page option, used to parse all page option values}
	_bak_currentPage = a_page
	_bak_currentPageNum = 1+a_index

	ClearOptionBuffers()	
	OnPageReset(a_page)
endFunction

function SetPage(string a_page, int a_index)
	_currentPage = a_page
	_currentPageNum = 1+a_index

	; Set default title, can be overridden in OnPageReset
	if (a_page != "")
		SetTitleText(a_page)
	else
		SetTitleText(ModName)
	endIf

	ClearOptionBuffers()
	_state = STATE_RESET
	OnPageReset(a_page)
	_state = STATE_DEFAULT
	WriteOptionBuffers()
endFunction

int function AddOption(int a_optionType, string a_text, string a_strValue, float a_numValue, int a_flags)
	Log("AddOption(" + a_optionType + ", " + a_text + ", " + a_strValue + ", " + a_numValue + ")")
	if (_isBackupMode)
		int pos = _bak_cursorPosition
		Log("AddOption() -> _bak_cursorPosition: " + _bak_cursorPosition)
		if (pos == -1)
			return -1 ; invalid
		endIf
		Log("AddOption() -> Storing variables")
		_bak_optionFlagsBuf[pos] = a_optionType + a_flags * 0x100
		_bak_textBuf[pos] = a_text
		_bak_strValueBuf[pos] = a_strValue
		_bak_numValueBuf[pos] = a_numValue
	
		; Just use numerical value of fill mode
		_bak_cursorPosition += _bak_cursorFillMode
		if (_bak_cursorPosition >= 128)
			_bak_cursorPosition = -1
		endIf
		
		return pos
	endif
	
	if (_state != STATE_RESET)
		Error("Cannot add option " + a_text + " outside of OnPageReset()")
		return -1
	endIf

	int pos = _cursorPosition
	if (pos == -1)
		return -1 ; invalid
	endIf

	_optionFlagsBuf[pos] = a_optionType + a_flags * 0x100
	_textBuf[pos] = a_text
	_strValueBuf[pos] = a_strValue
	_numValueBuf[pos] = a_numValue

	; Just use numerical value of fill mode
	_cursorPosition += _cursorFillMode
	if (_cursorPosition >= 128)
		_cursorPosition = -1
	endIf

	; byte 1 - position
	; byte 2 - page
	return pos + _currentPageNum * 0x100
endFunction

function AddOptionST(string a_stateName, int a_optionType, string a_text, string a_strValue, float a_numValue, int a_flags)
	if (_isBackupMode)
		int index = AddOption(a_optionType, a_text, a_strValue, a_numValue, a_flags)
		if (index < 0)
			return
		endIf
		
		_bak_stateOptionMap[index] = a_stateName
		return
	endif

	if (_stateOptionMap.find(a_stateName) != -1)
		Error("State option name " + a_stateName + " is already in use")
		return
	endIf

	int index = AddOption(a_optionType, a_text, a_strValue, a_numValue, a_flags) % 0x100
	if (index < 0)
		return
	endIf

	if (_stateOptionMap[index] != "")
		Error("State option index " + index + " already in use")
		return
	endIf

	_stateOptionMap[index] = a_stateName
endFunction

int function GetStateOptionIndex(string a_stateName)
	if (a_stateName == "")
		a_stateName = GetState()
	endIf

	if (a_stateName == "")
		return -1
	endIf

	if(_isBackupMode)
		return _bak_stateOptionMap.find(a_stateName)
	endif

	return _stateOptionMap.find(a_stateName)
endFunction

function WriteOptionBuffers()
	string menu = JOURNAL_MENU
	string root = MENU_ROOT
	int t = OPTION_TYPE_EMPTY
	int i = 0
	int optionCount = 0;

	; Tell UI where to cut off the buffer
	i = 0
	while (i < 128)
		if (_optionFlagsBuf[i] != t)
			optionCount = i + 1
		endif
		i += 1
	endWhile

	UI.InvokeIntA(menu, root + ".setOptionFlagsBuffer", _optionFlagsBuf)
	UI.InvokeStringA(menu, root + ".setOptionTextBuffer", _textBuf)
	UI.InvokeStringA(menu, root + ".setOptionStrValueBuffer", _strValueBuf)
	UI.InvokeFloatA(menu, root + ".setOptionNumValueBuffer", _numValueBuf)
	UI.InvokeInt(menu, root + ".flushOptionBuffers", optionCount)
endFunction

function ClearOptionBuffers()
	Log("ClearOptionBuffers() -> _isBackupMode:" + _isBackupMode)
	if (_isBackupMode)
		int t = OPTION_TYPE_EMPTY
		int i = 0
		while (i < 128)
			_bak_optionFlagsBuf[i] = t
			_bak_textBuf[i] = ""
			_bak_strValueBuf[i] = ""
			_bak_numValueBuf[i] = 0

			; Also clear state map as it's tied to the buffers
			_bak_stateOptionMap[i] = ""
			i += 1
		endWhile

		_bak_cursorPosition	= 0
		_bak_cursorFillMode	= LEFT_TO_RIGHT
		return
	endif

	int t = OPTION_TYPE_EMPTY
	int i = 0
	while (i < 128)
		_optionFlagsBuf[i] = t
		_textBuf[i] = ""
		_strValueBuf[i] = ""
		_numValueBuf[i] = 0

		; Also clear state map as it's tied to the buffers
		_stateOptionMap[i] = ""
		i += 1
	endWhile

	_cursorPosition	= 0
	_cursorFillMode	= LEFT_TO_RIGHT
endFunction

function SetOptionStrValue(int a_index, string a_strValue, bool a_noUpdate)
	if(_isBackupMode)
		_bak_strValueBuf[a_index] = a_strValue
		return
	endif

	if (_state == STATE_RESET)
		Error("Cannot modify option data while in OnPageReset()")
		return
	endIf

	string menu = JOURNAL_MENU
	string root = MENU_ROOT
	
	_strValueBuf[a_index] = a_strValue

	UI.SetInt(menu, root + ".optionCursorIndex", a_index)
	UI.SetString(menu, root + ".optionCursor.strValue", a_strValue)
	if (!a_noUpdate)
		UI.Invoke(menu, root + ".invalidateOptionData")
	endIf
endFunction

function SetOptionNumValue(int a_index, float a_numValue, bool a_noUpdate)
	Log("SetOptionNumValue(" + a_index + ", " + a_numValue + ")")
	
	if(_isBackupMode)
		_bak_numValueBuf[a_index] = a_numValue
		return
	endif

	if (_state == STATE_RESET)
		Error("Cannot modify option data while in OnPageReset()")
		return
	endIf

	string menu = JOURNAL_MENU
	string root = MENU_ROOT

	_numValueBuf[a_index] = a_numValue

	UI.SetInt(menu, root + ".optionCursorIndex", a_index)
	UI.SetFloat(menu, root + ".optionCursor.numValue", a_numValue)
	if (!a_noUpdate)
		UI.Invoke(menu, root + ".invalidateOptionData")
	endIf
endFunction

function SetOptionValues(int a_index, string a_strValue, float a_numValue, bool a_noUpdate)
	
	if(_isBackupMode)
		_bak_numValueBuf[a_index] = a_numValue
		_bak_strValueBuf[a_index] = a_strValue
		return
	endif

	if (_state == STATE_RESET)
		Error("Cannot modify option data while in OnPageReset()")
		return
	endIf

	string menu = JOURNAL_MENU
	string root = MENU_ROOT

	UI.SetInt(menu, root + ".optionCursorIndex", a_index)
	UI.SetString(menu, root + ".optionCursor.strValue", a_strValue)
	UI.SetFloat(menu, root + ".optionCursor.numValue", a_numValue)
	if (!a_noUpdate)
		UI.Invoke(menu, root + ".invalidateOptionData")
	endIf
endFunction

function RequestSliderDialogData(int a_index)
	_activeOption = a_index + _currentPageNum * 0x100

	; Defaults
	_sliderParams[0] = 0
	_sliderParams[1] = 0
	_sliderParams[2] = 0
	_sliderParams[3] = 1
	_sliderParams[4] = 1

	_state = STATE_SLIDER

	string optionState = _stateOptionMap[a_index]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnSliderOpenST()
		gotoState(oldState)
	else
		OnOptionSliderOpen(_activeOption)
	endIf

	_state = STATE_DEFAULT

	UI.InvokeFloatA(JOURNAL_MENU, MENU_ROOT + ".setSliderDialogParams", _sliderParams)
endFunction

; YeOlde
function FakeRequestMenuDialogData(int a_index)
	{Simulate a Menu request, to receive and find the correct selected index}
	string optionState = _bak_stateOptionMap[a_index]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnMenuOpenST()
		gotoState(oldState)
	else
		OnOptionMenuOpen(a_index + _bak_currentPageNum * 0x100)
	endIf
endfunction

function RequestMenuDialogData(int a_index)
	_activeOption = a_index + _currentPageNum * 0x100

	; Defaults
	_menuParams[0] = -1
	_menuParams[1] = -1

	_state = STATE_MENU

	string optionState = _stateOptionMap[a_index]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnMenuOpenST()
		gotoState(oldState)
	else
		OnOptionMenuOpen(_activeOption)
	endIf

	_state = STATE_DEFAULT

	UI.InvokeIntA(JOURNAL_MENU, MENU_ROOT + ".setMenuDialogParams", _menuParams)
endFunction

function RequestColorDialogData(int a_index)
	_activeOption = a_index + _currentPageNum * 0x100

	; Defaults
	_colorParams[0] = -1
	_colorParams[1] = -1

	_state = STATE_COLOR

	string optionState = _stateOptionMap[a_index]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnColorOpenST()
		gotoState(oldState)
	else
		OnOptionColorOpen(_activeOption)
	endIf

	_state = STATE_DEFAULT

	UI.InvokeIntA(JOURNAL_MENU, MENU_ROOT + ".setColorDialogParams", _colorParams)
endFunction

; YeOlde
function ForceSliderOptionValue(int a_index, float a_value, string a_stateValue)
	{Set a specific value to a SliderOption, used when restoring saved data}
	if (a_stateValue != "")
		string oldState = GetState()
		gotoState(a_stateValue)
		OnSliderAcceptST(a_value)
		gotoState(oldState)
	else
		OnOptionSliderAccept(a_index + _bak_currentPageNum * 0x100, a_value)
	endIf
endfunction

function SetSliderValue(float a_value)
	string optionState = _stateOptionMap[_activeOption % 0x100]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnSliderAcceptST(a_value)
		gotoState(oldState)
	else
		OnOptionSliderAccept(_activeOption, a_value)
	endIf
	_activeOption = -1
endFunction

; YeOlde
function ForceMenuIndex(int a_optionIndex, int a_menuIndex, string a_stateValue)
	{Set a specific value to a OptionMenu, used when restoring saved data}
	if (a_stateValue != "")
		string oldState = GetState()
		gotoState(a_stateValue)
		OnMenuAcceptST(a_menuIndex)

		gotoState(oldState)
	else
		OnOptionMenuAccept(a_optionIndex + _bak_currentPageNum * 0x100, a_menuIndex)
	endIf
endFunction

function SetMenuIndex(int a_index)
	string optionState = _stateOptionMap[_activeOption % 0x100]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnMenuAcceptST(a_index)
		gotoState(oldState)
	else
		OnOptionMenuAccept(_activeOption, a_index)
	endIf
	_activeOption = -1
endFunction

; YeOlde
function ForceColorValue(int a_optionIndex, int a_color, string a_stateValue)
	{Set a specific value to a ColorOption, used when restoring saved data}
	if (a_stateValue != "")
		string oldState = GetState()
		gotoState(a_stateValue)
		OnColorAcceptST(a_color)

		gotoState(oldState)
	else
		OnOptionColorAccept(a_optionIndex + _bak_currentPageNum * 0x100, a_color)
	endIf
endFunction

function SetColorValue(int a_color)
	string optionState = _stateOptionMap[_activeOption % 0x100]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnColorAcceptST(a_color)
		gotoState(oldState)
	else
		OnOptionColorAccept(_activeOption, a_color)
	endIf
	_activeOption = -1
endFunction

; YeOlde
function ForceTextOption(int a_index, string a_strValue, string a_stateValue)
	{Set a specific value to a TextOption, used when restoring saved data}
	string originalValue = _bak_strValueBuf[a_index]
	if( originalValue != a_strValue)
		while (_bak_strValueBuf[a_index] != a_strValue)
			; Log("ForceTextOption loop - _strValueBuf: " + _strValueBuf[a_index] + ", a_strValue: " + a_strValue)
			if (a_stateValue != "")
				string oldState = GetState()
				gotoState(a_stateValue)
				OnSelectST()
				gotoState(oldState)
			else
				int option = a_index + _bak_currentPageNum * 0x100
				OnOptionSelect(option)
			endIf
		endwhile
	endif
endFunction

; YeOlde
function ForceToggleOption(int a_index, int a_numValue, string a_stateValue)
	{Set a specific state to a ToggleOption, used when restoring saved data}
	if (_bak_numValueBuf[a_index] != a_numValue)
		if (a_stateValue != "")
			string oldState = GetState()
			gotoState(a_stateValue)
			OnSelectST()
			gotoState(oldState)
		else
			OnOptionSelect(a_index + _bak_currentPageNum * 0x100)
		endIf
	endif
endFunction

function SelectOption(int a_index)
	string optionState = _stateOptionMap[a_index]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnSelectST()
		gotoState(oldState)
	else
		int option = a_index + _currentPageNum * 0x100
		OnOptionSelect(option)
	endIf
endFunction

; YeOlde
int function RestorePages(int jMod, yeolde_patches a_patcher)
	{Restore all option values to a page, used when importing some saved data}

	if (a_patcher.setActivePatch(ModName))
		return a_patcher.OnRestoreRequest(self, jMod)
	else
		return OnRestoreRequest(jMod)
	endif
endfunction

; YeOlde, @interface
; params:
;	- jMod: JMap id for restoring configs
int function OnRestoreRequest(int jMod)
	{Main function called for restoring a generic backup. Can be overwritten to personnalize}
	_isBackupMode = true
	
	; Open config
	_bak_optionFlagsBuf	= Utility.CreateIntArray(128, 0)
	_bak_textBuf		= Utility.CreateStringArray(128, "")
	_bak_strValueBuf	= Utility.CreateStringArray(128, "")
	_bak_numValueBuf	= Utility.CreateFloatArray(128, 0.0)
	_bak_stateOptionMap	= Utility.CreateStringArray(128, "")
		
	FakeSetPage("", -1) ; Default page
	OnConfigOpen()		
	
	; YeOlde
	; The default page is already opened. So we can backup it before looping in Pages.
	int jPage = JMap.getObj(jMod, "(none)")
	if (jPage > 0)
		Log("  RestorePages() -> Page '(none)'")
		_configManager.ShowBackupInfoMsg("Mod '" + ModName + "', page '(none)'...")
		RestorePageOptions(jPage)		
		_configManager.ShowBackupInfoMsg("Mod '" + ModName + "', page '(none)'... (DONE)")
	endif

	int i = 0
	while (i < Pages.Length)
		jPage = JMap.getObj(jMod, Pages[i])
		if (jPage > 0)
			string msg = "Mod '" + ModName + "', page '" + Pages[i] + "'..."
			Log("  RestorePages() -> " + msg)
			_configManager.ShowBackupInfoMsg(msg)
			FakeSetPage(Pages[i], i)
			RestorePageOptions(jPage)	
			_configManager.ShowBackupInfoMsg(msg + " (DONE)")
		else
			Log("  RestorePages() -> No backup for page '" + Pages[i] + "'")
		endif
		i += 1
	endwhile

	; Close config
	OnConfigClose()
	ClearOptionBuffers()
	_bak_optionFlagsBuf	= new int[1]
	_bak_textBuf		= new string[1]
	_bak_strValueBuf	= new string[1]
	_bak_numValueBuf	= new float[1]
	_bak_stateOptionMap	= new string[1]
	_isBackupMode = false

	return RESULT_SUCCESS
endfunction

; YeOlde, @interface
bool function IsBackupRestoreEnabled()	
	{When overwritten, it means that the mod supports YeOlde backup and restore tasks.}
	Log("IsBackupRestoreEnabled() -> return " + false)
	return false
endfunction

; YeOlde
int function BackupAllPagesOptions(yeolde_patches a_patcher)
	{Backup all option values from a page, used when backuping data}	
	Log("BackupAllPagesOptions() -> " + ModName)
	int jMod = ModConfig.createInstance(ModName)
	int result = 0
	
	if (a_patcher.setActivePatch(ModName))
		result = a_patcher.OnBackupRequest(self, jMod)
	else
		result = OnBackupRequest(jMod)
	endif
	
	if(result == 0)
		JValue.writeToFile(jMod, BackupConfig.GetDefaultBackupModDirectory() + ModName + ".json")
	endif
	JValue.release(jMod)
	JValue.zerolifetime(jMod)

	return result
endfunction

; YeOlde, @interface
; params:
;	- jMod: JMap id for backuping mod configs
int function OnBackupRequest(int jMod)
	{Main function called for creating a YeOlde backup. Can be overwritten to personnalize}	
	_isBackupMode = true
	bool configOpened = false
	
	; Open config
	_bak_optionFlagsBuf	= Utility.CreateIntArray(128, 0)
	_bak_textBuf		= Utility.CreateStringArray(128, "")
	_bak_strValueBuf	= Utility.CreateStringArray(128, "")
	_bak_numValueBuf	= Utility.CreateFloatArray(128, 0.0)
	_bak_stateOptionMap	= Utility.CreateStringArray(128, "")

			
	; YeOlde
	; The default page is already opened. So we can backup it before looping in Pages.
	Log("  BackupAllPagesOptions() -> Page '(none)'")		
	_configManager.ShowBackupInfoMsg("Mod '" + ModName + "', page '(none)'...")
	FakeSetPage("", -1) ; Default page
	OnConfigOpen()	
	BackupPageOptions(jMod)
	_configManager.ShowBackupInfoMsg("Mod '" + ModName + "', page '(none)'... (DONE)")
	configOpened = true
	

	int i = 0
	while (i < Pages.Length)
		string msg = "Mod '" + ModName + "', page '" + Pages[i] + "'"
		Log("  BackupAllPagesOptions() -> " + msg)

		_configManager.ShowBackupInfoMsg(msg + "...")
		FakeSetPage(Pages[i], i)
		if (!configOpened)				
			OnConfigOpen()	
			configOpened = true
		endif
		BackupPageOptions(jMod)		
		_configManager.ShowBackupInfoMsg(msg + "... (DONE)")
		i += 1
	endwhile

	ClearOptionBuffers()
	_bak_optionFlagsBuf	= new int[1]
	_bak_textBuf		= new string[1]
	_bak_strValueBuf	= new string[1]
	_bak_numValueBuf	= new float[1]
	_bak_stateOptionMap	= new string[1]
	_isBackupMode = false

	return RESULT_SUCCESS
endfunction

; YeOlde
function BackupPageOptions(int jMod)
	{Backup all options from a specific page. Used then creating a YeOlde backup}
	Log("BackupPageOptions() -> " + _bak_currentPage)

	string pagename = _bak_currentPage
	if (pagename == "")
		pagename = "(none)"
	endif
	string path = "." + self.ModName + "." + pagename + "."

	int jPage = ModConfig.addPage(jMod, pagename)
	Log("BackupPageOptions() -> jPage:" + jPage)

	int index = 0
	while (index < 128)
		if (_bak_stateOptionMap[index] != "" || _bak_textBuf[index] != "" || _bak_strValueBuf[index] != "" || _bak_numValueBuf[index] != 0)
			_bak_optionType = _bak_optionFlagsBuf[index] % 0x100
			if (_bak_optionType > 1) ; Skip EmptyOption (0) and HeaderOption (1)
				if (_bak_optionType == 0x05) ; MenuOption
					FakeRequestMenuDialogData(index)
					
					bool menuFound = false
					int menuIndex = 0
					while(menuIndex < _currentMenuOptions.Length && !menuFound)
						if (_currentMenuOptions[menuIndex] == _bak_strValueBuf[index])
							_bak_numValueBuf[index] = menuIndex
							; Log("    YeOlde::BackupPageOptions() -> Menu index found: index " + menuIndex + " for item '" + _bak_textBuf[index] + "'")
							menuFound = true
						endif
						menuIndex += 1
					endwhile
					if (!menuFound)
						; The "Sky UI" case: we fake a call for all indexes to know what are real values.
						Log("YeOlde::BackupPageOptions() -> Menu index not found, going for some fake menu calls...")

						string menuStrValue = _bak_strValueBuf[index]
						menuIndex = 0
						while(menuIndex < _currentMenuOptions.Length && !menuFound)
							; Log("  YeOlde::BackupPageOptions() -> ForceMenuIndex loop, item: " + _currentMenuOptions[menuIndex])
							ForceMenuIndex(index, menuIndex, _bak_stateOptionMap[index])
							; _bak_strValueBuf[index] value will have changed by now, so we validate if it's the one we
							;     are looking for.
							if (menuStrValue == _bak_strValueBuf[index])
								_bak_numValueBuf[index] = menuIndex
								; Log("    YeOlde::BackupPageOptions() -> Menu index found: index " + menuIndex + " for item '" + _bak_textBuf[index] + "'")
								menuFound = true
							endif

							menuIndex += 1
						endwhile
					endif
				endif
				; Backuping option
				PageConfig.addOption(jPage, index, _bak_optionType, _bak_strValueBuf[index], _bak_numValueBuf[index], _bak_stateOptionMap[index])
			endif
		endIf
		index += 1
	endwhile
endFunction

; YeOlde
function RestorePageOptions(int jPage)
	{Restore all option values to a specific page. Used when restoring a YeOlde backup}
	Log("RestorePageOptions() -> page '" + _bak_currentPage + "'")

	string pagename = _bak_currentPage
	if (pagename == "")
		pagename = "(none)"
	endif

	string[] options = JMap.allKeysPArray(jPage)
	
	int i = 0
	while (i < options.Length)
		int jOption = JMap.getObj(jPage, options[i])
		if (jOption > 0)
			int index = JMap.getInt(jOption, "id")
			int optType = JMap.getInt(jOption, "optionType")
			string strValue = JMap.getStr(jOption, "strValue")
			int intValue = JMap.getFlt(jOption, "fltValue") as int
			float floatValue = JMap.getFlt(jOption, "fltValue")
			string stateValue = JMap.getStr(jOption, "stateOption")
						
			if (optType == OPTION_TYPE_TEXT)
				ForceTextOption(index, strValue, stateValue)

			elseif (optType == OPTION_TYPE_TOGGLE)
				ForceToggleOption(index, intValue, stateValue)

			elseif (optType == OPTION_TYPE_SLIDER)
				ForceSliderOptionValue(index, floatValue, stateValue)

			elseif (optType == OPTION_TYPE_MENU)
				ForceMenuIndex(index, intValue, stateValue)

			elseif (optType == OPTION_TYPE_COLOR)
				ForceColorValue(index, intValue, stateValue)

			elseif (optType == OPTION_TYPE_KEYMAP)
				ForceRemapKey(index, intValue, stateValue)

			elseif (optType == OPTION_TYPE_INPUT)
				ForceInputText(index, strValue, stateValue)

			else
				; Header or empty
				Log("        optType value not valid -> " + optType)
			endif
		endif

		i += 1
	endwhile
endFunction

function ResetOption(int a_index)
	string optionState = _stateOptionMap[a_index]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnDefaultST()
		gotoState(oldState)
	else
		int option = a_index + _currentPageNum * 0x100
		OnOptionDefault(option)
	endIf
endFunction

function HighlightOption(int a_index)
	_infoText = ""

	if (a_index != -1)
		string optionState = _stateOptionMap[a_index]
		if (optionState != "")
			string oldState = GetState()
			gotoState(optionState)
			OnHighlightST()
			gotoState(oldState)
		else
			int option = a_index + _currentPageNum * 0x100
			OnOptionHighlight(option)
		endIf
	endIf

	UI.InvokeString(JOURNAL_MENU, MENU_ROOT + ".setInfoText", _infoText)
endFunction

; YeOlde
function ForceRemapKey(int a_index, int a_keyCode, string a_stateValue)
	{Set a specific value to a HotKey, used when restoring saved data}
	string optionState = _bak_stateOptionMap[a_index]
	if (a_stateValue != "")
		string oldState = GetState()
		gotoState(a_stateValue)
		OnKeyMapChangeST(a_keyCode, "", "")
		gotoState(oldState)
	else
		int option = a_index + _bak_currentPageNum * 0x100
		OnOptionKeyMapChange(option, a_keyCode, "", "")
	endIf
endFunction

function RemapKey(int a_index, int a_keyCode, string a_conflictControl, string a_conflictName)
	string optionState = _stateOptionMap[a_index]
	if (optionState != "")
		string oldState = GetState()
		gotoState(optionState)
		OnKeyMapChangeST(a_keyCode, a_conflictControl, a_conflictName)
		gotoState(oldState)
	else
		int option = a_index + _currentPageNum * 0x100
		OnOptionKeyMapChange(option, a_keyCode, a_conflictControl, a_conflictName)
	endIf
endFunction

function OnOptionInputOpen(Int a_option)
{Called when a text input option has been selected}
endFunction

function OnInputOpenST()
{Called when a text input state option has been selected}
endFunction

function OnOptionInputAccept(Int a_option, String a_input)
{Called when a new text input has been accepted}
endFunction

function OnInputAcceptST(String a_input)
{Called when a new text input has been accepted for this state option}
endFunction

function SetInputOptionValue(Int a_option, String a_value, Bool a_noUpdate)
	Int index = a_option % 256
	Int type = _optionFlagsBuf[index] % 256
	if type != self.OPTION_TYPE_INPUT
		Int pageIdx = a_option / 256 - 1
		if pageIdx != -1
			self.Error("Option type mismatch. Expected input option, page \"" + Pages[pageIdx] + "\", index " + index as String)
		else
			self.Error("Option type mismatch. Expected input option, page \"\", index " + index as String)
		endIf
		return
	endIf
	self.SetOptionStrValue(index, a_value, a_noUpdate)
endFunction

function SetInputOptionValueST(String a_value, Bool a_noUpdate, String a_stateName)
	Int index = self.GetStateOptionIndex(a_stateName)
	if index < 0
		self.Error("Cannot use SetInputOptionValueST outside a valid option state")
		return
	endIf
	self.SetInputOptionValue(index, a_value, a_noUpdate)
endFunction

function RequestInputDialogData(Int a_index)
	_activeOption = a_index + _currentPageNum * 0x100
	_state = self.STATE_INPUT
	String optionState = _stateOptionMap[a_index]
	if optionState != ""
		String oldState = self.GetState()
		self.GotoState(optionState)
		self.OnInputOpenST()
		self.GotoState(oldState)
	else
		self.OnOptionInputOpen(_activeOption)
	endIf
	_state = self.STATE_DEFAULT
	ui.InvokeString(self.JOURNAL_MENU, self.MENU_ROOT + ".setInputDialogParams", _inputStartText)
endFunction

Int function AddInputOption(String a_text, String a_value, Int a_flags)
	return self.AddOption(self.OPTION_TYPE_INPUT, a_text, a_value, 0 as Float, a_flags)
endFunction

function AddInputOptionST(String a_stateName, String a_text, String a_value, Int a_flags)
	self.AddOptionST(a_stateName, self.OPTION_TYPE_INPUT, a_text, a_value, 0 as Float, a_flags)
endFunction

function SetInputDialogStartText(String a_text)
	if _state != self.STATE_INPUT
		self.Error("Cannot set input dialog params while outside OnOptionInputOpen()")
		return
	endIf
	_inputStartText = a_text
endFunction

; YeOlde
function ForceInputText(int a_index, String a_text, string a_stateValue)
	{Set a specific value to a InputText option, used when restoring saved data}
	if a_stateValue != ""
		String oldState = self.GetState()
		self.GotoState(a_stateValue)
		self.OnInputAcceptST(a_text)

		self.GotoState(oldState)
	else
		int activeOption = a_index + _bak_currentPageNum * 0x100
		self.OnOptionInputAccept(activeOption, a_text)
	endIf
endFunction

function SetInputText(String a_text)
	String optionState
	if(_isBackupMode) 
		optionState = _bak_stateOptionMap[_activeOption % 0x100]
	else
		optionState = _stateOptionMap[_activeOption % 0x100]
	endif

	if optionState != ""
		String oldState = self.GetState()
		self.GotoState(optionState)
		self.OnInputAcceptST(a_text)
		self.GotoState(oldState)
	else
		self.OnOptionInputAccept(_activeOption, a_text)
	endIf
	_activeOption = -1
endFunction

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction