; ----------------------------------
; YeOldeModConfig
; Script managing a MCM Menu Mod configs for YeOlde-Settings
; ----------------
ScriptName YeOldeConfig hidden


string[] function getAllModNames(int jConfig) global
    int jContainer = JMap.getObj(jConfig, "mods")
    return JMap.allKeysPArray(jContainer)
endfunction


; int function getMod(int jConfig, string a_modName) global
;     int jContainer = JMap.getObj(jConfig, "mods")
;     return JMap.getObj(jContainer, a_modName)
; endfunction

bool function isModInList(int jConfig, string a_modName) global
    int jContainer = JMap.getObj(jConfig, "mods")
    int jMod = JMap.getObj(jContainer, a_modName)
    return jMod > 0
endfunction

bool function isModNeedPatch(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "patch")
endfunction

bool function isModWillFail(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "error")
endfunction

bool function isModSelfBackup(int jConfig, string a_modName) global
    string type = getModBackupType(jConfig, a_modName)
    return (type == "selfpatch")
endfunction

bool function isModInstalled(int jConfig, string a_modName) global
    string fileName = getModFilename(jConfig, a_modName)
    if (filename == "")
        return false
    endif
    return Game.GetModByName(fileName) != 255
endfunction


string function getModFilename(int jConfig, string a_modName) global
    int jContainer = JMap.getObj(jConfig, "mods")
    int jMod = JMap.getObj(jContainer, a_modName)
    if (jMod == 0)
        return ""
    endif
    return JMap.getStr(jMod, "filename")
endfunction


string function getModBackupType(int jConfig, string a_modName) global
    int jContainer = JMap.getObj(jConfig, "mods")
    int jMod = JMap.getObj(jContainer, a_modName)
    if (jMod == 0)
        return ""
    endif
    return JMap.getStr(jMod, "backup type")
endfunction


int function getModMcmQuestName(int jConfig, string a_modName) global
    int jContainer = JMap.getObj(jConfig, "mods")
    int jMod = JMap.getObj(jContainer, a_modName)
    if (jMod == 0)
        return 0
    endif
    return JMap.getInt(jMod, "mcm quest")
endfunction


int function getModVersion(int jConfig, string a_modName) global
    int jContainer = JMap.getObj(jConfig, "mods")
    int jMod = JMap.getObj(jContainer, a_modName)
    if (jMod == 0)
        return -1
    endif
    return JMap.getInt(jMod, "version")
endfunction


function addMod(int jConfig, string a_modName, string a_modFileName, string a_backupType, int a_configQuestId, int a_version) global
    int jMod = JMap.object()
    int jContainer = JMap.getObj(jConfig, "mods")
    JMap.setObj(jContainer, a_modName, jMod)

    JMap.setStr(jMod, "name", a_modName)
    JMap.setStr(jMod, "filename", a_modFileName)
    JMap.setStr(jMod, "backup type", a_backupType)
    JMap.setInt(jMod, "mcm quest", a_configQuestId)
    JMap.setInt(jMod, "version", a_version)

    Save(jMod)
endfunction

string function GetYeOldeConfigFile() global
    return JContainers.userDirectory() + "yeolde-settings/yeolde_config.json"
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

    addMod(jConfig, "$Immersive Armors", "Hothtrooper44_ArmorCompilation.esp", "error", 0x02014836, 0)
    addMod(jConfig, "3PCO - 3rd Person Camera Overhaul", "3PCO.esp", "patch", 0x050012C3, 0)
    addMod(jConfig, "A Matter of Time", "AMatterOfTime.esp", "patch", 0x02002DB5, 4)
    addMod(jConfig, "AH Hotkeys", "AH Hotkeys.esp", "error", 0x02000D62, 0)
    addMod(jConfig, "Bounty Gold", "AH Hotkeys.esp", "error", 0x070012CE, 0)
    addMod(jConfig, "Campfire", "Campfire.esm", "selfpatch", 0, 0)
    addMod(jConfig, "Complete Alchemy", "Complete Alchemy & Cooking Overhaul.esp", "patch", 0x050A2A3F, 3)
    addMod(jConfig, "Diverse Dragons Col. 3", "DiverseDragonsCollectionSE.esp", "patch", 0x06E90017, 0)
    addMod(jConfig, "Enchanting Adjustments", "EnchantingAdjustments.esp", "patch", 0x06089320, 0)	
    addMod(jConfig, "Frostfall", "Frostfall.esp", "selfpatch", 0, 0)
    addMod(jConfig, "Hunterborn", "Hunterborn.esp", "patch", 0x05001D89, 0)
    addMod(jConfig, "I.C.O.W.", "CollegeOfWinterholdImmersive.esp", "patch", 0x06437FCE, 0)
    addMod(jConfig, "iEquip", "iEquip.esp", "patch", 0x0200CF33, 110)
    addMod(jConfig, "Immersive Creatures", "Skyrim Immersive Creatures Special Edition.esp", "error", 0x090C4C3A, 0)
    addMod(jConfig, "iNeed", "iNeed.esp", "patch", 0x0500334B, 0)
    addMod(jConfig, "Minty Lightning", "mintylightningmod.esp", "error", 0x08000D62, 0)
    addMod(jConfig, "OBIS - Bandits", "OBIS SE.esp", "patch", 0x0A08F0AA, 24)
    addMod(jConfig, "Skyrim Unbound", "Skyrim Unbound.esp", "error", 0x050012C6, 0)
    addMod(jConfig, "Skyrim Wayshrines", "WayshrinesIFT.esp", "error", 0x0417960E, 0)
    addMod(jConfig, "Wearable Lanterns", "Chesko_WearableLantern.esp", "error", 0x0417960E, 0)
    addMod(jConfig, "Wildcat Combat", "Wildcat - Combat of Skyrim.esp", "patch", 0x04053921, 0)
    
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



