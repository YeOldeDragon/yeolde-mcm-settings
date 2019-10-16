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
    JMap.setObj(jResult, "4- skipped mod list", jSkipped)
    JMap.setObj(jResult, "5- backed up mod list", jBackedUp)   

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

function addStrIndexedArray(int jDebug, string a_keyStr, string[] a_array) global
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
    JMap.setObj(jDebug, a_keyStr, jValues)
    Save(jDebug)
endfunction

function addStrArray(int jDebug, string a_keyStr, string[] a_array, bool sort = false) global
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
    
    if (sort)
        JArray.sort(jValues)
    endif

    JMap.setObj(jDebug, a_keyStr, jValues)
    Save(jDebug)
endfunction

function addSkippedMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "4- skipped mod list")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction

function addBackedUpMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "5- backed up mod list")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction


function Save(int jDebug) global
    JValue.writeToFile(jDebug, GetBackupInfoFilePath())
endfunction


function SaveAndClose(int jDebug) global    
    int jSkipped = JMap.getObj(jDebug, "4- skipped mod list")
    int jBacked = JMap.getObj(jDebug, "5- backed up mod list")  
    
    JArray.sort(jSkipped)
    JArray.sort(jBacked)

    JValue.writeToFile(jDebug, GetBackupInfoFilePath())
    JValue.release(jDebug)
endfunction

function RemoveFromDisk() global
    JContainers.removeFileAtPath(GetBackupInfoFilePath())
endfunction


function Log(string a_msg) global
	Debug.Trace("[YeOldeBackupInfo <YeOldeBackupInfoInstance (00000000)>]" + ": " + a_msg)
endFunction



