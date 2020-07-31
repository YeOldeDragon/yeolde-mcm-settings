; ----------------------------------
; ModConfig
; Script managing a MCM Menu Mod configs for YeOlde-Settings
; ----------------
ScriptName BackupConfig hidden


string function GetDefaultBackupModDirectory() global
    return JContainers.userDirectory() + "yeolde-settings/mods/"
endfunction 

string[] function Mods(int jBackup) global
    return JMap.allKeysPArray(jBackup)
endfunction

int function getMod(int jBackup, string modName) global
    return JMap.getObj(jBackup, modName)
endfunction

int function addMod(int jBackup, string modName, bool overwrite = true) global
    int jResult = JMap.getObj(jBackup, modName)

    if (jResult == 0)
        jResult = ModConfig.createInstance(modName)
    endif
    
    ; Add the new option in jMod.pages map
    JMap.setObj(jBackup, modName, jResult)

    return jResult
endfunction

function RemoveModFilesFromDisk() global
    string[] files = JContainers.contentsOfDirectoryAtPath(GetDefaultBackupModDirectory())
    int i = 0
    while(i < files.Length)
        Log("RemoveModFilesFromDisk() -> " + files[i])
        JContainers.removeFileAtPath(files[i])
        i += 1
    endwhile
endfunction

int function CreateImportInstance() global
    int jResult = JValue.readFromDirectory(GetDefaultBackupModDirectory())
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



