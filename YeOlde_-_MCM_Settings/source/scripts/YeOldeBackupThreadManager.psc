scriptname YeOldeBackupThreadManager extends Quest
 
Quest property YeOldeBackupQuest auto
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
    RegisterForModEvent("YeOlde_OnBackupRequest", "OnBackupRequest")
 
    ;Let's cast our threads to local variables so things are less cluttered in our code
    _thread1 = YeOldeBackupQuest as YeOldeBackupThread1
    _thread2 = YeOldeBackupQuest as YeOldeBackupThread2
    _thread3 = YeOldeBackupQuest as YeOldeBackupThread3
    _thread4 = YeOldeBackupQuest as YeOldeBackupThread4
    _thread5 = YeOldeBackupQuest as YeOldeBackupThread5
    _thread6 = YeOldeBackupQuest as YeOldeBackupThread6

    _settings_mod = a_settings_mod
    _patcher = a_patcher
    _jConfig = a_jConfig
endfunction
 
;The 'public-facing' function that our MagicEffect script will interact with.
function doBackupTaskAsync(SKI_ConfigBase a_modMenu)
    if !_thread1.queued()
        _thread1.doBackupAsync(_settings_mod, _patcher, a_modMenu)
    elseif !_thread2.queued()
        _thread2.doBackupAsync(_settings_mod, _patcher, a_modMenu)
    elseif !_thread3.queued()
        _thread3.doBackupAsync(_settings_mod, _patcher, a_modMenu)
    elseif !_thread4.queued()
        _thread4.doBackupAsync(_settings_mod, _patcher, a_modMenu)
    elseif !_thread5.queued()
        _thread5.doBackupAsync(_settings_mod, _patcher, a_modMenu)
    elseif !_thread6.queued()
        _thread6.doBackupAsync(_settings_mod, _patcher, a_modMenu)
    else
	    ;All threads are queued; start all threads, wait, and try again.
        wait_all()
        doBackupTaskAsync(a_modMenu)
	endif
endFunction
 
function wait_all()
    RaiseEvent_OnBackupRequest()
    begin_waiting()
endFunction
 
function begin_waiting()
    bool waiting = true
    int i = 0
    while waiting
        if (_thread1.queued() || _thread2.queued() || _thread3.queued() || _thread4.queued() || _thread5.queued() || _thread6.queued())
            i += 1
            Utility.WaitMenuMode(0.1)
            if (i > 100) ; TODO: Wait in gametime instead of a simple loop count.
                debug.Trace("Error: A catastrophic error has occurred. All threads have become unresponsive. Please debug this issue or notify the author.")
                if (_thread1.queued())
                    _thread1.forceBackUnlock()
                endif
                if (_thread2.queued())
                    _thread2.forceBackUnlock()
                endif
                if (_thread3.queued())
                    _thread3.forceBackUnlock()
                endif
                if (_thread4.queued())
                    _thread4.forceBackUnlock()
                endif
                if (_thread5.queued())
                    _thread5.forceBackUnlock()
                endif
                if (_thread6.queued())
                    _thread6.forceBackUnlock()
                endif
                return
            endif
        else
            waiting = false
        endif
    endWhile
endFunction
 
;Create the ModEvent that will start this thread
function RaiseEvent_OnBackupRequest()
    int handle = ModEvent.Create("YeOlde_OnBackupRequest")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction