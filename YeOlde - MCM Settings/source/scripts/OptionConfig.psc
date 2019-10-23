; ----------------------------------
; PageConfig
; Script managing a MCM Menu Page configs for YeOlde-Settings
; ----------------
ScriptName OptionConfig hidden

import JContainers


int function getId(int jOption) global
    return JMap.getInt(jOption, "id")
endfunction


int function getOptionType(int jOption) global
    return JMap.getInt(jOption, "optionType")
endfunction


int function getIntValue(int jOption) global
    return JMap.getInt(jOption, "fltValue") as int
endfunction


float function getFltValue(int jOption) global
    return JMap.getFlt(jOption, "fltValue")
endfunction


string function getStrValue(int jOption) global
    return JMap.getStr(jOption, "strValue")
endfunction


string function getStateOptionValue(int jOption) global
    return JMap.getInt(jOption, "stateOption")
endfunction


function setOptionType(int jOption, int value) global
    JMap.setInt(jOption, "optionType", value)
endfunction


function setFltValue(int jOption, float value) global
    JMap.setFlt(jOption, "fltValue", value)
endfunction


function setStrValue(int jOption, string value) global
    JMap.setStr(jOption, "strValue", value)
endfunction


function setStateOptionValue(int jOption, string value) global
    JMap.setStr(jOption, "stateOption", value)
endfunction



; Get the objet, or create a new one if not already defined
int function createInstance(int optionId, int optionType, string strValue, float fltValue, string stateOption) global
    ; Log("createInstance(" + optionId + ")")
    int jResult = JMap.object()
    ; Log("createInstance() -> jResult: " + jResult)
    JMap.setInt(jResult, "id", optionId)
    ; Log("createInstance() -> id")
    if (strValue != "")
        JMap.setStr(jResult, "strValue", strValue)
        ; Log("createInstance() -> sestrValuetStr")
    endif
    ; JMap.setInt(jResult, "intValue", intValue)
    JMap.setFlt(jResult, "fltValue", fltValue)
    ; Log("createInstance() -> fltValue")
    JMap.setInt(jResult, "optionType", optionType)
    ; Log("createInstance() -> optionType")
    if (stateOption != "")
        JMap.setStr(jResult, "stateOption", stateOption)
        ; Log("createInstance() -> stateOption")
    endif

    return jResult
endfunction

function Log(string a_msg) global
	Debug.Trace("[OptionConfig <OptionConfigInstance (00000000)>]" + ": " + a_msg)
endFunction