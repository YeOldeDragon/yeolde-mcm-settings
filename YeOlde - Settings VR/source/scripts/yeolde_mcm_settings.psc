scriptname yeolde_mcm_settings extends SKI_ConfigBase

import Game

string[]        _modNames
bool[]          _modEnableFlags
int[]           _modMenuToggle
int[]           _modMenuBackupInfos
int             _modMenuBackupInfosIndex
int             _modMenuBackupInfosNbSup = 0

int[]           _modBlacklistToggle
bool[]          _modBlacklistEnableFlags


string property COLOR_BACKUP_PATCH_NEEDED = "#F1BC7A" autoreadonly hidden ; a78e59
string property COLOR_BACKUP_PATCH_OK = "#92F1AA" autoreadonly hidden ; "#83DD9A"
string property COLOR_BACKUP_SELF_BACKUP = "#555555" autoreadonly hidden
string property COLOR_BACKUP_FAIL = "#d45858" autoreadonly hidden


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
endEvent  


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
        SetCursorFillMode(TOP_TO_BOTTOM)

        Quest qLAL = Quest.GetQuest("ARTHLALChargenQuest")
        Quest qUnbound = Quest.GetQuest("SkyrimUnbound")
        
        if (qLAL && !qLAL.IsCompleted())
            AddTextOption("'Live Another Life' intro must be completed", "")
            AddTextOption("before using the backup/restore tool", "")
        elseIf (qUnbound && !qUnbound.IsCompleted())
            AddTextOption("'Skyrim Unbound' intro must be completed", "")
            AddTextOption("before using the backup/restore tool", "")
        else
            SetCursorFillMode(TOP_TO_BOTTOM)
            AddHeaderOption("Backup MCM configurations")
            AddTextOptionST("MCMValuesBackup", "Backup your configs", "Press to backup")  
            AddEmptyOption()
            AddTextOptionST("ImportMCMValues", "Restore your last backup", "Press to restore")        

            SetCursorPosition(1)
            AddHeaderOption("Last task result")
            _modMenuBackupInfos = Utility.CreateIntArray(11, 0)
            int iInfo = 0
            while (iInfo < _modMenuBackupInfos.Length)
                _modMenuBackupInfos[iInfo] = AddTextOption("", "")
                iInfo += 1
            endwhile
        endIf        

    elseif a_page == "Backup blacklist"  
        int jModNames = JArray.objectWithStrings(PapyrusUtil.RemoveString(_modNames, ""))
        JArray.sort(jModNames)
        string[] sortedModNames = JArray.asStringArray(jModNames)
        int jConfig = YeOldeConfig.Load()

        int jBlackList = JValue.readFromFile(BackupConfig.GetDefaultBlacklistFilePath()) 

        if (jBlackList == 0)
            jBlackList = JArray.object()
        endif

        ;; 1st column
        SetCursorFillMode(TOP_TO_BOTTOM)
        AddTextOptionST("DefaultBlackList", "Reset Blacklist to default", "Set to default")
        AddEmptyOption()
        AddHeaderOption("Backup Blacklist")

        int i = 0
        while (i < sortedModNames.Length / 2)
            int modIndex = _modNames.Find(sortedModNames[i])
            if (modIndex > -1)
                string name = "<font color='"+ COLOR_BACKUP_PATCH_OK + "'>" + _modNames[modIndex] + "</font>"
                if (YeOldeConfig.isModNeedPatch(jConfig, _modNames[modIndex]))
                    if (!ConfigManager.IsBackupRestorePatchActive(_modNames[modIndex], modIndex))
                        name = "<font color='"+ COLOR_BACKUP_PATCH_NEEDED + "'>" + _modNames[modIndex] + "</font>"
                    endif
                elseif (YeOldeConfig.isModWillFail(jConfig, _modNames[modIndex]))
                    name = "<font color='"+ COLOR_BACKUP_FAIL + "'>" + _modNames[modIndex] + "</font>"
                elseif (YeOldeConfig.isModSelfBackup(jConfig, _modNames[modIndex]))
                    name = "<font color='"+ COLOR_BACKUP_SELF_BACKUP + "'>" + _modNames[modIndex] + "</font>"
                endif
                _modBlacklistEnableFlags[modIndex] = (JArray.findStr(jBlackList, sortedModNames[i]) > -1)
                _modBlacklistToggle[modIndex] = AddToggleOption(name, _modBlacklistEnableFlags[modIndex])  
            endif
            i += 1
        endwhile
        
        JValue.release(jBlackList)
        JValue.zeroLifetime(jBlackList)
       
        ;; 2nd column
        SetCursorPosition(1) 
        AddTextOption("Legend:     <font color='" + COLOR_BACKUP_PATCH_NEEDED + "'>Need Patch or will fail</font>       <font color='" + COLOR_BACKUP_PATCH_OK + "'>Mod OK</font>", "")
        AddTextOption("Legend:     <font color='" + COLOR_BACKUP_SELF_BACKUP + "'>Self backup system</font>     <font color='" + COLOR_BACKUP_FAIL + "'>Not compatible</font>", "")
        AddHeaderOption("")
        
        while (i < sortedModNames.Length)
            int modIndex = _modNames.Find(sortedModNames[i])
            if (modIndex > -1)
                string name = "<font color='"+ COLOR_BACKUP_PATCH_OK + "'>" + _modNames[modIndex] + "</font>"
                if (YeOldeConfig.isModNeedPatch(jConfig, _modNames[modIndex]))
                    if (!ConfigManager.IsBackupRestorePatchActive(_modNames[modIndex], modIndex))
                        name = "<font color='"+ COLOR_BACKUP_PATCH_NEEDED + "'>" + _modNames[modIndex] + "</font>"
                    endif
                elseif (YeOldeConfig.isModWillFail(jConfig, _modNames[modIndex]))
                    name = "<font color='"+ COLOR_BACKUP_FAIL + "'>" + _modNames[modIndex] + "</font>"
                elseif (YeOldeConfig.isModSelfBackup(jConfig, _modNames[modIndex]))
                    name = "<font color='"+ COLOR_BACKUP_SELF_BACKUP + "'>" + _modNames[modIndex] + "</font>"
                endif
                _modBlacklistEnableFlags[modIndex] = (JArray.findStr(jBlackList, sortedModNames[i]) > -1)
                _modBlacklistToggle[modIndex] = AddToggleOption(name, _modBlacklistEnableFlags[modIndex])  
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
    
    if (CurrentPage == Pages[0]) ; "Show/hide menus"
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
    
    elseif (CurrentPage == Pages[2]) ; "Backup blacklist"
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

    if (CurrentPage == Pages[0]) ; "Backup blacklist"
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
    elseif (CurrentPage == Pages[2]) ; "Backup blacklist"
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


function AddModStatus(string name, string status)
    string statusMsg = name
    if (status == "failed")
        statusMsg = "<font color='#d45858'>" + statusMsg + "</font>"
    elseif (status == "skipped")
        statusMsg = "<font color='#CDCDCD'>" + statusMsg + "</font>"
    endif

    if (_modMenuBackupInfosIndex < (_modMenuBackupInfos.Length - 1))
        ResetTextOptionValues(_modMenuBackupInfos[_modMenuBackupInfosIndex], statusMsg, "")
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


bool function IsBackupRestoreEnabled()	
	{When overwritten, it means that this mod supports backup and restore tasks.}
	return true
endfunction


function OnBackupRequest(int jMod)	
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
        SetInfoText("Default blacklist will automatically skip mods with risk of failure. Based on yeolde_config.json file content.")
	endEvent
endState


state ImportMCMValues
    event OnSelectST()
        
        bool continue = ShowMessage("Please wait until the restoration is completed (a message will show).")
        if (continue)
            SetTextOptionValueST("working...")
            ClearSkippedModList()
            ConfigManager.RestoreAllModValues(self)
            ShowMessage("The restore task is now completed. Please exit MCMenu to complete restoration.", false)
            SetTextOptionValueST("Exit to complete")
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