; ----------------------------------
; PageConfig
; Script managing a MCM Menu Page configs for YeOlde-Settings
; ----------------
ScriptName PageConfig hidden

import JContainers


string[] function Options(int jPage) global
    return JMap.allKeysPArray(jPage)
endfunction


int function GetOption(int jPage, string optionKey) global
    return JMap.getObj(jPage, optionKey)
endfunction


int function addOption(int jPage, int optionId, int optionType, string strValue, float fltValue, string stateOption, bool overwrite = true) global
	Log("AddOption(" + jPage + ", " + optionId + ", " + optionType + ", " + strValue + ", " + fltValue + ", " + stateOption + ")")
    int jResult = JMap.getObj(jPage, optionId as string)

    if (jResult > 0 && overwrite)        
        JMap.removeKey(jPage, optionId as string)
        jResult = JValue.release(jResult)
    endif

    if (jResult == 0)
        jResult = OptionConfig.createInstance(optionId, optionType, strValue, fltValue, stateOption)

        ; Add the new option in jMod.pages[jPage].options map
        JMap.setObj(jPage, optionId as string, jResult)
    endif
endfunction


; Get the objet, or create a new one if not already defined
int function createInstance(string pageName) global
    return JMap.object()
endfunction

function Log(string a_msg) global
	Debug.Trace("[PageConfig <PageConfigInstance (00000000)>]" + ": " + a_msg)
endFunction