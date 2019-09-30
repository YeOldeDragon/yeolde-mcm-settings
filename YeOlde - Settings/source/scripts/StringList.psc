scriptname StringList Hidden

int MAX_SIZE = 128
int property _next_index auto hidden
string[] property _list auto hidden

function Initialize()
    Log("Initialize")

    if _list == none
        _list = new string[128]
        _next_index = 0
    endif
endfunction


function Add(string value)
    Log("Add", value)
    if _list == none
        Log("Add", "List not initialized", 1)
        return
    endif

    if _next_index >= MAX_SIZE
        Log("Add", "List is full (128 items)", 1)
        return
    endif

    if self.HasItem(value)
        Log("Add", "Item '" + value + "' already in list", 1)
        return
    endif

    _list[_next_index] = value
    _next_index += 1
endfunction

function Remove(string value)
    Log("Remove", value)

    if _list == none
        Log("Remove", "List not initialized", 1)
        return
    endif

    int index = Find(value)

    if index == -1
        Log("Remove", "'" + value + "' not in list", 1)
        return
    endif

    _next_index -= 1
    while index < _next_index
        _list[index] = _list[index + 1]
        index += 1
    endwhile
endfunction

function Clear()
    int index = _next_index
    while index > 0
        index -= 1
        _list[index] = ""
    endwhile
    _next_index = 0
endfunction

string function GetAt(int index)
    Log("GetAt", index)
    if _list == none
        Log("GetAt", "List not initialized", 1)
        return ""
    endif

    if index < 0 || index >= _next_index
        Log("GetAt", "index '" + index + "', out of bound", 1)
        return ""
    endif
    return _list[index]
endfunction

int function Find(string value)
    Log("Find", value)
    if _list == none
        Log("Find", "List not initialized", 1)
        return -1
    endif

    int index = _next_index
    while index > 0
        index -= 1
        if _list[index] == value
            return index
        endif
    EndWhile

    return -1
endfunction

bool function HasItem(string value)
    Log("HasItem", value)
    return (self.Find(value) != -1)
endfunction

function Log(String functionName, String msg = "", int stackIndent = 0) global
    String sBaseIndent = ""
    While stackIndent>0
        result = result + "  "
        stackIndent -= 1        
    EndWhile
    
    String result = sBaseIndent + "yeolde_string_list::" + functionName
   
    if msg != ""
        result = result + " -> "
    endif

    Debug.Trace(result + msg)
endfunction