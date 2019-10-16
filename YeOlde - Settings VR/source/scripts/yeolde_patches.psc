; ----------------------------------
; ModConfig
; Script managing a MCM Menu Mod configs for YeOlde-Settings
; ----------------
ScriptName yeolde_patches  extends Quest

string[]            _modNames
string[]            _statesNames
bool                _isInitialized = false

bool property IsInitialized
    bool function get()
        return _isInitialized
    endFunction
endproperty


function initialize()
    _modNames = Utility.CreateStringArray(25, "")
    _statesNames = Utility.CreateStringArray(25, "")

    _modNames[0] = "OBIS - Bandits"
    _statesNames[0] = "ObisBandits"
    _modNames[1] = "Hunterborn"
    _statesNames[1] = "Hunterborn"
    _modNames[2] = "iEquip"
    _statesNames[2] = "iEquip"
    _modNames[3] = "Minty Lightning"
    _statesNames[3] = "MintyLightning"
    _isInitialized = true
endfunction


bool function isPatchAvailable(string a_modName)
    int result = _modNames.Find(a_modName)
    Log("isPatchAvailable(" + a_modName + ") -> index " + result)
    return (result != -1)
endfunction

bool function setActivePatch(string a_modName)
    int index = _modNames.Find(a_modName)
    if (index > -1)
        GotoState(_statesNames[index])
        return true
    endif
    return false
endfunction

function OnBackupRequest(int jMod)
    Log("Error: OnBackupRequest() called without any state")
endfunction

function OnRestoreRequest(int jMod)
    Log("Error: OnRestoreRequest() called without any state")
endfunction


state ObisBandits
    function OnBackupRequest(int jMod)
        obis_mcmenu mcm = Quest.GetQuest("obis_mcmenu") as obis_mcmenu
        ; obis_mcmenu mcm = Game.GetFormFromFile(0x0408F0AA, "OBIS SE.esp") as obis_mcmenu
        if (mcm != none)
            Log("Error: OnBackupRequest() -> Can't get quest from file")
            return
        endif

        JMap.setInt(jMod, "OBIS_ExtraEnabled", mcm.OBIS_ExtraEnabled.GetValueInt())
        JMap.setInt(jMod, "OBIS_ExtraDefault", mcm.OBIS_ExtraDefault.GetValueInt())
        JMap.setInt(jMod, "OBISSize", mcm.OBISSize.GetValueInt())
        JMap.setInt(jMod, "ObisRandom", mcm.ObisRandom.GetValueInt())
        JMap.setInt(jMod, "OBIS_Governor", mcm.OBIS_Governor.GetValueInt())
        JMap.setInt(jMod, "OBIS_DungGovernor", mcm.OBIS_DungGovernor.GetValueInt())
        JMap.setInt(jMod, "GivePotion", mcm.GivePotion.GetValueInt())
        JMap.setInt(jMod, "potionchance", mcm.potionchance.GetValueInt())
        JMap.setInt(jMod, "ActivateDungeon", mcm.ActivateDungeon.GetValueInt())
        JMap.setInt(jMod, "OBIS_Intensity", mcm.OBIS_Intensity.GetValueInt())
        JMap.setInt(jMod, "OBIS_Cooldown", mcm.OBIS_Cooldown.GetValueInt())
        JMap.setInt(jMod, "LevelLimit", mcm.LevelLimit.GetValueInt())
        JMap.setInt(jMod, "deletebandits", mcm.deletebandits.GetValueInt())
        JMap.setInt(jMod, "ObisShowMessage", mcm.ObisShowMessage.GetValueInt())
        JMap.setInt(jMod, "OBIS_MinotaurEnable", mcm.OBIS_MinotaurEnable.GetValueInt())
        JMap.setInt(jMod, "OBIS_SpidersEnable", mcm.OBIS_SpidersEnable.GetValueInt())
    endfunction

    function OnRestoreRequest(int jMod)
        obis_mcmenu mcm = Quest.GetQuest("obis_mcmenu") as obis_mcmenu
        ; obis_mcmenu mcm = Game.GetFormFromFile(0x0408F0AA, "OBIS SE.esp") as obis_mcmenu
        if (mcm != none)
            Log("Error: OnBackupRequest() -> Can't get quest from file")
            return
        endif
        mcm.OBIS_ExtraEnabled.SetValueInt(JMap.getInt(jMod, "OBIS_ExtraEnabled"))
        mcm.OBIS_ExtraDefault.SetValueInt(JMap.getInt(jMod, "OBIS_ExtraDefault"))
        mcm.OBISSize.SetValueInt(JMap.getInt(jMod, "OBISSize"))
        mcm.ObisRandom.SetValueInt(JMap.getInt(jMod, "ObisRandom"))
        mcm.OBIS_Governor.SetValueInt(JMap.getInt(jMod, "OBIS_Governor"))
        mcm.OBIS_DungGovernor.SetValueInt(JMap.getInt(jMod, "OBIS_DungGovernor"))
        mcm.GivePotion.SetValueInt(JMap.getInt(jMod, "GivePotion"))
        mcm.potionchance.SetValueInt(JMap.getInt(jMod, "potionchance"))
        mcm.ActivateDungeon.SetValueInt(JMap.getInt(jMod, "ActivateDungeon"))
        mcm.OBIS_Intensity.SetValueInt(JMap.getInt(jMod, "OBIS_Intensity"))
        mcm.OBIS_Cooldown.SetValueInt(JMap.getInt(jMod, "OBIS_Cooldown"))
        mcm.LevelLimit.SetValueInt(JMap.getInt(jMod, "LevelLimit"))
        mcm.deletebandits.SetValueInt(JMap.getInt(jMod, "deletebandits"))
        mcm.ObisShowMessage.SetValueInt(JMap.getInt(jMod, "ObisShowMessage"))
        mcm.OBIS_MinotaurEnable.SetValueInt(JMap.getInt(jMod, "OBIS_MinotaurEnable"))
        mcm.OBIS_SpidersEnable.SetValueInt(JMap.getInt(jMod, "OBIS_SpidersEnable"))
        
        mcm.SyncSettings()
    endfunction
endstate


state Hunterborn
    function OnBackupRequest(int jMod)
        _DS_HB_Globals mcm = Quest.GetQuest("_DS_Hunterborn") as _DS_HB_Globals

        if (mcm != none)
            Log("Error: OnBackupRequest() -> Can't get quest '_DS_Hunterborn' from file")
            return
        endif

        JMap.setFlt(jMod, "_DS_Hunterborn_Action_Crouch",mcm._DS_Hunterborn_Action_Crouch.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ActionCleanCarcass",mcm._DS_Hunterborn_ActionCleanCarcass.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ActionCleanCarcassSneak",mcm._DS_Hunterborn_ActionCleanCarcassSneak.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ActionFreshCarcass",mcm._DS_Hunterborn_ActionFreshCarcass.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ActionFreshCarcassSneak",mcm._DS_Hunterborn_ActionFreshCarcassSneak.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ActionsTimed",mcm._DS_Hunterborn_ActionsTimed.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_AddTaxonomy",mcm._DS_Hunterborn_AddTaxonomy.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_BlockSkyRe",mcm._DS_Hunterborn_BlockSkyRe.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_BrewLevel",mcm._DS_Hunterborn_BrewLevel.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ButcherTimed",mcm._DS_Hunterborn_ButcherTimed.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_CarcassYield",mcm._DS_Hunterborn_CarcassYield.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ClawsAsHuntingKnife",mcm._DS_Hunterborn_ClawsAsHuntingKnife.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_DebugMode",mcm._DS_Hunterborn_DebugMode.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_DragonsCorporeal",mcm._DS_Hunterborn_DragonsCorporeal.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_DressTimed",mcm._DS_Hunterborn_DressTimed.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableBotanyPerk",mcm._DS_Hunterborn_EnableBotanyPerk.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableBountyPerk",mcm._DS_Hunterborn_EnableBountyPerk.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableForaging",mcm._DS_Hunterborn_EnableForaging.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableHuntersCache",mcm._DS_Hunterborn_EnableHuntersCache.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnablePrimitiveCooking",mcm._DS_Hunterborn_EnablePrimitiveCooking.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableSavageArrows",mcm._DS_Hunterborn_EnableSavageArrows.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableScrimshaw",mcm._DS_Hunterborn_EnableScrimshaw.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableSenseDirection",mcm._DS_Hunterborn_EnableSenseDirection.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableSoupsStews",mcm._DS_Hunterborn_EnableSoupsStews.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_FadeOuts",mcm._DS_Hunterborn_FadeOuts.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ForageExp",mcm._DS_Hunterborn_ForageExp.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ForageLevel",mcm._DS_Hunterborn_ForageLevel.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ForageTimed",mcm._DS_Hunterborn_ForageTimed.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_Frostfall_Added",mcm._DS_Hunterborn_Frostfall_Added.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_Frostfall_Removed",mcm._DS_Hunterborn_Frostfall_Removed.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HarvestExp",mcm._DS_Hunterborn_HarvestExp.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HarvestLevel",mcm._DS_Hunterborn_HarvestLevel.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HarvestTimed",mcm._DS_Hunterborn_HarvestTimed.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_Hotkey_HideAbilities",mcm._DS_Hunterborn_Hotkey_HideAbilities.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_Hotkey_HideMenu",mcm._DS_Hunterborn_Hotkey_HideMenu.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyButcher",mcm._DS_Hunterborn_HotkeyButcher.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyDress",mcm._DS_Hunterborn_HotkeyDress.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyForage",mcm._DS_Hunterborn_HotkeyForage.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyHarvest",mcm._DS_Hunterborn_HotkeyHarvest.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyPrimitiveCooking",mcm._DS_Hunterborn_HotkeyPrimitiveCooking.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyProcess",mcm._DS_Hunterborn_HotkeyProcess.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyScrimshaw",mcm._DS_Hunterborn_HotkeyScrimshaw.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeySenseDirection",mcm._DS_Hunterborn_HotkeySenseDirection.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeySkin",mcm._DS_Hunterborn_HotkeySkin.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyTaxonomy",mcm._DS_Hunterborn_HotkeyTaxonomy.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_HuntingKnife",mcm._DS_Hunterborn_HuntingKnife.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeChicken",mcm._DS_Hunterborn_IncludeChicken.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeDog",mcm._DS_Hunterborn_IncludeDog.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeHare",mcm._DS_Hunterborn_IncludeHare.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterChaurus",mcm._DS_Hunterborn_IncludeMonsterChaurus.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterDragons",mcm._DS_Hunterborn_IncludeMonsterDragons.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterSpiders",mcm._DS_Hunterborn_IncludeMonsterSpiders.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterSpriggans",mcm._DS_Hunterborn_IncludeMonsterSpriggans.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterTrolls",mcm._DS_Hunterborn_IncludeMonsterTrolls.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterWerewolves",mcm._DS_Hunterborn_IncludeMonsterWerewolves.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMudcrab",mcm._DS_Hunterborn_IncludeMudcrab.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeSkeever",mcm._DS_Hunterborn_IncludeSkeever.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_IncludeSlaughterfish",mcm._DS_Hunterborn_IncludeSlaughterfish.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_KnifeSales",mcm._DS_Hunterborn_KnifeSales.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_MatAmount",mcm._DS_Hunterborn_MatAmount.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_MeatValue",mcm._DS_Hunterborn_MeatValue.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_MeatYield",mcm._DS_Hunterborn_MeatYield.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_MeatYieldCustom",mcm._DS_Hunterborn_MeatYieldCustom.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_MonsterHunter",mcm._DS_Hunterborn_MonsterHunter.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_PeltValue",mcm._DS_Hunterborn_PeltValue.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_PerMaAddLeather",mcm._DS_Hunterborn_PerMaAddLeather.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_PerMaGathererWarned",mcm._DS_Hunterborn_PerMaGathererWarned.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_PerMaLevelWayfarer",mcm._DS_Hunterborn_PerMaLevelWayfarer.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_PreventBearStash",mcm._DS_Hunterborn_PreventBearStash.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_PreventInCombat",mcm._DS_Hunterborn_PreventInCombat.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_PreventOverburden",mcm._DS_Hunterborn_PreventOverburden.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_RemoveManualLoot",mcm._DS_Hunterborn_RemoveManualLoot.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_RequireCookbook",mcm._DS_Hunterborn_RequireCookbook.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_RequireHuntingKnife",mcm._DS_Hunterborn_RequireHuntingKnife.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ReweighMeat",mcm._DS_Hunterborn_ReweighMeat.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_RiteRing_Wearing",mcm._DS_Hunterborn_RiteRing_Wearing.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_RiteStage_Elm",mcm._DS_Hunterborn_RiteStage_Elm.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_RiteStage_Oak",mcm._DS_Hunterborn_RiteStage_Oak.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_RiteStage_Yew",mcm._DS_Hunterborn_RiteStage_Yew.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_ShowScreenBlood",mcm._DS_Hunterborn_ShowScreenBlood.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SkinExp",mcm._DS_Hunterborn_SkinExp.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SkinLevel",mcm._DS_Hunterborn_SkinLevel.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SkinTimed",mcm._DS_Hunterborn_SkinTimed.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SkyReAddLeather",mcm._DS_Hunterborn_SkyReAddLeather.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SkyReGathererWarned",mcm._DS_Hunterborn_SkyReGathererWarned.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SkyReLevelWayfarer",mcm._DS_Hunterborn_SkyReLevelWayfarer.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SmallGame",mcm._DS_Hunterborn_SmallGame.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SoupLifetime",mcm._DS_Hunterborn_SoupLifetime.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SoupReturnBowl",mcm._DS_Hunterborn_SoupReturnBowl.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_SoupStayHot",mcm._DS_Hunterborn_SoupStayHot.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseAnimation",mcm._DS_Hunterborn_UseAnimation.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseCampfireWood",mcm._DS_Hunterborn_UseCampfireWood.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseCombinedCustomMats",mcm._DS_Hunterborn_UseCombinedCustomMats.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseCombinedCustomMeats",mcm._DS_Hunterborn_UseCombinedCustomMeats.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseCombinedCustomPelts",mcm._DS_Hunterborn_UseCombinedCustomPelts.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseCustomMats",mcm._DS_Hunterborn_UseCustomMats.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_EnableFurPlate",mcm._DS_Hunterborn_EnableFurPlate.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseCustomMeats",mcm._DS_Hunterborn_UseCustomMeats.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseCustomPelts",mcm._DS_Hunterborn_UseCustomPelts.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseCustomTextures",mcm._DS_Hunterborn_UseCustomTextures.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_UseHiSTextures",mcm._DS_Hunterborn_UseHiSTextures.GetValue())
        JMap.setFlt(jMod, "_DS_Hunterborn_TotalCleans",mcm._DS_Hunterborn_TotalCleans.GetValue())
    endfunction

    function OnRestoreRequest(int jMod)
        _DS_HB_Globals mcm = Quest.GetQuest("_DS_Hunterborn") as _DS_HB_Globals

        if (mcm != none)
            Log("Error: OnBackupRequest() -> Can't get quest '_DS_Hunterborn' from file")
            return
        endif

        mcm._DS_Hunterborn_Action_Crouch.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Action_Crouch"))
        mcm._DS_Hunterborn_ActionCleanCarcass.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionCleanCarcass"))
        mcm._DS_Hunterborn_ActionCleanCarcassSneak.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionCleanCarcassSneak"))
        mcm._DS_Hunterborn_ActionFreshCarcass.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionFreshCarcass"))
        mcm._DS_Hunterborn_ActionFreshCarcassSneak.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionFreshCarcassSneak"))
        mcm._DS_Hunterborn_ActionsTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionsTimed"))
        mcm._DS_Hunterborn_AddTaxonomy.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_AddTaxonomy"))
        mcm._DS_Hunterborn_BlockSkyRe.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_BlockSkyRe"))
        mcm._DS_Hunterborn_BrewLevel.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_BrewLevel"))
        mcm._DS_Hunterborn_ButcherTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ButcherTimed"))
        mcm._DS_Hunterborn_CarcassYield.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_CarcassYield"))
        mcm._DS_Hunterborn_ClawsAsHuntingKnife.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ClawsAsHuntingKnife"))
        mcm._DS_Hunterborn_DebugMode.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_DebugMode"))
        mcm._DS_Hunterborn_DragonsCorporeal.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_DragonsCorporeal"))
        mcm._DS_Hunterborn_DressTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_DressTimed"))
        mcm._DS_Hunterborn_EnableBotanyPerk.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableBotanyPerk"))
        mcm._DS_Hunterborn_EnableBountyPerk.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableBountyPerk"))
        mcm._DS_Hunterborn_EnableForaging.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableForaging"))
        mcm._DS_Hunterborn_EnableHuntersCache.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableHuntersCache"))
        mcm._DS_Hunterborn_EnablePrimitiveCooking.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnablePrimitiveCooking"))
        mcm._DS_Hunterborn_EnableSavageArrows.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableSavageArrows"))
        mcm._DS_Hunterborn_EnableScrimshaw.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableScrimshaw"))
        mcm._DS_Hunterborn_EnableSenseDirection.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableSenseDirection"))
        mcm._DS_Hunterborn_EnableSoupsStews.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableSoupsStews"))
        mcm._DS_Hunterborn_FadeOuts.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_FadeOuts"))
        mcm._DS_Hunterborn_ForageExp.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ForageExp"))
        mcm._DS_Hunterborn_ForageLevel.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ForageLevel"))
        mcm._DS_Hunterborn_ForageTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ForageTimed"))
        mcm._DS_Hunterborn_Frostfall_Added.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Frostfall_Added"))
        mcm._DS_Hunterborn_Frostfall_Removed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Frostfall_Removed"))
        mcm._DS_Hunterborn_HarvestExp.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HarvestExp"))
        mcm._DS_Hunterborn_HarvestLevel.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HarvestLevel"))
        mcm._DS_Hunterborn_HarvestTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HarvestTimed"))
        mcm._DS_Hunterborn_Hotkey_HideAbilities.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Hotkey_HideAbilities"))
        mcm._DS_Hunterborn_Hotkey_HideMenu.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Hotkey_HideMenu"))
        mcm._DS_Hunterborn_HotkeyButcher.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyButcher"))
        mcm._DS_Hunterborn_HotkeyDress.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyDress"))
        mcm._DS_Hunterborn_HotkeyForage.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyForage"))
        mcm._DS_Hunterborn_HotkeyHarvest.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyHarvest"))
        mcm._DS_Hunterborn_HotkeyPrimitiveCooking.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyPrimitiveCooking"))
        mcm._DS_Hunterborn_HotkeyProcess.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyProcess"))
        mcm._DS_Hunterborn_HotkeyScrimshaw.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyScrimshaw"))
        mcm._DS_Hunterborn_HotkeySenseDirection.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeySenseDirection"))
        mcm._DS_Hunterborn_HotkeySkin.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeySkin"))
        mcm._DS_Hunterborn_HotkeyTaxonomy.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyTaxonomy"))
        mcm._DS_Hunterborn_HuntingKnife.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HuntingKnife"))
        mcm._DS_Hunterborn_IncludeChicken.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeChicken"))
        mcm._DS_Hunterborn_IncludeDog.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeDog"))
        mcm._DS_Hunterborn_IncludeHare.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeHare"))
        mcm._DS_Hunterborn_IncludeMonsterChaurus.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterChaurus"))
        mcm._DS_Hunterborn_IncludeMonsterDragons.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterDragons"))
        mcm._DS_Hunterborn_IncludeMonsterSpiders.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterSpiders"))
        mcm._DS_Hunterborn_IncludeMonsterSpriggans.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterSpriggans"))
        mcm._DS_Hunterborn_IncludeMonsterTrolls.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterTrolls"))
        mcm._DS_Hunterborn_IncludeMonsterWerewolves.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterWerewolves"))
        mcm._DS_Hunterborn_IncludeMudcrab.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMudcrab"))
        mcm._DS_Hunterborn_IncludeSkeever.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeSkeever"))
        mcm._DS_Hunterborn_IncludeSlaughterfish.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeSlaughterfish"))
        mcm._DS_Hunterborn_KnifeSales.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_KnifeSales"))
        mcm._DS_Hunterborn_MatAmount.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MatAmount"))
        mcm._DS_Hunterborn_MeatValue.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MeatValue"))
        mcm._DS_Hunterborn_MeatYield.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MeatYield"))
        mcm._DS_Hunterborn_MeatYieldCustom.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MeatYieldCustom"))
        mcm._DS_Hunterborn_MonsterHunter.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MonsterHunter"))
        mcm._DS_Hunterborn_PeltValue.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PeltValue"))
        mcm._DS_Hunterborn_PerMaAddLeather.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PerMaAddLeather"))
        mcm._DS_Hunterborn_PerMaGathererWarned.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PerMaGathererWarned"))
        mcm._DS_Hunterborn_PerMaLevelWayfarer.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PerMaLevelWayfarer"))
        mcm._DS_Hunterborn_PreventBearStash.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PreventBearStash"))
        mcm._DS_Hunterborn_PreventInCombat.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PreventInCombat"))
        mcm._DS_Hunterborn_PreventOverburden.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PreventOverburden"))
        mcm._DS_Hunterborn_RemoveManualLoot.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RemoveManualLoot"))
        mcm._DS_Hunterborn_RequireCookbook.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RequireCookbook"))
        mcm._DS_Hunterborn_RequireHuntingKnife.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RequireHuntingKnife"))
        mcm._DS_Hunterborn_ReweighMeat.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ReweighMeat"))
        mcm._DS_Hunterborn_RiteRing_Wearing.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RiteRing_Wearing"))
        mcm._DS_Hunterborn_RiteStage_Elm.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RiteStage_Elm"))
        mcm._DS_Hunterborn_RiteStage_Oak.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RiteStage_Oak"))
        mcm._DS_Hunterborn_RiteStage_Yew.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RiteStage_Yew"))
        mcm._DS_Hunterborn_ShowScreenBlood.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ShowScreenBlood"))
        mcm._DS_Hunterborn_SkinExp.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkinExp"))
        mcm._DS_Hunterborn_SkinLevel.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkinLevel"))
        mcm._DS_Hunterborn_SkinTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkinTimed"))
        mcm._DS_Hunterborn_SkyReAddLeather.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkyReAddLeather"))
        mcm._DS_Hunterborn_SkyReGathererWarned.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkyReGathererWarned"))
        mcm._DS_Hunterborn_SkyReLevelWayfarer.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkyReLevelWayfarer"))
        mcm._DS_Hunterborn_SmallGame.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SmallGame"))
        mcm._DS_Hunterborn_SoupLifetime.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SoupLifetime"))
        mcm._DS_Hunterborn_SoupReturnBowl.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SoupReturnBowl"))
        mcm._DS_Hunterborn_SoupStayHot.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SoupStayHot"))
        mcm._DS_Hunterborn_UseAnimation.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseAnimation"))
        mcm._DS_Hunterborn_UseCampfireWood.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCampfireWood"))
        mcm._DS_Hunterborn_UseCombinedCustomMats.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCombinedCustomMats"))
        mcm._DS_Hunterborn_UseCombinedCustomMeats.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCombinedCustomMeats"))
        mcm._DS_Hunterborn_UseCombinedCustomPelts.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCombinedCustomPelts"))
        mcm._DS_Hunterborn_UseCustomMats.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCustomMats"))
        mcm._DS_Hunterborn_EnableFurPlate.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableFurPlate"))
        mcm._DS_Hunterborn_UseCustomMeats.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCustomMeats"))
        mcm._DS_Hunterborn_UseCustomPelts.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCustomPelts"))
        mcm._DS_Hunterborn_UseCustomTextures.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCustomTextures"))
        mcm._DS_Hunterborn_UseHiSTextures.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseHiSTextures"))
        mcm._DS_Hunterborn_TotalCleans.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_TotalCleans"))
    endfunction
endstate


state iEquip
    function OnBackupRequest(int jMod)
        iEquip_MCM mcm = Quest.GetQuest("iEquip_MCMQuest") as iEquip_MCM
        if (mcm != none)
            Log("Error: OnBackupRequest() -> Can't get quest 'iEquip_MCMQuest'")
            return
        endif
        
        mcm.savePreset("yeolde-settings")
    endfunction

    function OnRestoreRequest(int jMod)
        iEquip_MCM mcm = Quest.GetQuest("iEquip_MCMQuest") as iEquip_MCM
        if (mcm != none)
            Log("Error: OnBackupRequest() -> Can't get quest 'iEquip_MCMQuest'")
            return
        endif
        
        mcm.loadPreset("yeolde-settings")
    endfunction
endstate


state MintyLightning
    function OnBackupRequest(int jMod)
        MintyConfigScript mcm = Quest.GetQuest("MintyLightningQuest") as MintyConfigScript
        if (mcm != none)
            Log("Error: OnBackupRequest() -> Can't get quest 'MintyLightningQuest'")
            return
        endif
        JMap.setFlt(jMod, "MintyIsForkLightningHostile", mcm.MintyIsForkLightningHostile.GetValue())
        JMap.setFlt(jMod, "MintyIsForkLightningHostileDefault", mcm.MintyIsForkLightningHostileDefault.GetValue())
        JMap.setFlt(jMod, "MintyIsSheetLightningHostile", mcm.MintyIsSheetLightningHostile.GetValue())
        JMap.setFlt(jMod, "MintyIsSheetLightningHostileDefault", mcm.MintyIsSheetLightningHostileDefault.GetValue())
        JMap.setFlt(jMod, "MintyFaceTarget", mcm.MintyFaceTarget.GetValue())
        JMap.setFlt(jMod, "MintyIsForkEnabled", mcm.MintyIsForkEnabled.GetValue())
        JMap.setFlt(jMod, "MintyIsForkEnabledDefault", mcm.MintyIsForkEnabledDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkDistanceMin", mcm.MintyForkDistanceMin.GetValue())
        JMap.setFlt(jMod, "MintyForkDistanceMinDefault", mcm.MintyForkDistanceMinDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkDistanceMax", mcm.MintyForkDistanceMax.GetValue())
        JMap.setFlt(jMod, "MintyForkDistanceMaxDefault", mcm.MintyForkDistanceMaxDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkFrequency", mcm.MintyForkFrequency.GetValue())
        JMap.setFlt(jMod, "MintyForkFrequencyDefault", mcm.MintyForkFrequencyDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkBloom", mcm.MintyForkBloom.GetValue())
        JMap.setFlt(jMod, "MintyForkBloomDefault", mcm.MintyForkBloomDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkWait", mcm.MintyForkWait.GetValue())
        JMap.setFlt(jMod, "MintyForkWaitDefault", mcm.MintyForkWaitDefault.GetValue())
        JMap.setFlt(jMod, "MintyIsSheetEnabled", mcm.MintyIsSheetEnabled.GetValue())
        JMap.setFlt(jMod, "MintyIsSheetEnabledDefault", mcm.MintyIsSheetEnabledDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetDistanceMin", mcm.MintySheetDistanceMin.GetValue())
        JMap.setFlt(jMod, "MintySheetDistanceMinDefault", mcm.MintySheetDistanceMinDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetDistanceMax", mcm.MintySheetDistanceMax.GetValue())
        JMap.setFlt(jMod, "MintySheetDistanceMaxDefault", mcm.MintySheetDistanceMaxDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetFrequency", mcm.MintySheetFrequency.GetValue())
        JMap.setFlt(jMod, "MintySheetFrequencyDefault", mcm.MintySheetFrequencyDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetBloom", mcm.MintySheetBloom.GetValue())
        JMap.setFlt(jMod, "MintySheetBloomDefault", mcm.MintySheetBloomDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetWait", mcm.MintySheetWait.GetValue())
        JMap.setFlt(jMod, "MintySheetWaitDefault", mcm.MintySheetWaitDefault.GetValue())
        JMap.setFlt(jMod, "MintyWeatherCheckFrequency", mcm.MintyWeatherCheckFrequency.GetValue())
        JMap.setFlt(jMod, "MintyCellSize", mcm.MintyCellSize.GetValue())
        JMap.setFlt(jMod, "MintyCellHeight", mcm.MintyCellHeight.GetValue())
        JMap.setFlt(jMod, "MintyStrikeDistance", mcm.MintyStrikeDistance.GetValue())
        JMap.setFlt(jMod, "MintyStrikeHeightByRegion", mcm.MintyStrikeHeightByRegion.GetValue())
        JMap.setFlt(jMod, "MintyDisableLegacyMenu", mcm.MintyDisableLegacyMenu.GetValue())
        JMap.setFlt(jMod, "MintySheetSoundDelay", mcm.MintySheetSoundDelay.GetValue())
        JMap.setFlt(jMod, "MintyForkSoundDelay", mcm.MintyForkSoundDelay.GetValue())
        JMap.setFlt(jMod, "MAGProjectileStormVar", mcm.MAGProjectileStormVar.GetValue())
        JMap.setFlt(jMod, "MintyLoggingEnabled", mcm.MintyLoggingEnabled.GetValue())
        JMap.setFlt(jMod, "MintyFeedBackEnabled", mcm.MintyFeedBackEnabled.GetValue())
    endfunction


    function OnRestoreRequest(int jMod)
        MintyConfigScript mcm = Quest.GetQuest("MintyLightningQuest") as MintyConfigScript
        if (mcm != none)
            Log("Error: OnBackupRequest() -> Can't get quest 'MintyLightningQuest'")
            return
        endif
        mcm.MintyIsForkLightningHostile.SetValue(JMap.getFlt(jMod, "MintyIsForkLightningHostile"))
        mcm.MintyIsForkLightningHostileDefault.SetValue(JMap.getFlt(jMod, "MintyIsForkLightningHostileDefault"))
        mcm.MintyIsSheetLightningHostile.SetValue(JMap.getFlt(jMod, "MintyIsSheetLightningHostile"))
        mcm.MintyIsSheetLightningHostileDefault.SetValue(JMap.getFlt(jMod, "MintyIsSheetLightningHostileDefault"))
        mcm.MintyFaceTarget.SetValue(JMap.getFlt(jMod, "MintyFaceTarget"))
        mcm.MintyIsForkEnabled.SetValue(JMap.getFlt(jMod, "MintyIsForkEnabled"))
        mcm.MintyIsForkEnabledDefault.SetValue(JMap.getFlt(jMod, "MintyIsForkEnabledDefault"))
        mcm.MintyForkDistanceMin.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMin"))
        mcm.MintyForkDistanceMinDefault.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMinDefault"))
        mcm.MintyForkDistanceMax.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMax"))
        mcm.MintyForkDistanceMaxDefault.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMaxDefault"))
        mcm.MintyForkFrequency.SetValue(JMap.getFlt(jMod, "MintyForkFrequency"))
        mcm.MintyForkFrequencyDefault.SetValue(JMap.getFlt(jMod, "MintyForkFrequencyDefault"))
        mcm.MintyForkBloom.SetValue(JMap.getFlt(jMod, "MintyForkBloom"))
        mcm.MintyForkBloomDefault.SetValue(JMap.getFlt(jMod, "MintyForkBloomDefault"))
        mcm.MintyForkWait.SetValue(JMap.getFlt(jMod, "MintyForkWait"))
        mcm.MintyForkWaitDefault.SetValue(JMap.getFlt(jMod, "MintyForkWaitDefault"))
        mcm.MintyIsSheetEnabled.SetValue(JMap.getFlt(jMod, "MintyIsSheetEnabled"))
        mcm.MintyIsSheetEnabledDefault.SetValue(JMap.getFlt(jMod, "MintyIsSheetEnabledDefault"))
        mcm.MintySheetDistanceMin.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMin"))
        mcm.MintySheetDistanceMinDefault.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMinDefault"))
        mcm.MintySheetDistanceMax.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMax"))
        mcm.MintySheetDistanceMaxDefault.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMaxDefault"))
        mcm.MintySheetFrequency.SetValue(JMap.getFlt(jMod, "MintySheetFrequency"))
        mcm.MintySheetFrequencyDefault.SetValue(JMap.getFlt(jMod, "MintySheetFrequencyDefault"))
        mcm.MintySheetBloom.SetValue(JMap.getFlt(jMod, "MintySheetBloom"))
        mcm.MintySheetBloomDefault.SetValue(JMap.getFlt(jMod, "MintySheetBloomDefault"))
        mcm.MintySheetWait.SetValue(JMap.getFlt(jMod, "MintySheetWait"))
        mcm.MintySheetWaitDefault.SetValue(JMap.getFlt(jMod, "MintySheetWaitDefault"))
        mcm.MintyWeatherCheckFrequency.SetValue(JMap.getFlt(jMod, "MintyWeatherCheckFrequency"))
        mcm.MintyCellSize.SetValue(JMap.getFlt(jMod, "MintyCellSize"))
        mcm.MintyCellHeight.SetValue(JMap.getFlt(jMod, "MintyCellHeight"))
        mcm.MintyStrikeDistance.SetValue(JMap.getFlt(jMod, "MintyStrikeDistance"))
        mcm.MintyStrikeHeightByRegion.SetValue(JMap.getFlt(jMod, "MintyStrikeHeightByRegion"))
        mcm.MintyDisableLegacyMenu.SetValue(JMap.getFlt(jMod, "MintyDisableLegacyMenu"))
        mcm.MintySheetSoundDelay.SetValue(JMap.getFlt(jMod, "MintySheetSoundDelay"))
        mcm.MintyForkSoundDelay.SetValue(JMap.getFlt(jMod, "MintyForkSoundDelay"))
        mcm.MAGProjectileStormVar.SetValue(JMap.getFlt(jMod, "MAGProjectileStormVar"))
        mcm.MintyLoggingEnabled.SetValue(JMap.getFlt(jMod, "MintyLoggingEnabled"))
        mcm.MintyFeedBackEnabled.SetValue(JMap.getFlt(jMod, "MintyFeedBackEnabled"))
    endfunction
endstate



function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction