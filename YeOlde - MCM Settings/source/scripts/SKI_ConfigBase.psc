scriptname SKI_ConfigBase extends SKI_QuestBase

;##################################################################################################
; API Version:		4.1, edited for YeOlde - MCM Settings
;##################################################################################################
;
; Base script for custom config menus.
;
; This file contains the public interface of SKI_ConfigBase so you're able to extend it.
; For documentation, see https://github.com/schlangster/skyui/wiki/MCM-API-Reference.
; For YeOlde - MCM Settings changes, see https://sites.google.com/view/yeolde-settings/how-to-patch
;
; DO NOT MODIFY THIS SCRIPT!
; DO NOT RECOMPILE THIS SCRIPT!
;
;##################################################################################################


; CONSTANTS ---------------------------------------------------------------------------------------

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

int property		RESULT_SUCCESS			= 0 autoReadonly
int property		RESULT_ERROR_TIMEOUT	= -1 autoReadonly
int property		RESULT_ERROR_UNKNOWN	= 1 autoReadonly
int property		RESULT_ERROR_VERSION	= 2 autoReadonly


; PROPERTIES --------------------------------------------------------------------------------------

string property		ModName auto

string[] property	Pages auto

string property		CurrentPage
	string function get()
		Guard()
	endFunction
endProperty

SKI_ConfigManager property	ConfigManager
	SKI_ConfigManager function get()
		Guard()
	endFunction
endProperty


; INITIALIZATION ----------------------------------------------------------------------------------

event OnInit()
	OnGameReload()
endEvent

; @implements SKI_QuestBase
event OnGameReload()
	{Called when this config menu is initialized}
	Guard()
endEvent


; EVENTS ------------------------------------------------------------------------------------------

; @interface
event OnConfigInit()
	{Called when this config menu is initialized}
	Guard()
endEvent

; @interface
event OnConfigRegister()
	{Called when this config menu registered at the control panel}
	Guard()
endEvent

; @interface
event OnConfigOpen()
	{Called when this config menu is opened}
	Guard()
endEvent

; @interface
event OnConfigClose()
	{Called when this config menu is closed}
	Guard()
endEvent

; @interface(SKI_QuestBase)
event OnVersionUpdate(int a_version)
	{Called when a version update of this script has been detected}
	Guard()
endEvent

; @interface
event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}
	Guard()
endEvent

; @interface
event OnOptionHighlight(int a_option)
	{Called when highlighting an option}
	Guard()
endEvent

; @interface
event OnOptionSelect(int a_option)
	{Called when a non-interactive option has been selected}
	Guard()
endEvent

; @interface
event OnOptionDefault(int a_option)
	{Called when resetting an option to its default value}
	Guard()
endEvent

; @interface
event OnOptionSliderOpen(int a_option)
	{Called when a slider option has been selected}
	Guard()
endEvent

; @interface
event OnOptionSliderAccept(int a_option, float a_value)
	{Called when a new slider value has been accepted}
	Guard()
endEvent

; @interface
event OnOptionMenuOpen(int a_option)
	{Called when a menu option has been selected}
	Guard()
endEvent

; @interface
event OnOptionMenuAccept(int a_option, int a_index)
	{Called when a menu entry has been accepted}
	Guard()
endEvent

; @interface
event OnOptionColorOpen(int a_option)
	{Called when a color option has been selected}
	Guard()
endEvent

; @interface
event OnOptionColorAccept(int a_option, int a_color)
	{Called when a new color has been accepted}
	Guard()
endEvent

; @interface
event OnOptionKeyMapChange(int a_option, int a_keyCode, string a_conflictControl, string a_conflictName)
	{Called when a key has been remapped}
	Guard()
endEvent

; @interface
event OnHighlightST()
	{Called when highlighting a state option}
	Guard()
endEvent

; @interface
event OnSelectST()
	{Called when a non-interactive state option has been selected}
	Guard()
endEvent

; @interface
event OnDefaultST()
	{Called when resetting a state option to its default value}
	Guard()
endEvent

; @interface
event OnSliderOpenST()
	{Called when a slider state option has been selected}
	Guard()
endEvent

; @interface
event OnSliderAcceptST(float a_value)
	{Called when a new slider state value has been accepted}
	Guard()
endEvent

; @interface
event OnMenuOpenST()
	{Called when a menu state option has been selected}
	Guard()
endEvent

; @interface
event OnMenuAcceptST(int a_index)
	{Called when a menu entry has been accepted for this state option}
	Guard()
endEvent

; @interface
event OnColorOpenST()
	{Called when a color state option has been selected}
	Guard()
endEvent

; @interface
event OnColorAcceptST(int a_color)
	{Called when a new color has been accepted for this state option}
	Guard()
endEvent

; @interface
event OnKeyMapChangeST(int a_keyCode, string a_conflictControl, string a_conflictName)
	{Called when a key has been remapped for this state option}
	Guard()
endEvent

event OnConfigManagerReset(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	Guard()
endEvent

event OnConfigManagerReady(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	Guard()
 endEvent

event OnMessageDialogClose(string a_eventName, string a_strArg, float a_numArg, Form a_sender)
	Guard()
endEvent


; FUNCTIONS ---------------------------------------------------------------------------------------

; @interface(SKI_QuestBase)
int function GetVersion()
	{Returns version of this script. Override if necessary}
	Guard()
endFunction

; @interface
string function GetCustomControl(int a_keyCode)
	{Returns the name of a custom control mapped to given keyCode, or "" if the key is not in use by this config. Override if necessary}
	Guard()
endFunction

; @interface
function ForcePageReset()
	{Forces a full reset of the current page}
	Guard()
endFunction

; @interface
function SetTitleText(string a_text)
	{Sets the title text of the control panel}
	Guard()
endFunction

; @interface
function ForceInfoText(string a_text)
	{Force the text for the info text field below the option panel}
	Guard()
endFunction

; @interface
function SetInfoText(string a_text)
	{Sets the text for the info text field below the option panel}
	Guard()
endFunction

; @interface
function SetCursorPosition(int a_position)
	{Sets the position of the cursor used for the option setters}
	Guard()
endFunction

; @interface
function SetCursorFillMode(int a_fillMode)
	{Sets the fill direction of the cursor used for the option setters}
	Guard()
endFunction

; @interface
int function AddEmptyOption()
	{Adds an empty option, which can be used for padding instead of manually re-positioning the cursor}
	Guard()
endFunction

; @interface
int function AddHeaderOption(string a_text, int a_flags = 0)
	{Adds a header option to group several options together}
	Guard()
endFunction

; @interface
int function AddTextOption(string a_text, string a_value, int a_flags = 0)
	{Adds a generic text/value option}
	Guard()
endFunction

; @interface
int function AddToggleOption(string a_text, bool a_checked, int a_flags = 0)
	{Adds a check box option that can be toggled on and off}
	Guard()
endfunction

; @interface
int function AddSliderOption(string a_text, float a_value, string a_formatString = "{0}", int a_flags = 0)
	{Adds an option that opens a slider dialog when selected}
	Guard()
endFunction

; @interface
int function AddMenuOption(string a_text, string a_value, int a_flags = 0)
	{Adds an option that opens a menu dialog when selected}
	Guard()
endFunction

; @interface
int function AddColorOption(string a_text, int a_color, int a_flags = 0)
	{Adds an option that opens a color swatch dialog when selected}
	Guard()
endFunction

; @interface
int function AddKeyMapOption(string a_text, int a_keyCode, int a_flags = 0)
	{Adds a key mapping option}
	Guard()
endFunction

; @interface
function AddTextOptionST(string a_stateName, string a_text, string a_value, int a_flags = 0)
	{Adds a generic text/value state option}
	Guard()
endFunction

; @interface
function AddToggleOptionST(string a_stateName, string a_text, bool a_checked, int a_flags = 0)
	{Adds a check box state option that can be toggled on and off}
	Guard()
endfunction

; @interface
function AddSliderOptionST(string a_stateName, string a_text, float a_value, string a_formatString = "{0}", int a_flags = 0)
	{Adds a state option that opens a slider dialog when selected}
	Guard()
endFunction

; @interface
function AddMenuOptionST(string a_stateName, string a_text, string a_value, int a_flags = 0)
	{Adds a state option that opens a menu dialog when selected}
	Guard()
endFunction

; @interface
function AddColorOptionST(string a_stateName, string a_text, int a_color, int a_flags = 0)
	{Adds a state option that opens a color swatch dialog when selected}
	Guard()
endFunction

; @interface
function AddKeyMapOptionST(string a_stateName, string a_text, int a_keyCode, int a_flags = 0)
	{Adds a key mapping state option}
	Guard()
endFunction

; @interface
function LoadCustomContent(string a_source, float a_x = 0.0, float a_y = 0.0)
	{Loads an external file into the option panel}
	Guard()
endFunction

; @interface
function UnloadCustomContent()
	{Clears any custom content and re-enables the original option list}
	Guard()
endFunction

; @interface
function SetOptionFlags(int a_option, int a_flags, bool a_noUpdate = false)
	{Sets the option flags}
	Guard()
endFunction

; YeOlde
function ResetTextOptionValues(int a_option, string a_text, string a_value, bool a_noUpdate = false)
	{Modify a specific TextOption text & value}
	Guard()
endFunction

; @interface
function SetTextOptionValue(int a_option, string a_value, bool a_noUpdate = false)
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetToggleOptionValue(int a_option, bool a_checked, bool a_noUpdate = false)
	{Sets the value(s) of an existing option}
	Guard()
endfunction

; @interface
function SetSliderOptionValue(int a_option, float a_value, string a_formatString = "{0}", bool a_noUpdate = false)
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetMenuOptionValue(int a_option, string a_value, bool a_noUpdate = false)
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetColorOptionValue(int a_option, int a_color, bool a_noUpdate = false)
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetKeyMapOptionValue(int a_option, int a_keyCode, bool a_noUpdate = false)
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetOptionFlagsST(int a_flags, bool a_noUpdate = false, string a_stateName = "")
	{Sets the option flags}
	Guard()
endFunction

; @interface
function SetTextOptionValueST(string a_value, bool a_noUpdate = false, string a_stateName = "")
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetToggleOptionValueST(bool a_checked, bool a_noUpdate = false, string a_stateName = "")
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetSliderOptionValueST(float a_value, string a_formatString = "{0}", bool a_noUpdate = false, string a_stateName = "")
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetMenuOptionValueST(string a_value, bool a_noUpdate = false, string a_stateName = "")
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetColorOptionValueST(int a_color, bool a_noUpdate = false, string a_stateName = "")
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetKeyMapOptionValueST(int a_keyCode, bool a_noUpdate = false, string a_stateName = "")
	{Sets the value(s) of an existing option}
	Guard()
endFunction

; @interface
function SetSliderDialogStartValue(float a_value)
	{Sets slider dialog parameter(s)}
	Guard()
endFunction

; @interface
function SetSliderDialogDefaultValue(float a_value)
	{Sets slider dialog parameter(s)}
	Guard()
endFunction

; @interface
function SetSliderDialogRange(float a_minValue, float a_maxValue)
	{Sets slider dialog parameter(s)}
endFunction

; @interface
function SetSliderDialogInterval(float a_value)
	{Sets slider dialog parameter(s)}
	Guard()
endFunction

; @interface
function SetMenuDialogStartIndex(int a_value)
	{Sets menu dialog parameter(s)}
	Guard()
endFunction

; @interface
function SetMenuDialogDefaultIndex(int a_value)
	{Sets menu dialog parameter(s)}
	Guard()
endFunction

; @interface
function SetMenuDialogOptions(string[] a_options)
	{Sets menu dialog parameter(s)}
	Guard()
endFunction

; @interface
function SetColorDialogStartColor(int a_color)
	{Sets menu color parameter(s)}
	Guard()
endFunction

; @interface
function SetColorDialogDefaultColor(int a_color)
	{Sets menu color parameter(s)}
	Guard()
endFunction

; @interface
bool function ShowMessage(string a_message, bool a_withCancel = true, string a_acceptLabel = "$Accept", string a_cancelLabel = "$Cancel")
	{Shows a message dialog and waits until the user has closed it}
	Guard()
endFunction

function OpenConfig()
	Guard()
endFunction

function CloseConfig()
	Guard()
endFunction

; YeOlde
function FakeSetPage(string a_page, int a_index)
	{Simulate a set page option, used to parse all page option values}
	Guard()
endFunction

function SetPage(string a_page, int a_index)
	Guard()
endFunction

int function AddOption(int a_optionType, string a_text, string a_strValue, float a_numValue, int a_flags)
	Guard()
endFunction

function AddOptionST(string a_stateName, int a_optionType, string a_text, string a_strValue, float a_numValue, int a_flags)
	Guard()
endFunction

int function GetStateOptionIndex(string a_stateName)
	Guard()
endFunction

function WriteOptionBuffers()
	Guard()
endFunction

function ClearOptionBuffers()
	Guard()
endFunction

function SetOptionStrValue(int a_index, string a_strValue, bool a_noUpdate)
	Guard()
endFunction

function SetOptionNumValue(int a_index, float a_numValue, bool a_noUpdate)
	Guard()
endFunction

function SetOptionValues(int a_index, string a_strValue, float a_numValue, bool a_noUpdate)
	Guard()
endFunction

function RequestSliderDialogData(int a_index)
	Guard()
endFunction

; YeOlde
function FakeRequestMenuDialogData(int a_index)
	{Simulate a Menu request, to receive and find the correct selected index}
	Guard()
endfunction

function RequestMenuDialogData(int a_index)
	Guard()
endFunction

function RequestColorDialogData(int a_index)
	Guard()
endFunction

; YeOlde
function ForceSliderOptionValue(int a_index, float a_value, string a_stateValue)
	{Set a specific value to a SliderOption, used when restoring saved data}
	Guard()
endfunction

function SetSliderValue(float a_value)
	Guard()
endFunction

; YeOlde
function ForceMenuIndex(int a_optionIndex, int a_menuIndex, string a_stateValue)
	{Set a specific value to a OptionMenu, used when restoring saved data}
	Guard()
endFunction

function SetMenuIndex(int a_index)
	Guard()
endFunction

; YeOlde
function ForceColorValue(int a_optionIndex, int a_color, string a_stateValue)
	{Set a specific value to a ColorOption, used when restoring saved data}
	Guard()
endFunction

function SetColorValue(int a_color)
	Guard()
endFunction

; YeOlde
function ForceTextOption(int a_index, string a_strValue, string a_stateValue)
	{Set a specific value to a TextOption, used when restoring saved data}
	Guard()
endFunction

; YeOlde
function ForceToggleOption(int a_index, int a_numValue, string a_stateValue)
	{Set a specific state to a ToggleOption, used when restoring saved data}
	Guard()
endFunction

function SelectOption(int a_index)
	Guard()
endFunction

; YeOlde
int function RestorePages(int jMod, yeolde_patches a_patcher)
	{Restore all option values to a page, used when importing some saved data}
	Guard()
endfunction

; YeOlde, @interface
; params:
;	- jMod: JMap id for restoring configs
int function OnRestoreRequest(int jMod)
	Guard()
endfunction

; YeOlde, @interface
bool function IsBackupRestoreEnabled()	
	{When overwritten, it means that the mod supports YeOlde backup and restore tasks.}
	Guard()
endfunction

; YeOlde
int function BackupAllPagesOptions(yeolde_patches a_patcher)
	{Backup all option values from a page, used when backuping data}	
	Guard()
endfunction

; YeOlde, @interface
; params:
;	- jMod: JMap id for backuping mod configs
int function OnBackupRequest(int jMod)
	{Main function called for creating a YeOlde backup. Can be overwritten to personnalize}	
	Guard()
endfunction

; YeOlde
function BackupPageOptions(int jMod)
	Guard()
endFunction

; YeOlde
function RestorePageOptions(int jPage)
	{Restore all option values to a specific page. Used when restoring a YeOlde backup}
	Guard()
endFunction

function ResetOption(int a_index)
	Guard()
endFunction

function HighlightOption(int a_index)
	Guard()
endFunction

; YeOlde
function ForceRemapKey(int a_index, int a_keyCode, string a_stateValue)
	{Set a specific value to a HotKey, used when restoring saved data}
	Guard()
endFunction

function RemapKey(int a_index, int a_keyCode, string a_conflictControl, string a_conflictName)
	Guard()
endFunction

function OnOptionInputOpen(Int a_option)
	{Called when a text input option has been selected}
	Guard()
endFunction

function OnInputOpenST()
	{Called when a text input state option has been selected}
	Guard()
endFunction

function OnOptionInputAccept(Int a_option, String a_input)
	{Called when a new text input has been accepted}
	Guard()
endFunction

function OnInputAcceptST(String a_input)
	{Called when a new text input has been accepted for this state option}
	Guard()
endFunction

function SetInputOptionValue(Int a_option, String a_value, Bool a_noUpdate)
	Guard()
endFunction

function SetInputOptionValueST(String a_value, Bool a_noUpdate, String a_stateName)
	Guard()
endFunction

function RequestInputDialogData(Int a_index)
	Guard()
endFunction

Int function AddInputOption(String a_text, String a_value, Int a_flags)
	Guard()
endFunction

function AddInputOptionST(String a_stateName, String a_text, String a_value, Int a_flags)
	Guard()
endFunction

function SetInputDialogStartText(String a_text)
	Guard()
endFunction

; YeOlde
function ForceInputText(int a_index, String a_text, string a_stateValue)
	{Set a specific value to a InputText option, used when restoring saved data}
	Guard()
endFunction

function SetInputText(String a_text)
	Guard()
endFunction

function Guard()
	Debug.MessageBox("SKI_ConfigBase: Don't recompile this script!")
endFunction