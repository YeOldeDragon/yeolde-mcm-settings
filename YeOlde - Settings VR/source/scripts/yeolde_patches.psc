; ----------------------------------
; yeolde_patches
; Script managing all internal patches for YeOlde - (MCM) Settings
;
; To create a patch, you need to:
; - add a state in yeolde_config.json (and in the file creation function, script YeOldeConfig) for the related mod,
; - Overwrite OnBackupRequest and OnRestoreRequest for this mod here
; ----------------
ScriptName yeolde_patches  extends Quest

bool        _isInitialized = false
int         _jConfig = 0    ; JMap handler to YeOldeConfig data

int         RETURN_SUCCESS = 0
int         RETURN_ERROR = 1


bool property IsInitialized
    bool function get()
        return _isInitialized
    endFunction
endproperty

function initialize(int a_jConfig)
    _jConfig = a_jConfig
    JValue.retain(_jConfig)

    _isInitialized = true
endfunction

bool function isPatchAvailable(string a_modName)
    bool result = YeOldeConfig.isModNeedInternalPatch(_jConfig, a_modName)
    Log("isPatchAvailable(" + a_modName + ") -> result " + result)
    return result
endfunction

bool function setActivePatch(string a_modName)
    string patchState = YeOldeConfig.getModPatchState(_jConfig, a_modName)
    Log("setActivePatch(" + a_modName + ") -> state:" + patchState)
    if (patchState != "")
        GotoState(patchState)
        return true
    endif
    return false
endfunction

int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
    Log("Error: OnBackupRequest() called without any state")
    return RETURN_ERROR
endfunction

int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
    Log("Error: OnRestoreRequest() called without any state")
    return RETURN_ERROR
endfunction

state AMOT
    int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
        AMOTMenuQuestScript mcm = a_quest as AMOTMenuQuestScript
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'AMOTMenuQuestScript'")
            return RETURN_ERROR
        endif
        
        bool result = mcm.SaveUserSettings()

        return (!result) as int
    endfunction

    int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
        AMOTMenuQuestScript mcm = a_quest as AMOTMenuQuestScript
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'AMOTMenuQuestScript'")
            return RETURN_ERROR
        endif
        
        bool result = mcm.LoadUserSettings() 
        return (!result) as int
    endfunction
endstate

state BountyGold
    int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
        BountyGoldConfigMenuScript mcm = a_quest as BountyGoldConfigMenuScript
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'BountyGoldConfigMenuScript'")
            return RETURN_ERROR
        endif
        
        JMap.setFlt(jMod, "BanditBaseGold", mcm.BanditBaseGold.GetValue())
        JMap.setFlt(jMod, "GiantBaseGold", mcm.GiantBaseGold.GetValue())
        JMap.setFlt(jMod, "ForswornBaseGold", mcm.ForswornBaseGold.GetValue())
        JMap.setFlt(jMod, "BanditBaseGold", mcm.DragonBaseGold.GetValue())
        
        JMap.setFlt(jMod, "BanditLeveledGold", mcm.BanditLeveledGold.GetValue())
        JMap.setFlt(jMod, "GiantLeveledGold", mcm.GiantLeveledGold.GetValue())
        JMap.setFlt(jMod, "ForswornLeveledGold", mcm.ForswornLeveledGold.GetValue())
        JMap.setFlt(jMod, "DragonLeveledGold", mcm.DragonLeveledGold.GetValue())
    
        return RETURN_SUCCESS
    endfunction

    int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
        BountyGoldConfigMenuScript mcm = a_quest as BountyGoldConfigMenuScript
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'BountyGoldConfigMenuScript'")
            return RETURN_ERROR
        endif
        
        mcm.BanditBaseGold.SetValue(JMap.getFlt(jMod, "BanditBaseGold"))
        mcm.GiantBaseGold.SetValue(JMap.getFlt(jMod, "GiantBaseGold"))
        mcm.ForswornBaseGold.SetValue(JMap.getFlt(jMod, "ForswornBaseGold"))
        mcm.DragonBaseGold.SetValue(JMap.getFlt(jMod, "BanditBaseGold"))
        
        mcm.BanditLeveledGold.SetValue(JMap.getFlt(jMod, "BanditLeveledGold"))
        mcm.GiantLeveledGold.SetValue(JMap.getFlt(jMod, "GiantLeveledGold"))
        mcm.ForswornLeveledGold.SetValue(JMap.getFlt(jMod, "ForswornLeveledGold"))
        mcm.DragonLeveledGold.SetValue(JMap.getFlt(jMod, "DragonLeveledGold"))
    
        return RETURN_SUCCESS
    endfunction
endstate

state Hunterborn
    int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
        _DS_HB_MCM menu = a_quest as _DS_HB_MCM
        _DS_HB_Globals mcm = menu.dsGlobals

        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest '_DS_Hunterborn' from file")
            return RETURN_ERROR
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
        return RETURN_SUCCESS
    endfunction

    int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
        _DS_HB_MCM menu = a_quest as _DS_HB_MCM
        _DS_HB_Globals mcm = menu.dsGlobals

        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest '_DS_Hunterborn' from file")
            return RETURN_ERROR
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
        return RETURN_SUCCESS
    endfunction
endstate

state iEquip
    int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
        iEquip_MCM mcm = a_quest as iEquip_MCM
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'iEquip_MCMQuest'")
            return RETURN_ERROR
        endif
        
        mcm.savePreset("yeolde-settings")
        return RETURN_SUCCESS
    endfunction

    int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
        iEquip_MCM mcm = a_quest as iEquip_MCM
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'iEquip_MCMQuest'")
            return RETURN_ERROR
        endif
        
        mcm.loadPreset("yeolde-settings")
        return RETURN_SUCCESS
    endfunction
endstate

state MintyLightning
    int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
        Log("OnBackupRequest() -> MintyLightning")
        MintyMcmPatchQuestScript mcm = a_quest as MintyMcmPatchQuestScript
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest for MintyLightning")
            return RETURN_ERROR
        endif
        JMap.setFlt(jMod, "MintyIsForkLightningHostile", mcm.MintyConfig.MintyIsForkLightningHostile.GetValue())
        JMap.setFlt(jMod, "MintyIsForkLightningHostileDefault", mcm.MintyConfig.MintyIsForkLightningHostileDefault.GetValue())
        JMap.setFlt(jMod, "MintyIsSheetLightningHostile", mcm.MintyConfig.MintyIsSheetLightningHostile.GetValue())
        JMap.setFlt(jMod, "MintyIsSheetLightningHostileDefault", mcm.MintyConfig.MintyIsSheetLightningHostileDefault.GetValue())
        JMap.setFlt(jMod, "MintyFaceTarget", mcm.MintyConfig.MintyFaceTarget.GetValue())
        JMap.setFlt(jMod, "MintyIsForkEnabled", mcm.MintyConfig.MintyIsForkEnabled.GetValue())
        JMap.setFlt(jMod, "MintyIsForkEnabledDefault", mcm.MintyConfig.MintyIsForkEnabledDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkDistanceMin", mcm.MintyConfig.MintyForkDistanceMin.GetValue())
        JMap.setFlt(jMod, "MintyForkDistanceMinDefault", mcm.MintyConfig.MintyForkDistanceMinDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkDistanceMax", mcm.MintyConfig.MintyForkDistanceMax.GetValue())
        JMap.setFlt(jMod, "MintyForkDistanceMaxDefault", mcm.MintyConfig.MintyForkDistanceMaxDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkFrequency", mcm.MintyConfig.MintyForkFrequency.GetValue())
        JMap.setFlt(jMod, "MintyForkFrequencyDefault", mcm.MintyConfig.MintyForkFrequencyDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkBloom", mcm.MintyConfig.MintyForkBloom.GetValue())
        JMap.setFlt(jMod, "MintyForkBloomDefault", mcm.MintyConfig.MintyForkBloomDefault.GetValue())
        JMap.setFlt(jMod, "MintyForkWait", mcm.MintyConfig.MintyForkWait.GetValue())
        JMap.setFlt(jMod, "MintyForkWaitDefault", mcm.MintyConfig.MintyForkWaitDefault.GetValue())
        JMap.setFlt(jMod, "MintyIsSheetEnabled", mcm.MintyConfig.MintyIsSheetEnabled.GetValue())
        JMap.setFlt(jMod, "MintyIsSheetEnabledDefault", mcm.MintyConfig.MintyIsSheetEnabledDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetDistanceMin", mcm.MintyConfig.MintySheetDistanceMin.GetValue())
        JMap.setFlt(jMod, "MintySheetDistanceMinDefault", mcm.MintyConfig.MintySheetDistanceMinDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetDistanceMax", mcm.MintyConfig.MintySheetDistanceMax.GetValue())
        JMap.setFlt(jMod, "MintySheetDistanceMaxDefault", mcm.MintyConfig.MintySheetDistanceMaxDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetFrequency", mcm.MintyConfig.MintySheetFrequency.GetValue())
        JMap.setFlt(jMod, "MintySheetFrequencyDefault", mcm.MintyConfig.MintySheetFrequencyDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetBloom", mcm.MintyConfig.MintySheetBloom.GetValue())
        JMap.setFlt(jMod, "MintySheetBloomDefault", mcm.MintyConfig.MintySheetBloomDefault.GetValue())
        JMap.setFlt(jMod, "MintySheetWait", mcm.MintyConfig.MintySheetWait.GetValue())
        JMap.setFlt(jMod, "MintySheetWaitDefault", mcm.MintyConfig.MintySheetWaitDefault.GetValue())
        JMap.setFlt(jMod, "MintyWeatherCheckFrequency", mcm.MintyConfig.MintyWeatherCheckFrequency.GetValue())
        JMap.setFlt(jMod, "MintyCellSize", mcm.MintyConfig.MintyCellSize.GetValue())
        JMap.setFlt(jMod, "MintyCellHeight", mcm.MintyConfig.MintyCellHeight.GetValue())
        JMap.setFlt(jMod, "MintyStrikeDistance", mcm.MintyConfig.MintyStrikeDistance.GetValue())
        JMap.setFlt(jMod, "MintyStrikeHeightByRegion", mcm.MintyConfig.MintyStrikeHeightByRegion.GetValue())
        JMap.setFlt(jMod, "MintyDisableLegacyMenu", mcm.MintyConfig.MintyDisableLegacyMenu.GetValue())
        JMap.setFlt(jMod, "MintySheetSoundDelay", mcm.MintyConfig.MintySheetSoundDelay.GetValue())
        JMap.setFlt(jMod, "MintyForkSoundDelay", mcm.MintyConfig.MintyForkSoundDelay.GetValue())
        JMap.setFlt(jMod, "MAGProjectileStormVar", mcm.MintyConfig.MAGProjectileStormVar.GetValue())
        JMap.setFlt(jMod, "MintyLoggingEnabled", mcm.MintyConfig.MintyLoggingEnabled.GetValue())
        JMap.setFlt(jMod, "MintyFeedBackEnabled", mcm.MintyConfig.MintyFeedBackEnabled.GetValue())
        return RETURN_SUCCESS
    endfunction


    int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
        Log("OnRestoreRequest() -> MintyLightning")
        MintyMcmPatchQuestScript mcm = a_quest as MintyMcmPatchQuestScript
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'MintyLightningQuest'")
            return RETURN_ERROR
        endif
        mcm.MintyConfig.MintyIsForkLightningHostile.SetValue(JMap.getFlt(jMod, "MintyIsForkLightningHostile"))
        mcm.MintyConfig.MintyIsForkLightningHostileDefault.SetValue(JMap.getFlt(jMod, "MintyIsForkLightningHostileDefault"))
        mcm.MintyConfig.MintyIsSheetLightningHostile.SetValue(JMap.getFlt(jMod, "MintyIsSheetLightningHostile"))
        mcm.MintyConfig.MintyIsSheetLightningHostileDefault.SetValue(JMap.getFlt(jMod, "MintyIsSheetLightningHostileDefault"))
        mcm.MintyConfig.MintyFaceTarget.SetValue(JMap.getFlt(jMod, "MintyFaceTarget"))
        mcm.MintyConfig.MintyIsForkEnabled.SetValue(JMap.getFlt(jMod, "MintyIsForkEnabled"))
        mcm.MintyConfig.MintyIsForkEnabledDefault.SetValue(JMap.getFlt(jMod, "MintyIsForkEnabledDefault"))
        mcm.MintyConfig.MintyForkDistanceMin.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMin"))
        mcm.MintyConfig.MintyForkDistanceMinDefault.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMinDefault"))
        mcm.MintyConfig.MintyForkDistanceMax.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMax"))
        mcm.MintyConfig.MintyForkDistanceMaxDefault.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMaxDefault"))
        mcm.MintyConfig.MintyForkFrequency.SetValue(JMap.getFlt(jMod, "MintyForkFrequency"))
        mcm.MintyConfig.MintyForkFrequencyDefault.SetValue(JMap.getFlt(jMod, "MintyForkFrequencyDefault"))
        mcm.MintyConfig.MintyForkBloom.SetValue(JMap.getFlt(jMod, "MintyForkBloom"))
        mcm.MintyConfig.MintyForkBloomDefault.SetValue(JMap.getFlt(jMod, "MintyForkBloomDefault"))
        mcm.MintyConfig.MintyForkWait.SetValue(JMap.getFlt(jMod, "MintyForkWait"))
        mcm.MintyConfig.MintyForkWaitDefault.SetValue(JMap.getFlt(jMod, "MintyForkWaitDefault"))
        mcm.MintyConfig.MintyIsSheetEnabled.SetValue(JMap.getFlt(jMod, "MintyIsSheetEnabled"))
        mcm.MintyConfig.MintyIsSheetEnabledDefault.SetValue(JMap.getFlt(jMod, "MintyIsSheetEnabledDefault"))
        mcm.MintyConfig.MintySheetDistanceMin.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMin"))
        mcm.MintyConfig.MintySheetDistanceMinDefault.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMinDefault"))
        mcm.MintyConfig.MintySheetDistanceMax.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMax"))
        mcm.MintyConfig.MintySheetDistanceMaxDefault.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMaxDefault"))
        mcm.MintyConfig.MintySheetFrequency.SetValue(JMap.getFlt(jMod, "MintySheetFrequency"))
        mcm.MintyConfig.MintySheetFrequencyDefault.SetValue(JMap.getFlt(jMod, "MintySheetFrequencyDefault"))
        mcm.MintyConfig.MintySheetBloom.SetValue(JMap.getFlt(jMod, "MintySheetBloom"))
        mcm.MintyConfig.MintySheetBloomDefault.SetValue(JMap.getFlt(jMod, "MintySheetBloomDefault"))
        mcm.MintyConfig.MintySheetWait.SetValue(JMap.getFlt(jMod, "MintySheetWait"))
        mcm.MintyConfig.MintySheetWaitDefault.SetValue(JMap.getFlt(jMod, "MintySheetWaitDefault"))
        mcm.MintyConfig.MintyWeatherCheckFrequency.SetValue(JMap.getFlt(jMod, "MintyWeatherCheckFrequency"))
        mcm.MintyConfig.MintyCellSize.SetValue(JMap.getFlt(jMod, "MintyCellSize"))
        mcm.MintyConfig.MintyCellHeight.SetValue(JMap.getFlt(jMod, "MintyCellHeight"))
        mcm.MintyConfig.MintyStrikeDistance.SetValue(JMap.getFlt(jMod, "MintyStrikeDistance"))
        mcm.MintyConfig.MintyStrikeHeightByRegion.SetValue(JMap.getFlt(jMod, "MintyStrikeHeightByRegion"))
        mcm.MintyConfig.MintyDisableLegacyMenu.SetValue(JMap.getFlt(jMod, "MintyDisableLegacyMenu"))
        mcm.MintyConfig.MintySheetSoundDelay.SetValue(JMap.getFlt(jMod, "MintySheetSoundDelay"))
        mcm.MintyConfig.MintyForkSoundDelay.SetValue(JMap.getFlt(jMod, "MintyForkSoundDelay"))
        mcm.MintyConfig.MAGProjectileStormVar.SetValue(JMap.getFlt(jMod, "MAGProjectileStormVar"))
        mcm.MintyConfig.MintyLoggingEnabled.SetValue(JMap.getFlt(jMod, "MintyLoggingEnabled"))
        mcm.MintyConfig.MintyFeedBackEnabled.SetValue(JMap.getFlt(jMod, "MintyFeedBackEnabled"))
        return RETURN_SUCCESS
    endfunction
endstate

state Wildcat
    int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
        SFL4_SKSE_Quest mcm = a_quest as SFL4_SKSE_Quest
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'SFL4_SKSE_Quest'")
            return RETURN_ERROR
        endif
        
        JMap.setFlt(jMod, "WCT_Ability_Global_DisableDynamicCombat", mcm.WCT_Ability_Global_DisableDynamicCombat.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_DisableRegenFlux", mcm.WCT_Ability_Global_DisableRegenFlux.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina", mcm.WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_DisableSwimStaminaDrain", mcm.WCT_Ability_Global_DisableSwimStaminaDrain.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_DisableBowInterrupt", mcm.WCT_Ability_Global_DisableBowInterrupt.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_FBS", mcm.WCT_Ability_Global_FBS.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_1H", mcm.WCT_Ability_Global_AttacksCostStamina_1H.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_2H", mcm.WCT_Ability_Global_AttacksCostStamina_2H.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_Bow", mcm.WCT_Ability_Global_AttacksCostStamina_Bow.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_DisableBowStaminaDrain", mcm.WCT_Ability_Global_DisableBowStaminaDrain.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_Injuries", mcm.WCT_Ability_Global_Injuries.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_InjuryThreshold_Chance", mcm.WCT_Ability_Global_InjuryThreshold_Chance.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_InjuryThreshold_HP1", mcm.WCT_Ability_Global_InjuryThreshold_HP1.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_InjuryThreshold_HP2", mcm.WCT_Ability_Global_InjuryThreshold_HP2.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter", mcm.WCT_Ability_Global_InjuryRektOMeter.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter_Chance", mcm.WCT_Ability_Global_InjuryRektOMeter_Chance.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter_Threshold", mcm.WCT_Ability_Global_InjuryRektOMeter_Threshold.GetValue())
        JMap.setFlt(jMod, "WCT_Stagger_Global_DisableStagger", mcm.WCT_Stagger_Global_DisableStagger.GetValue())
        JMap.setFlt(jMod, "WCT_Ability_Global_DisableTimedBlock", mcm.WCT_Ability_Global_DisableTimedBlock.GetValue())
        JMap.setFlt(jMod, "WCT_TimedBlock_Global_SquelchTimedBlockMessage", mcm.WCT_TimedBlock_Global_SquelchTimedBlockMessage.GetValue())
        JMap.setFlt(jMod, "WCT_Modifier_Global_DisableAAO", mcm.WCT_Modifier_Global_DisableAAO.GetValue())
        JMap.setFlt(jMod, "WCT_Modifier_Global_DisableDirectionalDamage", mcm.WCT_Modifier_Global_DisableDirectionalDamage.GetValue())
        JMap.setFlt(jMod, "WCT_Modifier_Global_DisableDynamicDamage", mcm.WCT_Modifier_Global_DisableDynamicDamage.GetValue())
        JMap.setFlt(jMod, "WCT_Modifier_Global_DisableMelee", mcm.WCT_Modifier_Global_DisableMelee.GetValue())
        JMap.setFlt(jMod, "WCT_Modifier_Global_DisableMassive", mcm.WCT_Modifier_Global_DisableMassive.GetValue())
        JMap.setFlt(jMod, "WCT_Quest_Global_DifficultyWatchdog", mcm.WCT_Quest_Global_DifficultyWatchdog.GetValue())
        JMap.setFlt(jMod, "WCT_VE_Global_By", mcm.WCT_VE_Global_By.GetValue())
        JMap.setFlt(jMod, "WCT_VE_Global_To", mcm.WCT_VE_Global_To.GetValue())
        JMap.setFlt(jMod, "WCT_E_Global_By", mcm.WCT_E_Global_By.GetValue())
        JMap.setFlt(jMod, "WCT_E_Global_To", mcm.WCT_E_Global_To.GetValue())
        JMap.setFlt(jMod, "WCT_N_Global_By", mcm.WCT_N_Global_By.GetValue())
        JMap.setFlt(jMod, "WCT_N_Global_To", mcm.WCT_N_Global_To.GetValue())
        JMap.setFlt(jMod, "WCT_H_Global_By", mcm.WCT_H_Global_By.GetValue())
        JMap.setFlt(jMod, "WCT_H_Global_To", mcm.WCT_H_Global_To.GetValue())
        JMap.setFlt(jMod, "WCT_VH_Global_By", mcm.WCT_VH_Global_By.GetValue())
        JMap.setFlt(jMod, "WCT_VH_Global_To", mcm.WCT_VH_Global_To.GetValue())
        JMap.setFlt(jMod, "WCT_L_Global_By", mcm.WCT_L_Global_By.GetValue())
        JMap.setFlt(jMod, "WCT_L_Global_To", mcm.WCT_L_Global_To.GetValue())
        
        return RETURN_SUCCESS
    endfunction

    int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
        SFL4_SKSE_Quest mcm = a_quest as SFL4_SKSE_Quest
        if (mcm == none)
            Log("Error: OnBackupRequest() -> Can't get quest 'SFL4_SKSE_Quest'")
            return RETURN_ERROR
        endif
        
        mcm.WCT_Ability_Global_DisableDynamicCombat.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableDynamicCombat"))
        mcm.WCT_Ability_Global_DisableRegenFlux.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableRegenFlux"))
        mcm.WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina"))
        mcm.WCT_Ability_Global_DisableSwimStaminaDrain.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableSwimStaminaDrain"))
        mcm.WCT_Ability_Global_DisableBowInterrupt.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableBowInterrupt"))
        mcm.WCT_Ability_Global_FBS.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_FBS"))
        mcm.WCT_Ability_Global_AttacksCostStamina_1H.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_1H"))
        mcm.WCT_Ability_Global_AttacksCostStamina_2H.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_2H"))
        mcm.WCT_Ability_Global_AttacksCostStamina_Bow.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_Bow"))
        mcm.WCT_Ability_Global_DisableBowStaminaDrain.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableBowStaminaDrain"))
        mcm.WCT_Ability_Global_Injuries.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_Injuries"))
        mcm.WCT_Ability_Global_InjuryThreshold_Chance.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryThreshold_Chance"))
        mcm.WCT_Ability_Global_InjuryThreshold_HP1.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryThreshold_HP1"))
        mcm.WCT_Ability_Global_InjuryThreshold_HP2.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryThreshold_HP2"))
        mcm.WCT_Ability_Global_InjuryRektOMeter.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter"))
        mcm.WCT_Ability_Global_InjuryRektOMeter_Chance.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter_Chance"))
        mcm.WCT_Ability_Global_InjuryRektOMeter_Threshold.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter_Threshold"))
        mcm.WCT_Stagger_Global_DisableStagger.SetValue(JMap.getFlt(jMod, "WCT_Stagger_Global_DisableStagger"))
        mcm.WCT_Ability_Global_DisableTimedBlock.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableTimedBlock"))
        mcm.WCT_TimedBlock_Global_SquelchTimedBlockMessage.SetValue(JMap.getFlt(jMod, "WCT_TimedBlock_Global_SquelchTimedBlockMessage"))
        mcm.WCT_Modifier_Global_DisableAAO.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableAAO"))
        mcm.WCT_Modifier_Global_DisableDirectionalDamage.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableDirectionalDamage"))
        mcm.WCT_Modifier_Global_DisableDynamicDamage.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableDynamicDamage"))
        mcm.WCT_Modifier_Global_DisableMelee.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableMelee"))
        mcm.WCT_Modifier_Global_DisableMassive.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableMassive"))
        mcm.WCT_Quest_Global_DifficultyWatchdog.SetValue(JMap.getFlt(jMod, "WCT_Quest_Global_DifficultyWatchdog"))
        mcm.WCT_VE_Global_By.SetValue(JMap.getFlt(jMod, "WCT_VE_Global_By"))
        mcm.WCT_VE_Global_To.SetValue(JMap.getFlt(jMod, "WCT_VE_Global_To"))
        mcm.WCT_E_Global_By.SetValue(JMap.getFlt(jMod, "WCT_E_Global_By"))
        mcm.WCT_E_Global_To.SetValue(JMap.getFlt(jMod, "WCT_E_Global_To"))
        mcm.WCT_N_Global_By.SetValue(JMap.getFlt(jMod, "WCT_N_Global_By"))
        mcm.WCT_N_Global_To.SetValue(JMap.getFlt(jMod, "WCT_N_Global_To"))
        mcm.WCT_H_Global_By.SetValue(JMap.getFlt(jMod, "WCT_H_Global_By"))
        mcm.WCT_H_Global_To.SetValue(JMap.getFlt(jMod, "WCT_H_Global_To"))
        mcm.WCT_VH_Global_By.SetValue(JMap.getFlt(jMod, "WCT_VH_Global_By"))
        mcm.WCT_VH_Global_To.SetValue(JMap.getFlt(jMod, "WCT_VH_Global_To"))
        mcm.WCT_L_Global_By.SetValue(JMap.getFlt(jMod, "WCT_L_Global_By"))
        mcm.WCT_L_Global_To.SetValue(JMap.getFlt(jMod, "WCT_L_Global_To"))
        
        return RETURN_SUCCESS
    endfunction
endstate

; state ObisBandits
;     int function OnBackupRequest(SKI_ConfigBase a_quest, int jMod)
;     Log("OnBackupRequest() -> ObisBandits")
;         obis_mcmenu mcm = a_quest as obis_mcmenu
;         if (mcm == none)
;             Log("Error: OnBackupRequest() -> Can't get quest from file")
;             return RETURN_ERROR
;         endif

;         JMap.setInt(jMod, "OBIS_ExtraEnabled", mcm.OBIS_ExtraEnabled.GetValueInt())
;         JMap.setInt(jMod, "OBIS_ExtraDefault", mcm.OBIS_ExtraDefault.GetValueInt())
;         JMap.setInt(jMod, "OBISSize", mcm.OBISSize.GetValueInt())
;         JMap.setInt(jMod, "ObisRandom", mcm.ObisRandom.GetValueInt())
;         JMap.setInt(jMod, "OBIS_Governor", mcm.OBIS_Governor.GetValueInt())
;         JMap.setInt(jMod, "OBIS_DungGovernor", mcm.OBIS_DungGovernor.GetValueInt())
;         JMap.setInt(jMod, "GivePotion", mcm.GivePotion.GetValueInt())
;         JMap.setInt(jMod, "potionchance", mcm.potionchance.GetValueInt())
;         JMap.setInt(jMod, "ActivateDungeon", mcm.ActivateDungeon.GetValueInt())
;         JMap.setInt(jMod, "OBIS_Intensity", mcm.OBIS_Intensity.GetValueInt())
;         JMap.setInt(jMod, "OBIS_Cooldown", mcm.OBIS_Cooldown.GetValueInt())
;         JMap.setInt(jMod, "LevelLimit", mcm.LevelLimit.GetValueInt())
;         JMap.setInt(jMod, "deletebandits", mcm.deletebandits.GetValueInt())
;         JMap.setInt(jMod, "ObisShowMessage", mcm.ObisShowMessage.GetValueInt())
;         JMap.setInt(jMod, "OBIS_MinotaurEnable", mcm.OBIS_MinotaurEnable.GetValueInt())
;         JMap.setInt(jMod, "OBIS_SpidersEnable", mcm.OBIS_SpidersEnable.GetValueInt())
        
;         return RETURN_SUCCESS
;     endfunction

;     int function OnRestoreRequest(SKI_ConfigBase a_quest, int jMod)
;         Log("OnRestoreRequest() -> ObisBandits")
;         obis_mcmenu mcm = Quest.GetQuest("obis_mcmenu") as obis_mcmenu
;         ; obis_mcmenu mcm = Game.GetFormFromFile(0x0408F0AA, "OBIS SE.esp") as obis_mcmenu
;         if (mcm == none)
;             Log("Error: OnBackupRequest() -> Can't get quest from file")
;             return RETURN_ERROR
;         endif
;         mcm.OBIS_ExtraEnabled.SetValueInt(JMap.getInt(jMod, "OBIS_ExtraEnabled"))
;         mcm.OBIS_ExtraDefault.SetValueInt(JMap.getInt(jMod, "OBIS_ExtraDefault"))
;         mcm.OBISSize.SetValueInt(JMap.getInt(jMod, "OBISSize"))
;         mcm.ObisRandom.SetValueInt(JMap.getInt(jMod, "ObisRandom"))
;         mcm.OBIS_Governor.SetValueInt(JMap.getInt(jMod, "OBIS_Governor"))
;         mcm.OBIS_DungGovernor.SetValueInt(JMap.getInt(jMod, "OBIS_DungGovernor"))
;         mcm.GivePotion.SetValueInt(JMap.getInt(jMod, "GivePotion"))
;         mcm.potionchance.SetValueInt(JMap.getInt(jMod, "potionchance"))
;         mcm.ActivateDungeon.SetValueInt(JMap.getInt(jMod, "ActivateDungeon"))
;         mcm.OBIS_Intensity.SetValueInt(JMap.getInt(jMod, "OBIS_Intensity"))
;         mcm.OBIS_Cooldown.SetValueInt(JMap.getInt(jMod, "OBIS_Cooldown"))
;         mcm.LevelLimit.SetValueInt(JMap.getInt(jMod, "LevelLimit"))
;         mcm.deletebandits.SetValueInt(JMap.getInt(jMod, "deletebandits"))
;         mcm.ObisShowMessage.SetValueInt(JMap.getInt(jMod, "ObisShowMessage"))
;         mcm.OBIS_MinotaurEnable.SetValueInt(JMap.getInt(jMod, "OBIS_MinotaurEnable"))
;         mcm.OBIS_SpidersEnable.SetValueInt(JMap.getInt(jMod, "OBIS_SpidersEnable"))
        
;         mcm.SyncSettings()
;         return RETURN_SUCCESS
;     endfunction
; endstate


function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction