scriptname yeolde_mcm_settings extends SKI_ConfigBase

import Game

string[] _modNames
bool[] _modEnableFlags
int[] _modMenuToggle
int[] _modMenuBackupInfos
int _modMenuBackupInfosIndex

int[] _modBlacklistToggle
bool[] _modBlacklistEnableFlags

; ;  YeOlde - Respawn 
; int property YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID = 0x08005902 autoreadonly

; ;  YeOlde - Hybrid Loot  
; int property YEOLDE_VAR_AUTOLOOT_MODE_ID = 0x0800FB1A autoreadonly

; ;  YeOlde - Crafting Bag  
; int property YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID = 0x07000802 autoreadonly

; bool _crafting_bag_mod_activated
; bool _hybrid_loot_mod_activated
; bool _respawn_mod_activated


; @overrides SKI_ConfigBase
event OnConfigInit()  
    _modMenuToggle = Utility.CreateIntArray(128, 0)
    _modBlacklistToggle = Utility.CreateIntArray(128, 0)
    _modBlacklistEnableFlags = Utility.CreateBoolArray(128)
    _modMenuBackupInfosIndex = 0

    ; string pagesArrayStr = "MCM Menu Settings"
    
    Pages = new String[4]
    Pages[0] = "Show/hide menus"
    Pages[1] = "Backup/Restore menus"
    Pages[2] = "Backup blacklist"
    Pages[3] = "Debugging options"

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
endEvent

; @implements SKI_ConfigBase
event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}

    if a_page == ""
		self.LoadCustomContent("yeolde/settings_splash.dds", 0.000000, 0.000000)
		return 
    endIf

    self.UnloadCustomContent()
    _modNames = ConfigManager.GetAllModNames()
    _modEnableFlags = ConfigManager.GetAllEnabledModFlags()
    
    if a_page == "Show/hide menus"
        int jModNames = JArray.objectWithStrings(PapyrusUtil.RemoveString(_modNames, ""))
        JArray.sort(jModNames)
        string[] sortedModNames = JArray.asStringArray(jModNames)

        ;; 1st column
        SetCursorFillMode(TOP_TO_BOTTOM)
        AddHeaderOption("Available MCM Menus")

        int i = 0
        while (i < sortedModNames.Length / 2)
            int modIndex = _modNames.Find(sortedModNames[i])
            if (modIndex > -1)
                int flag = OPTION_FLAG_NONE

                if (_modNames[modIndex] == self.ModName)
                    flag = OPTION_FLAG_DISABLED
                endif

                _modMenuToggle[modIndex] = AddToggleOption(_modNames[modIndex], _modEnableFlags[modIndex], flag)   
            endif
            i += 1
        endwhile
       
        ;; 2nd column
        SetCursorPosition(1)
        AddHeaderOption("")
        
        while (i < sortedModNames.Length)
            int modIndex = _modNames.Find(sortedModNames[i])
            if (modIndex > -1)
                int flag = OPTION_FLAG_NONE

                if (_modNames[modIndex] == self.ModName)
                    flag = OPTION_FLAG_DISABLED
                endif

                _modMenuToggle[modIndex] = AddToggleOption(_modNames[modIndex], _modEnableFlags[modIndex], flag)   
            endif
            i += 1
        endwhile
 
    elseif a_page == "Backup/Restore menus"     
        ClearSkippedModList()

        SetCursorFillMode(TOP_TO_BOTTOM)
        AddHeaderOption("Backup MCM configurations")
        AddTextOptionST("MCMValuesBackup", "Backup your configs", "Press to backup")  
        AddEmptyOption()
        AddTextOptionST("ImportMCMValues", "Restore your last backup", "Press to restore")        

        SetCursorPosition(1)
        AddHeaderOption("Mods skipped during backup")
        _modMenuBackupInfos = Utility.CreateIntArray(11, 0)
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
    elseif a_page == "Backup blacklist"  
        int jModNames = JArray.objectWithStrings(PapyrusUtil.RemoveString(_modNames, ""))
        JArray.sort(jModNames)
        string[] sortedModNames = JArray.asStringArray(jModNames)

        int jBlackList = JValue.readFromFile(BackupConfig.GetDefaultBlacklistFilePath()) 

        if (jBlackList == 0)
            jBlackList = JArray.object()
        endif

        ;; 1st column
        SetCursorFillMode(TOP_TO_BOTTOM)
        AddTextOptionST("DefaultBlackList", "Reset Blacklist to default", "Set to default")
        AddHeaderOption("Backup Blacklist")

        int i = 0
        while (i < sortedModNames.Length / 2)
            int modIndex = _modNames.Find(sortedModNames[i])
            if (modIndex > -1)
                _modBlacklistEnableFlags[modIndex] = (JArray.findStr(jBlackList, sortedModNames[i]) > -1)
                _modBlacklistToggle[modIndex] = AddToggleOption(_modNames[modIndex], _modBlacklistEnableFlags[modIndex])   
            endif
            i += 1
        endwhile
        
        JValue.release(jBlackList)
        JValue.zeroLifetime(jBlackList)
       
        ;; 2nd column
        SetCursorPosition(1) 
        AddEmptyOption()
        AddHeaderOption("")
        
        while (i < sortedModNames.Length)
            int modIndex = _modNames.Find(sortedModNames[i])
            if (modIndex > -1)
                _modBlacklistEnableFlags[modIndex] = (JArray.findStr(jBlackList, sortedModNames[i]) > -1)
                _modBlacklistToggle[modIndex] = AddToggleOption(_modNames[modIndex], _modBlacklistEnableFlags[modIndex])   
            endif
            i += 1
        endwhile
    
    elseif a_page == "Debugging options"  
        SetCursorFillMode(TOP_TO_BOTTOM)
        AddHeaderOption("MCM menus visibility") 
        AddTextOptionST("ForceMCMReset", "Show all MCM menus", "Press to reset") 
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
                    result = ConfigManager.EnableModByName(_modNames[i])
                else
                    result = ConfigManager.DisableModByName(_modNames[i])
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
    
    elseif (CurrentPage == Pages[2])
        int i = 0
        while (i<_modBlacklistToggle.Length)
            if (a_option == _modBlacklistToggle[i])    
                _modBlacklistEnableFlags[i] = !_modBlacklistEnableFlags[i]
                int jBlackList = JValue.readFromFile(BackupConfig.GetDefaultBlacklistFilePath()) 

                if (jBlackList == 0)
                    jBlackList = JArray.object()
                endif

                if (_modBlacklistEnableFlags[i])
                    JArray.addStr(jBlackList, _modNames[i])
                else
                    int index = JArray.findStr(jBlackList, _modNames[i])
                    if (index > -1)
                        JArray.eraseIndex(jBlackList, index)
                    endif
                endif
                          
		        JArray.sort(jBlackList)  
                JValue.writeToFile(jBlackList, BackupConfig.GetDefaultBlacklistFilePath())
                JValue.release(jBlackList)
                JValue.zeroLifetime(jBlackList)
                
                SetToggleOptionValue(a_option, _modBlacklistEnableFlags[i])
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
                int result = ConfigManager.EnableModByName(_modNames[i])

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
    elseif (CurrentPage == Pages[2])
        int i = 0
        while (i<_modBlacklistToggle.Length)
            if (a_option == _modBlacklistToggle[i])                
                _modBlacklistEnableFlags[i] = false
                SetToggleOptionValue(a_option, false)
            endif
            
            i += 1
        endwhile
    endif
endEvent


function UpdateInfoMsg(string msg)
	ForceInfoText(msg)
endfunction

int _modMenuBackupInfosNbSup = 0

function AddSkippedMod(string name)
    if (_modMenuBackupInfosIndex < (_modMenuBackupInfos.Length - 1))
        ResetTextOptionValues(_modMenuBackupInfos[_modMenuBackupInfosIndex], name, "")
        _modMenuBackupInfosIndex += 1
    else
        _modMenuBackupInfosNbSup += 1        
        ResetTextOptionValues(_modMenuBackupInfos[_modMenuBackupInfosIndex], " + " + _modMenuBackupInfosNbSup + " mod(s)", "")
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


function OnBackupRequest(int jMod)	
    ; _modNames[modIndex], _modEnableFlags[modIndex]
    int jModNames = JArray.objectWithStrings(PapyrusUtil.RemoveString(_modNames, ""))
    JArray.sort(jModNames)
    string[] sortedModNames = JArray.asStringArray(jModNames)

    int i = 0
    while (i < sortedModNames.Length)
        int modIndex = _modNames.Find(sortedModNames[i])
        if (modIndex > -1)
            JMap.setInt(jMod, _modNames[modIndex], _modEnableFlags[modIndex] as int)
        endif
        i += 1
    endwhile
endfunction

function OnRestoreRequest(int jMod)
    Log("OnRestoreRequest(" + jMod + ")")
    int i = 0
    while (i<_modNames.Length)
        if (JMap.hasKey(jMod, _modNames[i]))
            int result = 0
            bool newState = JMap.getInt(jMod, _modNames[i]) as bool

            if(newState != _modEnableFlags[i])
                if (newState)
                    result = ConfigManager.EnableModByName(_modNames[i])
                else
                    result = ConfigManager.DisableModByName(_modNames[i])
                endif

                if (!result)
                    Log("Error: Can't change Visible state for mod '" + _modNames[i] + "'")
                endif
                
                _modEnableFlags[i] = newState
            endif
        endif
        i += 1
    endwhile
endfunction


state DefaultBlackList
    event  OnSelectST()
        
        SetTextOptionValueST("Working...")
        ConfigManager.GenerateDefaultBlackList()
        ForcePageReset()
	endEvent

	event OnDefaultST()
        SetTextOptionValueST("Set default")
    endEvent

	event OnHighlightST()
        SetInfoText("This option will reset your blacklist values to default (will check mods that are reported as failing")
	endEvent
endState


state ImportMCMValues
    event OnSelectST()
        
        bool continue = ShowMessage("Please wait until the restoration is completed (a message will show).")
        if (continue)
            SetTextOptionValueST("working...")
            ClearSkippedModList()
            ConfigManager.RestoreMcmValues(self)
            ShowMessage("The restore task is now completed.", false)
            SetTextOptionValueST("Press to restore")
            ; Input.TapKey(15) ; press TAB to exit current menu
        endif
	endEvent

	event OnDefaultST()
		SetTextOptionValueST("Press to restore")
	endEvent

	event OnHighlightST()
		SetInfoText("Press the button and wait until it's completed (a message will show).")
	endEvent
endState

state ForceMCMReset
    event OnSelectST()
        SetTextOptionValueST("reseting...")
        ConfigManager.ForceResetFromMCMMenu()
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
        bool continue = ShowMessage("Please wait until the backup is completed (a message will show).")
        if (continue)
            SetTextOptionValueST("working...")
            _modMenuBackupInfosNbSup = 0
            ClearSkippedModList()
            ConfigManager.BackupAllModValues(self)        
            ShowMessage("Backup completed.", false)
            SetTextOptionValueST("Press to backup")
            ; Input.TapKey(15) ; press TAB to exit current menu
        endif
	endEvent

	event OnDefaultST()
		SetTextOptionValueST("Press to backup")
	endEvent

	event OnHighlightST()
		SetInfoText("Press the button and wait until it's completed (a message will show).")
	endEvent
endState

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction