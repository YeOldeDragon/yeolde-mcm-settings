; ----------------------------------
; ModConfig
; Script managing a MCM Menu Mod configs for YeOlde-Settings
; ----------------
ScriptName YeOldeBackupInfo hidden


string function GetBackupInfoFilePath() global
    return JContainers.userDirectory() + "yeolde-settings/backup_info.json"
endfunction 


int function getFileHandler() global
    int jResult = JMap.object()
	JValue.retain(jResult)

    int jSkipped = JArray.object()
    int jBackedUp = JArray.object()
    int jFailed = JArray.object()
    JMap.setObj(jResult, "Backup succeded", jSkipped)
    JMap.setObj(jResult, "Backup skipped", jSkipped)
    JMap.setObj(jResult, "Backup failed", jFailed)   
    JMap.setObj(jResult, "Restore succeded", jSkipped)
    JMap.setObj(jResult, "Restore skipped", jSkipped)
    JMap.setObj(jResult, "Restore failed", jFailed)     

    return jResult
endfunction

function addTimeStamp(int jDebug, string a_keyStr) global
    string timestamp = Utility.GetCurrentRealTime()
    int jTime = JMap.object()
    JMap.setStr(jTime, "Timestamp", timestamp)
    JMap.setInt(jTime, "IsInMenuMode", Utility.IsInMenuMode() as int)
    JMap.setObj(jDebug, a_keyStr, jTime)
    Save(jDebug)
endfunction


function addMsg(int jDebug, string keyStr, string msgStr) global
    JMap.setStr(jDebug, keyStr, msgStr)
    Save(jDebug)
endfunction

function addBackupStartingMods(int jDebug, string[] a_array) global
    int jValues = JArray.object()
    int counter = 1
    int i = 0
    while (i < a_array.Length)
        if (a_array[i] != "")
            JArray.addStr(jValues, counter + " - " + a_array[i])
            counter += 1
        endif
        i += 1
    endwhile
    JArray.sort(jValues)

    JMap.setObj(jDebug, "Backup starting order", jValues)
    Save(jDebug)
endfunction

function addRestoreStartingMods(int jDebug, string[] a_array) global
    int jValues = JArray.object()
    int counter = 1
    int i = 0
    while (i < a_array.Length)
        if (a_array[i] != "")
            JArray.addStr(jValues, counter + " - " + a_array[i])
            counter += 1
        endif
        i += 1
    endwhile
    JArray.sort(jValues)

    JMap.setObj(jDebug, "Restore starting order", jValues)
    Save(jDebug)
endfunction

function addInstalledMods(int jDebug, string[] a_array) global
    int jValues = JArray.object()
    int counter = 1
    int i = 0
    while (i < a_array.Length)
        if (a_array[i] != "")
            JArray.addStr(jValues, a_array[i])
            counter += 1
        endif
        i += 1
    endwhile
    
    JArray.sort(jValues)
    
    JMap.setObj(jDebug, "Installed mod", jValues)
    Save(jDebug)
endfunction

function addBackSkippedMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "Backup skipped")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction

function addRestSkippedMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "Restore skipped")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction

function addBackFailedMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "Backup failed")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction

function addRestFailedMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "Restore failed")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction

function addBackSuccededMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "Backup succeded")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction

function addRestSuccededMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "Restore succeded")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction

function Save(int jDebug) global
    JValue.writeToFile(jDebug, GetBackupInfoFilePath())
endfunction


function SaveAndClose(int jDebug) global    
    int j0 = JMap.getObj(jDebug, "Backup skipped")
    int J1 = JMap.getObj(jDebug, "Restore skipped")  
    int j2 = JMap.getObj(jDebug, "Backup failed")
    int j3 = JMap.getObj(jDebug, "Restore failed") 
    int j4 = JMap.getObj(jDebug, "Backup succeded")
    int j5 = JMap.getObj(jDebug, "Restore succeded")
    
    JArray.sort(j0)
    JArray.sort(j1)
    JArray.sort(j2)
    JArray.sort(j3)
    JArray.sort(j4)
    JArray.sort(j5)

    JValue.writeToFile(jDebug, GetBackupInfoFilePath())
    JValue.release(jDebug)
endfunction

function RemoveFromDisk() global
    JContainers.removeFileAtPath(GetBackupInfoFilePath())
endfunction


function Log(string a_msg) global
	Debug.Trace("[YeOldeBackupInfo <YeOldeBackupInfoInstance (00000000)>]" + ": " + a_msg)
endFunction



