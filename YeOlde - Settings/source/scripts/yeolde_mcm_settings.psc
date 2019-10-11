scriptname yeolde_mcm_settings extends SKI_ConfigBase

import Game
import StringUtil
import JsonUtil

SKI_ConfigManager property manager auto
string[] property _modNames auto
bool[] property _modEnableFlags auto
int[] property _modMenuToggle auto
int[] property _modMenuBackupInfos auto
int property _modMenuBackupInfosIndex auto

bool _useDefaultBlacklistFile = true

bool property UseDefaultBlacklistFile hidden
    bool function get()
        return _useDefaultBlacklistFile
    endFunction
endProperty

; ;  YeOlde - Respawn 
; int property YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID = 0x08005902 autoreadonly

; ;  YeOlde - Hybrid Loot  
; int property YEOLDE_VAR_AUTOLOOT_MODE_ID = 0x0800FB1A autoreadonly

; ;  YeOlde - Crafting Bag  
; int property YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID = 0x07000802 autoreadonly

; bool _crafting_bag_mod_activated
; bool _hybrid_loot_mod_activated
; bool _respawn_mod_activated


Actor _playerRef

; @overrides SKI_ConfigBase
event OnConfigInit()  
    _modMenuToggle = new int[128]
    _modMenuBackupInfosIndex = 0

    ; string pagesArrayStr = "MCM Menu Settings"
    
    Pages = new String[2]
    Pages[0] = "Show/hide menus"
    Pages[1] = "Import/export settings"

    ; if self.IsPluginInstalled("YeOlde - Crafting Bag.esp", YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID)
    ;     pagesArrayStr += ";YeOlde - Crafting Bag"
    ;     Log("OnConfigInit->Crafting bag installed")
    ; endif
    
    ; if self.IsPluginInstalled("YeOlde - Hybrid Loot.esp", YEOLDE_VAR_AUTOLOOT_MODE_ID)
    ;     pagesArrayStr += ";YeOlde - Hybrid Loot"
    ;     Log("OnConfigInit->Hybrid Loot installed")
    ; endif
    
    ; if self.IsPluginInstalled("YeOlde - Respawn.esp", YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID)
    ;     pagesArrayStr += ";YeOlde - Respawn"
    ;     Log("OnConfigInit->Respawn installed")
    ; endif

    ; if GetLength(pagesArrayStr) > 0
    ;     Pages = Split(pagesArrayStr, ";")
    ; endif
endEvent  

; bool function IsPluginInstalled(string pluginName, int formID)
;     return (Game.GetFormFromFile(formID, pluginName) != none) as bool
; endfunction

; @implements SKI_QuestBase
event OnGameReload()
	parent.OnGameReload()
	_playerRef = Game.GetPlayer()
endEvent

; @implements SKI_ConfigBase
event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}

    if a_page == ""
		self.LoadCustomContent("yeolde/settings_splash.dds", 0.000000, 0.000000)
		return 
    endIf

    self.UnloadCustomContent()
    _modNames = manager.GetAllModNames()
    _modEnableFlags = manager.GetAllEnabledModFlags()
    
    if a_page == "Show/hide menus"
        SetCursorFillMode(TOP_TO_BOTTOM)
        AddHeaderOption("Available MCM Menus")
        int index = 0
        while (index < _modNames.Length)
            if (_modNames[index] != "")
                int flag = OPTION_FLAG_NONE

                if (_modNames[index] == self.ModName)
                    flag = OPTION_FLAG_DISABLED
                endif

                _modMenuToggle[index] = AddToggleOption(_modNames[index], _modEnableFlags[index], flag)           
            endif
            index += 1
        endwhile  

        SetCursorPosition(1)
        AddHeaderOption("Debug / Panic button")
        AddTextOptionST("ForceMCMReset", "Press to reset MCM menus", "Press to reset")    
    
    elseif a_page == "Import/export settings"        
        ClearSkippedModList()

        SetCursorFillMode(TOP_TO_BOTTOM)
        AddHeaderOption("Import / Export MCM configurations")
        AddTextOptionST("MCMValuesBackup", "Backup your configs", "Press to backup")  
        AddEmptyOption()
        AddTextOptionST("ImportMCMValues", "Import last backup", "Press to import") 
        AddEmptyOption()
        AddHeaderOption("Debug")
        AddTextOptionST("ClearMCMBackup", "Clear MCM backup content", "Clear backup")
       

        SetCursorPosition(1)
        AddToggleOptionST("DefaultBlackList", "Use default Blacklist file", true)
        AddHeaderOption("Mods skipped during backup")
        _modMenuBackupInfos = Utility.CreateIntArray(25, 0)
        int iInfo = 0
        while (iInfo < _modMenuBackupInfos.Length)
            _modMenuBackupInfos[iInfo] = AddTextOption("", "")
            iInfo += 1
        endwhile
    
        ; elseif a_page == "YeOlde - Crafting Bag"
    ;     SetCursorFillMode(TOP_TO_BOTTOM)
    ;     AddHeaderOption("YeOlde - Crafting Bag")
    ;     ; TODO something!
    ; elseif a_page == "YeOlde - Hybrid Loot"
    ;     SetCursorFillMode(TOP_TO_BOTTOM)
    ;     AddHeaderOption("YeOlde - Hybrid Loot")
    ;     ; TODO something!
    ; elseif a_page == "YeOlde - Respawn"
    ;     SetCursorFillMode(TOP_TO_BOTTOM)
    ;     AddHeaderOption("YeOlde - Respawn")
    ;     ; TODO something!
    endif

endEvent

; @implements SKI_ConfigBase
event OnOptionSelect(int a_option)
    {Called when the user selects a non-dialog option}
    
    if (CurrentPage == Pages[0])
        int i = 0
        while (i<_modMenuToggle.Length)
            if (a_option == _modMenuToggle[i])
                int result = 0
                bool newState = !_modEnableFlags[i]

                if (newState)
                    result = manager.EnableModByName(_modNames[i])
                else
                    result = manager.DisableModByName(_modNames[i])
                endif

                if(result > -1)
                    _modEnableFlags[i] = newState
                    SetToggleOptionValue(a_option, newState)
                else
                    Log("SkyUI is busy, please try again...")
                endif
                return
            endif
            i += 1
        endwhile
    endif
endEvent

; @implements SKI_ConfigBase
event OnOptionDefault(int a_option)
	{Called when resetting an option to its default value}

    if (CurrentPage == Pages[0])
        int i = 0
        while (i<_modMenuToggle.Length)
            if (a_option == _modMenuToggle[i])
                int result = manager.EnableModByName(_modNames[i])

                if(result > -1)
                    _modEnableFlags[i] = true
                    SetToggleOptionValue(a_option, true)
                else
                    Log("SkyUI is busy, please try again...")
                endif
                return
            endif
            
            i += 1
        endwhile
    endif
endEvent


function UpdateBackupButtonText(string msg)
	SetTextOptionValueST(msg, false, "MCMValuesBackup")
endfunction


function UpdateImportButtonText(string msg)
	SetTextOptionValueST(msg, false, "ImportMCMValues")
endfunction


function UpdateInfoMsg(string msg)
	ForceInfoText(msg)
endfunction

function AddSkippedMod(string name)
    Log("AddSkippedMod(" + name + ")")
    ; TODO: ajouter une ligne à _modMenuBackupInfos et l'afficher sur l'interface du mod.
    ResetTextOptionValues(_modMenuBackupInfos[_modMenuBackupInfosIndex], name, "")
    _modMenuBackupInfosIndex += 1

    if (_modMenuBackupInfosIndex > _modMenuBackupInfos.Length - 1)
        _modMenuBackupInfosIndex = _modMenuBackupInfos.Length - 1
    endif
endfunction

function ClearSkippedModList()
    _modMenuBackupInfosIndex = 0
    int i = 0
    while (i<_modMenuBackupInfos.Length)
        if (_modMenuBackupInfos[i] > 0)
            ResetTextOptionValues(_modMenuBackupInfos[i], " ", " ")
        endif
        i += 1
    endwhile
endfunction


function BackupAllPagesOptions(yeolde_mcm_settings settings_mod, int jBackup, string modInfoMsgPrefix)	
    ; Since we are managing backups, we don't backup ourself for the moment.
    ; TODO: Backup ourself by overwriting backup/import functions.
endfunction


state DefaultBlackList
	event  OnSelectST()
        _useDefaultBlacklistFile = !_useDefaultBlacklistFile
        ; yeolde_var_craftingbag_enable_hotkey.SetValueInt(craftingbag_enable_hotkey as int)
        SetToggleOptionValueST(_useDefaultBlacklistFile)
	endEvent

	event OnDefaultST()
        SetToggleOptionValueST(true)
        ; yeolde_var_craftingbag_enable_hotkey.SetValueInt(0)
    endEvent

	event OnHighlightST()
        SetInfoText("List of skipped mods for backup task (path: MyGames/[skyrim folder]/JCUser/yeolde-settings/_import_blacklist.json)")
	endEvent
endState


state ImportMCMValues
    event OnSelectST()
        
        bool continue = ShowMessage("Press the button and wait until the import is completed.")
        if (continue)
            SetTextOptionValueST("working...")
            ClearSkippedModList()
            manager.ImportAllMcmMenuValues(self)
            ShowMessage("Import completed.", false)
            ; Input.TapKey(15) ; press TAB to exit current menu
        endif
	endEvent

	event OnDefaultST()
		SetTextOptionValueST("Press to import")
	endEvent

	event OnHighlightST()
		SetInfoText("Press the button and wait until I do the magic stuff!")
	endEvent
endState

state ClearMCMBackup
    event OnSelectST()
        SetTextOptionValueST("deleting backup...")
        ClearSkippedModList()
        manager.ResetMCMBackupFile()
		SetTextOptionValueST("Press to clear")
	endEvent

	event OnDefaultST()
		SetTextOptionValueST("Press to clear")
	endEvent

	event OnHighlightST()
		SetInfoText("Press the button to delete your MCM configs backup")
	endEvent
endState

state ForceMCMReset
    event OnSelectST()
        SetTextOptionValueST("reseting...")
        manager.ForceResetFromMCMMenu()
		SetTextOptionValueST("Press to reset")
	endEvent

	event OnDefaultST()
		SetTextOptionValueST("Press to reset")
	endEvent

	event OnHighlightST()
		SetInfoText("Press the button, leave the menu and wait a minute or so. Every MCM menus will reset to default.")
	endEvent
endState

state MCMValuesBackup
    event OnSelectST()
        bool continue = ShowMessage("Please wait until the backup is completed.")
        if (continue)
            SetTextOptionValueST("working...")
            ClearSkippedModList()
            manager.BackupAllModValues(self)        
            ShowMessage("Backup completed.", false)
            ; Input.TapKey(15) ; press TAB to exit current menu
        endif
	endEvent

	event OnDefaultST()
		SetTextOptionValueST("Press to backup")
	endEvent

	event OnHighlightST()
		SetInfoText("(backup button)")
	endEvent
endState

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction