; ----------------------------------
; ModConfig
; Script managing a MCM Menu Mod configs for YeOlde-Settings
; ----------------
ScriptName BackupConfig hidden

import JContainers
import ModConfig


string[] function Mods(int jBackup) global
    return JMap.allKeysPArray(jBackup)
endfunction


int function getMod(int jBackup, string modName) global
    return JMap.getObj(jBackup, modName)
endfunction


int function addMod(int jBackup, string modName, bool overwrite = true) global
    int jResult = JMap.getObj(jBackup, modName)

    ; if (jResult > 0 && overwrite)
    ;     JMap.removeKey(jBackup, modName)
    ;     jResult = JValue.release(jResult)
    ; endif

    if (jResult == 0)
        jResult = ModConfig.createInstance(modName)
    endif
    
    ; Add the new option in jMod.pages map
    JMap.setObj(jBackup, modName, jResult)

    return jResult
endfunction


int function ReadFromFile(string backupName) global
    string path = JContainers.userDirectory() + "yeolde-settings/" + backupName + ".json"
    Log("ReadFromFile() -> path: " + path)
    return JValue.readFromFile(path)
endfunction

function Save(int jBackup, string backupName) global
    Log("Save()")
    ; TODO: Save with a timestamp (   lua: os.date('%F_%H-%M-%S')   )
    string path = JContainers.userDirectory() + "yeolde-settings/" + backupName + ".json"
    JValue.writeToFile(jBackup, path)
endfunction

function SaveAndClose(int jBackup, string backupName) global
    Log("SaveAndClose()")
    ; TODO: Save with a timestamp (   lua: os.date('%F_%H-%M-%S')   )
    string path = JContainers.userDirectory() + "yeolde-settings/" + backupName + ".json"
    JValue.writeToFile(jBackup, path)

    JValue.release(jBackup)
    JValue.zeroLifetime(jBackup)
endfunction

function RemoveFromDisk(string backupName) global
    string path = JContainers.userDirectory() + "yeolde-settings/"
    JContainers.removeFileAtPath(path + backupName + ".json")
endfunction

function RemoveModFilesFromDisk() global
    string[] files = JContainers.contentsOfDirectoryAtPath(JContainers.userDirectory() + "yeolde-settings/mods/")
    int i = 0
    while(i < files.Length)
        Log("RemoveModFilesFromDisk() -> " + files[i])
        JContainers.removeFileAtPath(JContainers.userDirectory() + "yeolde-settings/mods/" + files[i])
        i += 1
    endwhile
endfunction


int function CreateImportInstance() global
    int jResult = JValue.readFromDirectory(JContainers.userDirectory() + "yeolde-settings/mods/")
    JValue.retain(jResult)
    return jResult
endfunction


; Get the objet, or create a new one if not already defined
int function createInstance() global
    return JMap.object()
endfunction

function Log(string a_msg) global
	Debug.Trace("[BackupConfig <BackupConfigInstance (00000000)>]" + ": " + a_msg)
endFunction



