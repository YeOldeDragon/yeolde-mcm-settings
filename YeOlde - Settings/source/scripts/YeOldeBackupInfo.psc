; ----------------------------------
; ModConfig
; Script managing a MCM Menu Mod configs for YeOlde-Settings
; ----------------
ScriptName YeOldeBackupInfo hidden

import JContainers
import ModConfig


int function getFileHandler() global
    ; int jResult = JValue.readFromFile(JContainers.userDirectory() + "yeolde-settings/backup_info.json")
    ; if (jResult == 0)
    ;     jResult = JMap.object()
    ; else
    ;     JValue.clear(jResult)
    ; endif
    int jResult = JMap.object()
	JValue.retain(jResult)

    int jSkipped = JArray.object()
    int jBackedUp = JArray.object()
    JMap.setObj(jResult, "4-skipped mod list", jSkipped)
    JMap.setObj(jResult, "5-backed up mod list", jBackedUp)   

    return jResult
endfunction

function addTimeStamp(int jDebug, string a_keyStr) global
    string timestamp = Utility.GetCurrentRealTime()
    JMap.setStr(jDebug, a_keyStr, timestamp)
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
    int jValues = JMap.getObj(jDebug, "4-skipped mod list")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction

function addBackedUpMod(int jDebug, string a_modName) global
    int jValues = JMap.getObj(jDebug, "5-backed up mod list")
    JArray.addStr(jValues, a_modName)
    Save(jDebug)
endfunction


function Save(int jDebug) global
    JValue.writeToFile(jDebug, JContainers.userDirectory() + "yeolde-settings/backup_info.json")
endfunction


function SaveAndClose(int jDebug) global    
    int jSkipped = JMap.getObj(jDebug, "4-skipped mod list")
    int jBacked = JMap.getObj(jDebug, "5-backed up mod list")  
    
    JArray.sort(jSkipped)
    JArray.sort(jBacked)

    JValue.writeToFile(jDebug, JContainers.userDirectory() + "yeolde-settings/backup_info.json")
    JValue.release(jDebug)
endfunction

function RemoveFromDisk() global
    JContainers.removeFileAtPath(JContainers.userDirectory() + "yeolde-settings/backup_info.json")
endfunction


function Log(string a_msg) global
	Debug.Trace("[YeOldeBackupInfo <YeOldeBackupInfoInstance (00000000)>]" + ": " + a_msg)
endFunction



