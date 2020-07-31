; ----------------------------------
; YeOldeConfig
; Script managing compatible mod infos for YeOlde - (MCM) Settings
; ----------------
ScriptName YeOldeConfig hidden



int function GetVersion() global
    return 1
endfunction 

string function GetDefaultModSelectionFilePath() global
    return JContainers.userDirectory() + "yeolde-settings/yeolde_mod_selection.json"
endfunction 

string function GetYeOldeConfigFile() global
    return JContainers.userDirectory() + "yeolde-settings/yeolde_config.json"
endfunction 

string[] function getAllModNames(int jConfig) global
    int jContainer = JMap.getObj(jConfig, "mods")
    return JMap.allKeysPArray(jContainer)
endfunction

bool function isModInList(int jConfig, string a_modName) global
    int jContainer = JMap.getObj(jConfig, "mods")
    return JMap.haskey(jContainer, a_modName)
endfunction

bool function isModNeedPatch(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "patch")
endfunction

bool function isModNeedInternalPatch(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "internal")
endfunction

bool function isModNeedExternalPatch(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "patch")
endfunction

bool function isModWillFail(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "error" || type == "Error")
endfunction

bool function isModOK(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "ok" || type == "Ok")
endfunction

bool function isModSelfBackup(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "selfpatch")
endfunction

bool function isModHaveInternalPatch(int jConfig, string a_modName) global
    string patchState = getModPatchState(jConfig, a_modName)
    return (patchState != "")
endfunction

bool function isNewFileVersionAvailable(int jConfig) global
    int fileVersion = getFileVersion(jConfig)
    return (fileVersion < getVersion())
endfunction


int function getFileVersion(int jConfig) global
    return JMap.getInt(jConfig, "version")
endfunction


string function getModPatchState(int jConfig, string a_modName) global
    int jContainer = JMap.getObj(jConfig, "mods")
    int jMod = JMap.getObj(jContainer, a_modName)
    if (jMod == 0)
        return ""
    endif
    return JMap.getStr(jMod, "patch state")
endfunction


string function getModBackupType(int jConfig, string a_modName) global
    int jContainer = JMap.getObj(jConfig, "mods")
    int jMod = JMap.getObj(jContainer, a_modName)
    if (jMod == 0)
        return ""
    endif
    return JMap.getStr(jMod, "backup type")
endfunction


function addMod(int jConfig, string a_modName, string a_backupType, string a_stateName = "") global
    int jMod = JMap.object()
    int jContainer = JMap.getObj(jConfig, "mods")
    JMap.setObj(jContainer, a_modName, jMod)

    ; JMap.setStr(jMod, "name", a_modName)
    JMap.setStr(jMod, "backup type", a_backupType)
    JMap.setStr(jMod, "patch state", a_stateName)

    Save(jMod)
endfunction


int function Load() global
    int jConfig = JValue.readFromFile(YeOldeConfig.GetYeOldeConfigFile())
    if (jConfig == 0)
        jConfig = CreateDefaultConfigFile()
    endif
    
    JValue.retain(jConfig)
    return jConfig
endfunction


int function CreateDefaultConfigFile() global
    int jConfig = JMap.object()
    int jMods = JMap.object()
    JMap.setObj(jConfig, "mods", jMods)

    JMap.setInt(jConfig, "version", GetVersion())

    addMod(jConfig, "$FMR", "error")
    addMod(jConfig, "$Holidays", "error")
    addMod(jConfig, "$Immersive Armors", "error")
    addMod(jConfig, "$TB_TradeAndBarter", "error")
    addMod(jConfig, "$Wet and Cold", "error")
    addMod(jConfig, "3PCO - 3rd Person Camera Overhaul", "error")
    ; addMod(jConfig, "3PCO - 3rd Person Camera Overhaul", "patch")
    addMod(jConfig, "Add Perk Points", "error")
    addMod(jConfig, "A Matter of Time", "internal", "AMOT") ; authorized
    addMod(jConfig, "AH Hotkeys", "error")
    addMod(jConfig, "Bound Armory", "error")
    addMod(jConfig, "Bounty Gold", "internal", "BountyGold") ; authorized
    addMod(jConfig, "Campfire", "selfpatch")
    ; addMod(jConfig, "Complete Alchemy", "patch")
    addMod(jConfig, "Complete Alchemy", "error")
    addMod(jConfig, "Complete Crafting", "error")
    addMod(jConfig, "Deadly Dragons", "error")
    addMod(jConfig, "Diverse Dragons Col. 3", "error")
    addMod(jConfig, "EasyWheel", "error")
    addMod(jConfig, "Enchanting Adjustments", "error")
    addMod(jConfig, "Equipment Manager", "error")
    ; addMod(jConfig, "Diverse Dragons Col. 3", "patch")
    ; addMod(jConfig, "Enchanting Adjustments", "patch")
    addMod(jConfig, "Follower Framework", "error")
    addMod(jConfig, "Frostfall", "selfpatch")
    addMod(jConfig, "Honed Metal", "ok")
    addMod(jConfig, "Hunterborn", "internal", "Hunterborn")  ; can't reach author for authorization
    addMod(jConfig, "I.C.O.W.", "error")
    addMod(jConfig, "Immersive College of Winterhold", "error")
    addMod(jConfig, "Immersive HUD", "error")
    addMod(jConfig, "Immersive Wenches", "ok")
    addMod(jConfig, "iEquip", "error")
    ; addMod(jConfig, "iEquip", "internal", "iEquip")
    addMod(jConfig, "Immersive Creatures", "error")
    addMod(jConfig, "Immersive Horses", "error")    
    addMod(jConfig, "Immersive Wenches", "ok")
    addMod(jConfig, "iNeed", "error")
    addMod(jConfig, "Jaxonz Positioner", "ok")
    ; addMod(jConfig, "iNeed", "patch")
    addMod(jConfig, "Less Intrusive HUD", "error")
    addMod(jConfig, "Minimap", "error")
    addMod(jConfig, "Minty Lightning", "internal", "MintyLightning") ; authorized
    addMod(jConfig, "OBIS - Bandits", "patch") ; authorized
    addMod(jConfig, "Ores & FireWood", "ok")
    addMod(jConfig, "Predator Vision", "ok")
    addMod(jConfig, "Quick Light", "ok")
    addMod(jConfig, "Realistic Water Two", "ok")
    addMod(jConfig, "SKY UI", "error") ; Favorites menu not restored
    addMod(jConfig, "Skyrim Unbound", "error")
    addMod(jConfig, "Skyrim's Unique Treasures", "error")
    addMod(jConfig, "Skyrim Wayshrines", "error")
    addMod(jConfig, "SPERG", "error")
    addMod(jConfig, "Tag & Track", "error")
    ; addMod(jConfig, "Take Notes!", "ok")
    addMod(jConfig, "Torches Cast Shadows", "error")
    addMod(jConfig, "Unread Books Glow", "ok")
    addMod(jConfig, "Wearable Lanterns", "error")
    addMod(jConfig, "Wildcat Combat", "internal", "Wildcat") ; can't reach author for authorization
    addMod(jConfig, "YeOlde - Crafting Bag", "ok")
    addMod(jConfig, "YeOlde - Hybrid Loot", "ok")
    addMod(jConfig, "YeOlde - MCM Settings", "ok")
    addMod(jConfig, "YeOlde - Respawn", "ok")
    
    ; addMod(jConfig, "", "ok")
    ; addMod(jConfig, "", "error")
    
    JValue.writeToFile(jConfig, GetYeOldeConfigFile())

    return jConfig
endfunction


function Save(int jConfig) global
    JValue.writeToFile(jConfig, GetYeOldeConfigFile())
endfunction


function SaveAndClose(int jConfig) global
    JValue.writeToFile(jConfig, GetYeOldeConfigFile())
    JValue.release(jConfig)
endfunction


function Log(string a_msg) global
	Debug.Trace("[YeOldeConfig <YeOldeConfigInstance (00000000)>]: " + a_msg)
endFunction



