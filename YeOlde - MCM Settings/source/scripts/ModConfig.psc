; ----------------------------------
; ModConfig
; Script managing a MCM Menu Mod configs for YeOlde-Settings
; ----------------
ScriptName ModConfig hidden

import JContainers
import PageConfig


string property SaveFolder hidden
    string function get()
        return JContainers.userDirectory() + "yeolde-settings/"
    endFunction
endProperty


string[] function PageNames(int jMod) global
    return JMap.allKeysPArray(jMod)
endfunction


int function getPage(int jMod, string pageName) global
    return JMap.getObj(jMod, pageName)
endfunction


int function addPage(int jMod, string pageName, bool overwrite = true) global
    Log("addPage(" + jMod + ", " + pageName + ", " + overwrite + ")")

    int jResult = JMap.getObj(jMod, pageName)
    if (jResult == 0)
        jResult = PageConfig.createInstance(pageName)
    endif
    
    ; Add the new option in jMod.pages map
    JMap.setObj(jMod, pageName, jResult)

    return jResult
endfunction

; Get the objet, or create a new one if not already defined
int function createInstance(string modName) global
    return JMap.object()
endfunction


function Log(string a_msg) global
	Debug.Trace("[ModConfig <ModConfigInstance (00000000)>]" + ": " + a_msg)
endFunction



