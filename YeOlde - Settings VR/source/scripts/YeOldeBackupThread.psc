scriptname YeOldeBackupThread extends Quest hidden
 
;Thread variables
bool _thread_queued = false
 
;Variables you need to get things done go here 
yeolde_mcm_settings     _settings_mod
SKI_ConfigBase          _modMenu
yeolde_patches          _patcher
int                     _jMod
string                  _modName

string property ModName hidden
    string function get()        
        return _modName
    endFunction
endProperty

;Thread queuing and set-up
function doBackupAsync(yeolde_mcm_settings settings_mod, yeolde_patches a_patcher, SKI_ConfigBase a_modMenu)
 
    ; BackupConfig.GetDefaultBackupModDirectory()
    ;Let the Thread Manager know that this thread is busy
    _thread_queued = true
 
    ;Store our passed-in parameters to member variables
    _settings_mod = settings_mod
    _modMenu = a_modMenu
    _modName = a_modMenu.ModName
    _patcher = a_patcher
endFunction
 
;Thread queuing and set-up
function doRestoreAsync(yeolde_mcm_settings settings_mod, yeolde_patches a_patcher, SKI_ConfigBase a_modMenu, int jMod)
 
    ; BackupConfig.GetDefaultBackupModDirectory()
    ;Let the Thread Manager know that this thread is busy
    _thread_queued = true
 
    ;Store our passed-in parameters to member variables
    _settings_mod = settings_mod
    _modMenu = a_modMenu
    _jMod = jMod
    _modName = a_modMenu.ModName
    _patcher = a_patcher
endFunction
 
;Allows the Thread Manager to determine if this thread is available
bool function queued()
	return _thread_queued
endFunction
 
;For Thread Manager troubleshooting.
bool function forceBackUnlock()
    Log("forceBackUnlock()")
    RaiseEvent_BackupCompletedCallback(-1) ; failed
    clear_thread_vars()
    _thread_queued = false
    return true
endFunction
 
;For Thread Manager troubleshooting.
bool function forceRestUnlock()
    Log("forceRestUnlock()")
    RaiseEvent_RestoreCompletedCallback(-1) ; failed
    clear_thread_vars()
    _thread_queued = false
    return true
endFunction
 
;The actual set of code we want to multithread.
Event OnBackupRequest()
    if _thread_queued
        Log("OnBackupRequest() -> Thread Queued!")
        
        _modMenu.BackupAllPagesOptions(_patcher)

        ;OK, we're done - raise event to return results
		RaiseEvent_BackupCompletedCallback(1) ; success
 
        ;Set all variables back to default
		clear_thread_vars()
 
        ;Make the thread available to the Thread Manager again
		_thread_queued = false
	endif
endEvent
 
;The actual set of code we want to multithread.
Event OnRestoreRequest()
    if _thread_queued
        Log("OnRestoreRequest() -> Thread Queued!")
		;OK, let's get some work done!
        ; _modMenu.BackupAllPagesOptions()
        _modMenu.RestorePages(_jMod, _patcher)
 
        ;OK, we're done - raise event to return results
		RaiseEvent_RestoreCompletedCallback(1) ; success
 
        ;Set all variables back to default
		clear_thread_vars()
 
        ;Make the thread available to the Thread Manager again
		_thread_queued = false
	endif
endEvent
 
function clear_thread_vars()
	;Reset all thread variables to default state
    _settings_mod = none
    _modMenu = none
    _jMod = 0
    _modName = ""
    _patcher = none
endFunction
 
;Create the callback
function RaiseEvent_RestoreCompletedCallback(int a_result)
    Log("RaiseEvent_RestoreCompletedCallback(" + a_result + ", " + _modName + ")")
    int handle = ModEvent.Create("YeOlde_RestoreCompletedCallback")
    if handle
    	ModEvent.PushInt(handle, a_result)
    	ModEvent.PushString(handle, _modName)
        ModEvent.Send(handle)
    else
        ;pass
    endif
endFunction
 
;Create the callback
function RaiseEvent_BackupCompletedCallback(int a_result)
    Log("RaiseEvent_BackupCompletedCallback(" + a_result + ", " + _modName + ")")
    int handle = ModEvent.Create("YeOlde_BackupCompletedCallback")
    if handle
    	ModEvent.PushInt(handle, a_result)
    	ModEvent.PushString(handle, _modName)
        ModEvent.Send(handle)
    else
        ;pass
    endif
endFunction

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction