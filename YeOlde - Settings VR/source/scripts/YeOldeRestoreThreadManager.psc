scriptname YeOldeRestoreThreadManager extends Quest
 
Quest property YeOldeRestoreQuest auto
{The name of the thread management quest.}
 
YeOldeBackupThread1 _thread1
YeOldeBackupThread2 _thread2
YeOldeBackupThread3 _thread3
YeOldeBackupThread4 _thread4
YeOldeBackupThread5 _thread5
YeOldeBackupThread6 _thread6

yeolde_mcm_settings _settings_mod
yeolde_patches      _patcher
int                 _jConfig
 
function Initialize(yeolde_mcm_settings a_settings_mod, yeolde_patches a_patcher, int a_jConfig)
    ;Register for the event that will start all threads
    RegisterForModEvent("YeOlde_OnRestoreRequest", "OnRestoreRequest")
 
    ;Let's cast our threads to local variables so things are less cluttered in our code
    _thread1 = YeOldeRestoreQuest as YeOldeBackupThread1
    _thread2 = YeOldeRestoreQuest as YeOldeBackupThread2
    _thread3 = YeOldeRestoreQuest as YeOldeBackupThread3
    _thread4 = YeOldeRestoreQuest as YeOldeBackupThread4
    _thread5 = YeOldeRestoreQuest as YeOldeBackupThread5
    _thread6 = YeOldeRestoreQuest as YeOldeBackupThread6

    _settings_mod = a_settings_mod
    _patcher = a_patcher
    _jConfig = a_jConfig
endfunction
 
;The 'public-facing' function that our MagicEffect script will interact with.
function doRestoreTaskAsync(SKI_ConfigBase a_modMenu, int jMod)
    if !_thread1.queued()
        _thread1.doRestoreAsync(_settings_mod, _patcher, a_modMenu, jMod)
    elseif !_thread2.queued()
        _thread2.doRestoreAsync(_settings_mod, _patcher, a_modMenu, jMod)
    elseif !_thread3.queued()
        _thread3.doRestoreAsync(_settings_mod, _patcher, a_modMenu, jMod)
    elseif !_thread4.queued()
        _thread4.doRestoreAsync(_settings_mod, _patcher, a_modMenu, jMod)
    elseif !_thread5.queued()
        _thread5.doRestoreAsync(_settings_mod, _patcher, a_modMenu, jMod)
    elseif !_thread6.queued()
        _thread6.doRestoreAsync(_settings_mod, _patcher, a_modMenu, jMod)
    else
	    ;All threads are queued; start all threads, wait, and try again.
        wait_all()
        doRestoreTaskAsync(a_modMenu, jMod)
	endif
endFunction
 
function wait_all()
    RaiseEvent_OnRestoreRequest()
    begin_waiting()
endFunction
 
function begin_waiting()
    bool waiting = true
    int i = 0
    while waiting
        if (_thread1.queued() || _thread2.queued() || _thread3.queued() || _thread4.queued() || _thread5.queued() || _thread6.queued())
            i += 1
            if (i > 100) ; TODO: Wait in gametime instead of a simple loop count.
                Log("begin_waiting() -> Error: All threads have become unresponsive. Please debug this issue or notify the author.")

                if (_thread1.queued())
                    ; Log("begin_waiting() -> tread 1 locked: ")
                    Log("begin_waiting() -> tread 1 locked: " + _thread1.ModName)
                    _thread1.forceRestUnlock()
                endif
                if (_thread2.queued())
                    ; Log("begin_waiting() -> tread 2 locked")
                    Log("begin_waiting() -> tread 2 locked: " + _thread2.ModName)
                    _thread2.forceRestUnlock()
                endif
                if (_thread3.queued())
                    ; Log("begin_waiting() -> tread 3 locked")
                    Log("begin_waiting() -> tread 3 locked: " + _thread3.ModName)
                    _thread3.forceRestUnlock()
                endif
                if (_thread4.queued())
                    ; Log("begin_waiting() -> tread 4 locked")
                    Log("begin_waiting() -> tread 4 locked: " + _thread4.ModName)
                    _thread4.forceRestUnlock()
                endif
                if (_thread5.queued())
                    ; Log("begin_waiting() -> tread 5 locked")
                    Log("begin_waiting() -> tread 5 locked: " + _thread5.ModName)
                    _thread5.forceRestUnlock()
                endif
                if (_thread6.queued())
                    ; Log("begin_waiting() -> tread 6 locked")
                    Log("begin_waiting() -> tread 6 locked: " + _thread6.ModName)
                    _thread6.forceRestUnlock()
                endif
                i = 0
                return
            endif
            Utility.WaitMenuMode(0.1)
        else
            waiting = false
        endif
    endWhile
endFunction
 
;Create the ModEvent that will start this thread
function RaiseEvent_OnRestoreRequest()
    int handle = ModEvent.Create("YeOlde_OnRestoreRequest")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction