; ----------------------------------
; yeolde_patches - Interface file
; Script managing all internal patches for YeOlde - (MCM) Settings
; ----------------
ScriptName yeolde_patches  extends Quest

int property		RESULT_SUCCESS	        = 0 autoReadonly
int property		RESULT_ERROR_TIMEOUT	= -1 autoReadonly
int property		RESULT_ERROR_UNKNOWN	= 1 autoReadonly
int property		RESULT_ERROR_VERSION	= 2 autoReadonly


bool property IsInitialized
    bool function get()
        Log("Error: You should not compile this script.")
        return false
    endFunction
endproperty

function initialize(int a_jConfig)
    Log("Error: You should not compile this script.")
endfunction

bool function isPatchAvailable(string a_modName)
    Log("Error: You should not compile this script.")
    return false
endfunction

bool function setActivePatch(string a_modName)
    Log("Error: You should not compile this script.")
    return false
endfunction

int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
    Log("Error: You should not compile this script.")
    return RESULT_ERROR_UNKNOWN
endfunction

int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
    Log("Error: You should not compile this script.")
    return RESULT_ERROR_UNKNOWN
endfunction

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction