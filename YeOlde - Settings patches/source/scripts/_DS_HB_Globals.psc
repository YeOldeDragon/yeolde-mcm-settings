Scriptname _DS_HB_Globals extends Quest  


; Dependency bools
;
; Core mods
bool Property isSKSELoaded Auto Hidden
bool Property isMCMLoaded Auto Hidden
; Patches
bool Property isRNDLoaded Auto Hidden
bool Property isCampfireLoaded Auto Hidden
bool Property isFrostfallLoaded Auto Hidden
bool Property isSkyReLoaded Auto Hidden
bool Property isRequiemLoaded Auto Hidden
bool Property isIALoaded Auto Hidden
bool Property isPerMaLoaded Auto Hidden
bool Property isHiSLoaded Auto Hidden
bool Property isINEEDLoaded Auto Hidden
bool Property isTanningLoaded Auto Hidden
; DLC
bool Property isDLC1Loaded Auto Hidden ; Dawnguard
bool Property isDLC2Loaded Auto Hidden ; Dragonborn
bool Property isBYOHLoaded Auto Hidden ; Hearthfire


; HB Globals
;
GlobalVariable Property _DS_Hunterborn_EnableConfig Auto
bool Property gEnableConfig Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableConfig.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableConfig.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HiSCompatibility Auto
bool Property gUseHiSCompatibility Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_HiSCompatibility.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_HiSCompatibility.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn__Active Auto
bool Property gHunterbornActive Hidden
	Function Set(bool abValue)
		_DS_Hunterborn__Active.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn__Active.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn__Draugnarok Auto
bool Property isDraugnarokLoaded Hidden
	Function Set(bool abValue)
		_DS_Hunterborn__Draugnarok.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn__Draugnarok.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_Action_Crouch Auto
int Property gActionCrouch Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_Action_Crouch.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_Action_Crouch.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ActionCleanCarcass Auto
int Property gActionCleanCarcass Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_ActionCleanCarcass.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_ActionCleanCarcass.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ActionCleanCarcassSneak Auto
int Property gActionCleanCarcassSneak Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_ActionCleanCarcassSneak.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_ActionCleanCarcassSneak.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ActionFreshCarcass Auto
int Property gActionFreshCarcass Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_ActionFreshCarcass.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_ActionFreshCarcass.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ActionFreshCarcassSneak Auto
int Property gActionFreshCarcassSneak Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_ActionFreshCarcassSneak.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_ActionFreshCarcassSneak.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ActionsTimed Auto
bool Property gActionsTimed Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_ActionsTimed.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_ActionsTimed.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_AddTaxonomy Auto
bool Property gAddTaxonomy Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_AddTaxonomy.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_AddTaxonomy.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_BlockSkyRe Auto
bool Property gBlockSkyRe Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_BlockSkyRe.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_BlockSkyRe.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_BrewLevel Auto
int Property gBrewLevel Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_BrewLevel.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_BrewLevel.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ButcheringDone Auto
bool Property gButcheringDone Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_ButcheringDone.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_ButcheringDone.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ButcherTimed Auto
bool Property gButcherTimed Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_ButcherTimed.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_ButcherTimed.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_CarcassYield Auto
int Property gCarcassYield Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_CarcassYield.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_CarcassYield.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ClawsAsHuntingKnife Auto
bool Property gClawsAsHuntingKnife Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_ClawsAsHuntingKnife.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_ClawsAsHuntingKnife.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_CookbookRead Auto
bool Property gCookbookRead Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_CookbookRead.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_CookbookRead.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_DebugMode Auto
bool Property gDebugMode Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_DebugMode.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_DebugMode.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_DLCEnabled Auto
bool Property gDLCEnabled Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_DLCEnabled.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_DLCEnabled.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_DoInitStuff Auto
bool Property gDoInitStuff Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_DoInitStuff.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_DoInitStuff.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_DragonsCorporeal Auto
bool Property gDragonsCorporeal Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_DragonsCorporeal.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_DragonsCorporeal.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_DressTimed Auto
bool Property gDressTimed Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_DressTimed.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_DressTimed.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableBotanyPerk Auto
bool Property gEnableBotanyPerk Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableBotanyPerk.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableBotanyPerk.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableBountyPerk Auto
bool Property gEnableBountyPerk Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableBountyPerk.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableBountyPerk.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableForaging Auto
bool Property gEnableForaging Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableForaging.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableForaging.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableHuntersCache Auto
bool Property gEnableHuntersCache Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableHuntersCache.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableHuntersCache.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnablePrimitiveCooking Auto
bool Property gEnablePrimitiveCooking Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnablePrimitiveCooking.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnablePrimitiveCooking.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableSavageArrows Auto
bool Property gEnableSavageArrows Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableSavageArrows.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableSavageArrows.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableSenseDirection Auto
bool Property gEnableSenseDirection Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableSenseDirection.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableSenseDirection.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableScrimshaw Auto
bool Property gEnableScrimshaw Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableScrimshaw.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableScrimshaw.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableSoupsStews Auto
bool Property gEnableSoupsStews Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableSoupsStews.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableSoupsStews.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_FadeOuts Auto
bool Property gFadeOuts Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_FadeOuts.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_FadeOuts.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_FakeUpdate Auto
bool Property gFakeUpdate Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_FakeUpdate.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_FakeUpdate.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ForageExp Auto
int Property gForageExp Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_ForageExp.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_ForageExp.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ForageLevel Auto
int Property gForageLevel Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_ForageLevel.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_ForageLevel.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ForageTimed Auto
bool Property gForageTimed Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_ForageTimed.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_ForageTimed.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_Frostfall_Added Auto
bool Property gFrostfallAdded Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_Frostfall_Added.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_Frostfall_Added.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_Frostfall_Removed Auto
bool Property gFrostfallRemoved Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_Frostfall_Removed.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_Frostfall_Removed.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_GrimeyIdea_Alkahest Auto
bool Property gIdeaAlkahest Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_GrimeyIdea_Alkahest.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_GrimeyIdea_Alkahest.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_GrimeyIdea_Rubyluce Auto
bool Property gIdeaRubyluce Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_GrimeyIdea_Rubyluce.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_GrimeyIdea_Rubyluce.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_GrimeyIdea_StrawGold Auto
int Property gIdeaStrawGold Hidden
	Function Set(int abValue)
		_DS_Hunterborn_GrimeyIdea_StrawGold.SetValueInt(abValue as int)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_GrimeyIdea_StrawGold.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HarvestingDone Auto
bool Property gHarvestingDone Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_HarvestingDone.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_HarvestingDone.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HarvestExp Auto
int Property gHarvestExp Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HarvestExp.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HarvestExp.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HarvestLevel Auto
int Property gHarvestLevel Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HarvestLevel.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HarvestLevel.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HarvestTimed Auto
bool Property gHarvestTimed Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_HarvestTimed.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_HarvestTimed.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_Hotkey_HideAbilities Auto
bool Property gHotkey_HideAbilities Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_Hotkey_HideAbilities.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_Hotkey_HideAbilities.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_Hotkey_HideMenu Auto
bool Property gHotkey_HideMenu Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_Hotkey_HideMenu.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_Hotkey_HideMenu.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeyButcher Auto
int Property gHotkeyButcher Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeyButcher.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeyButcher.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeyDress Auto
int Property gHotkeyDress Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeyDress.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeyDress.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeyForage Auto
int Property gHotkeyForage Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeyForage.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeyForage.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeyHarvest Auto
int Property gHotkeyHarvest Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeyHarvest.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeyHarvest.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeyPrimitiveCooking Auto
int Property gHotkeyPrimitiveCooking Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeyPrimitiveCooking.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeyPrimitiveCooking.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeyProcess Auto
int Property gHotkeyProcess Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeyProcess.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeyProcess.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeyScrimshaw Auto
int Property gHotkeyScrimshaw Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeyScrimshaw.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeyScrimshaw.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeySenseDirection Auto
int Property gHotkeySenseDirection Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeySenseDirection.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeySenseDirection.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeySkin Auto
int Property gHotkeySkin Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeySkin.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeySkin.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HotkeyTaxonomy Auto
int Property gHotkeyTaxonomy Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HotkeyTaxonomy.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HotkeyTaxonomy.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HuntersCacheEmpty Auto
bool Property gHuntersCacheEmpty Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_HuntersCacheEmpty.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_HuntersCacheEmpty.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_HuntingKnife Auto
int Property gHuntingKnife Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_HuntingKnife.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_HuntingKnife.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeChicken Auto
bool Property gIncludeChicken Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeChicken.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeChicken.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeDog Auto
bool Property gIncludeDog Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeDog.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeDog.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeHare Auto
bool Property gIncludeHare Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeHare.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeHare.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeMonsterChaurus Auto
bool Property gIncludeMonsterChaurus Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeMonsterChaurus.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeMonsterChaurus.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeMonsterDragons Auto
bool Property gIncludeMonsterDragons Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeMonsterDragons.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeMonsterDragons.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeMonsterSpiders Auto
bool Property gIncludeMonsterSpiders Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeMonsterSpiders.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeMonsterSpiders.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeMonsterSpriggans Auto
bool Property gIncludeMonsterSpriggans Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeMonsterSpriggans.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeMonsterSpriggans.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeMonsterTrolls Auto
bool Property gIncludeMonsterTrolls Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeMonsterTrolls.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeMonsterTrolls.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeMonsterWerewolves Auto
bool Property gIncludeMonsterWerewolves Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeMonsterWerewolves.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeMonsterWerewolves.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeMudcrab Auto
bool Property gIncludeMudcrab Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeMudcrab.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeMudcrab.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeSkeever Auto
bool Property gIncludeSkeever Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeSkeever.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeSkeever.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_IncludeSlaughterfish Auto
bool Property gIncludeSlaughterfish Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_IncludeSlaughterfish.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_IncludeSlaughterfish.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_KenHunted_Active Auto
bool Property gKenHunted_Active Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_KenHunted_Active.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_KenHunted_Active.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_KnifeSales Auto
int Property gKnifeSales Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_KnifeSales.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_KnifeSales.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MatAmount Auto
int Property gMatAmount Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_MatAmount.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_MatAmount.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MeatValue Auto
int Property gMeatValue Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_MeatValue.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_MeatValue.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MeatYield Auto
int Property gMeatYield Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_MeatYield.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_MeatYield.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MeatYieldCustom Auto
int Property gMeatYieldCustom Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_MeatYieldCustom.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		If (gMeatYield == 0)
			Return 1
		ElseIf (gMeatYield == 1)
			Return 12
		ElseIf (gMeatYield == 2)
			Return 25
		ElseIf (gMeatYield == 3)
			Return 50
		Else
			Return _DS_Hunterborn_MeatYieldCustom.GetValueInt()
		EndIf
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MonsterCanDispose Auto
bool Property gMonsterCanDispose Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_MonsterCanDispose.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_MonsterCanDispose.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MonsterHasBlood Auto
bool Property gMonsterHasBlood Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_MonsterHasBlood.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_MonsterHasBlood.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MonsterHasMats Auto
bool Property gMonsterHasMats Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_MonsterHasMats.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_MonsterHasMats.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MonsterHasMeat Auto
bool Property gMonsterHasMeat Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_MonsterHasMeat.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_MonsterHasMeat.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MonsterHasSkin Auto
bool Property gMonsterHasSkin Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_MonsterHasSkin.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_MonsterHasSkin.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MonsterHasVenom Auto
bool Property gMonsterHasVenom Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_MonsterHasVenom.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_MonsterHasVenom.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_MonsterHunter Auto
bool Property gMonsterHunter Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_MonsterHunter.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_MonsterHunter.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_PeltValue Auto
int Property gPeltValue Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_PeltValue.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_PeltValue.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_PerMaAddLeather Auto
bool Property gPerMaAddLeather Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_PerMaAddLeather.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_PerMaAddLeather.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_PerMaGathererWarned Auto
bool Property gPerMaGathererWarned Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_PerMaGathererWarned.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_PerMaGathererWarned.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_PerMaLevelWayfarer Auto
bool Property gPerMaLevelWayfarer Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_PerMaLevelWayfarer.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_PerMaLevelWayfarer.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_PreventBearStash Auto
bool Property gPreventBearStash Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_PreventBearStash.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_PreventBearStash.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_PreventInCombat Auto
bool Property gPreventInCombat Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_PreventInCombat.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_PreventInCombat.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_PreventOverburden Auto
bool Property gPreventOverburden Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_PreventOverburden.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_PreventOverburden.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_RegionIndex Auto
int Property gRegionIndex Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_RegionIndex.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_RegionIndex.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_RemoveManualLoot Auto
bool Property gRemoveManualLoot Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_RemoveManualLoot.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_RemoveManualLoot.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_RequireCookbook Auto
bool Property gRequireCookbook Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_RequireCookbook.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_RequireCookbook.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_RequireHuntingKnife Auto
bool Property gRequireHuntingKnife Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_RequireHuntingKnife.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_RequireHuntingKnife.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ReweighMeat Auto
bool Property gReweighMeat Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_ReweighMeat.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_ReweighMeat.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_RiteRing_Wearing Auto
int Property gRiteRing_Wearing Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_RiteRing_Wearing.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_RiteRing_Wearing.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_RiteStage_Elm Auto
int Property gRiteStage_Elm Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_RiteStage_Elm.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_RiteStage_Elm.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_RiteStage_Oak Auto
int Property gRiteStage_Oak Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_RiteStage_Oak.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_RiteStage_Oak.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_RiteStage_Yew Auto
int Property gRiteStage_Yew Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_RiteStage_Yew.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_RiteStage_Yew.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_ShowScreenBlood Auto
bool Property gShowScreenBlood Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_ShowScreenBlood.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_ShowScreenBlood.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SkinningDone Auto
bool Property gSkinningDone Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_SkinningDone.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_SkinningDone.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SkinExp Auto
int Property gSkinExp Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_SkinExp.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_SkinExp.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SkinLevel Auto
int Property gSkinLevel Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_SkinLevel.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_SkinLevel.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SkinTimed Auto
bool Property gSkinTimed Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_SkinTimed.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_SkinTimed.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SkyReAddLeather Auto
bool Property gSkyReAddLeather Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_SkyReAddLeather.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_SkyReAddLeather.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SkyReGathererWarned Auto
bool Property gSkyReGathererWarned Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_SkyReGathererWarned.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_SkyReGathererWarned.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SkyReLevelWayfarer Auto
bool Property gSkyReLevelWayfarer Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_SkyReLevelWayfarer.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_SkyReLevelWayfarer.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SmallGame Auto
bool Property gSmallGame Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_SmallGame.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_SmallGame.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SoupLifetime Auto
float Property gSoupLifetime Hidden
	Function Set(float afValue)
		_DS_Hunterborn_SoupLifetime.SetValue(afValue)
	EndFunction
	float Function Get()
		Return _DS_Hunterborn_SoupLifetime.GetValue()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SoupReturnBowl Auto
bool Property gSoupReturnBowl Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_SoupReturnBowl.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_SoupReturnBowl.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_SoupStayHot Auto
bool Property gSoupStayHot Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_SoupStayHot.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_SoupStayHot.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_StartupPrompted Auto
bool Property gStartupPrompted Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_StartupPrompted.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_StartupPrompted.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_TotalCleans Auto
int Property gTotalCleans Hidden
	Function Set(int aiValue)
		_DS_Hunterborn_TotalCleans.SetValueInt(aiValue)
	EndFunction
	int Function Get()
		Return _DS_Hunterborn_TotalCleans.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseAnimation Auto
bool Property gUseAnimation Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseAnimation.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseAnimation.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseCampfireWood Auto
bool Property gUseCampfireWood Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseCampfireWood.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseCampfireWood.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseCombinedCustomMats Auto
bool Property gUseCombinedCustomMats Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseCombinedCustomMats.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseCombinedCustomMats.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseCombinedCustomMeats Auto
bool Property gUseCombinedCustomMeats Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseCombinedCustomMeats.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseCombinedCustomMeats.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseCombinedCustomPelts Auto
bool Property gUseCombinedCustomPelts Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseCombinedCustomPelts.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseCombinedCustomPelts.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseCustomMats Auto
bool Property gUseCustomMats Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseCustomMats.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseCustomMats.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_EnableFurPlate Auto
bool Property gEnableFurPlate Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_EnableFurPlate.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_EnableFurPlate.GetValueInt()
	EndFunction
EndProperty


GlobalVariable Property _DS_Hunterborn_UseCustomMeats Auto
bool Property gUseCustomMeats Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseCustomMeats.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseCustomMeats.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseCustomPelts Auto
bool Property gUseCustomPelts Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseCustomPelts.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseCustomPelts.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseCustomTextures Auto
bool Property gUseCustomTextures Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseCustomTextures.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseCustomTextures.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_UseHiSTextures Auto
bool Property gUseHiSTextures Hidden
	Function Set(bool abValue)
		_DS_Hunterborn_UseHiSTextures.SetValueInt(abValue as int)
	EndFunction
	bool Function Get()
		Return _DS_Hunterborn_UseHiSTextures.GetValueInt()
	EndFunction
EndProperty

GlobalVariable Property _DS_Hunterborn_Version Auto
float Property gVersion Hidden
	Function Set(float aiValue)
		_DS_Hunterborn_Version.SetValue(aiValue)
	EndFunction
	float Function Get()
		Return _DS_Hunterborn_Version.GetValueInt()
	EndFunction
EndProperty

Function ResetToDefaults()

	_DS_Hunterborn_Action_Crouch.SetValue(0)
	_DS_Hunterborn_ActionCleanCarcass.SetValue(0)
	_DS_Hunterborn_ActionCleanCarcassSneak.SetValue(0)
	_DS_Hunterborn_ActionFreshCarcass.SetValue(0)
	_DS_Hunterborn_ActionFreshCarcassSneak.SetValue(0)
	_DS_Hunterborn_ActionsTimed.SetValue(1)
	_DS_Hunterborn_AddTaxonomy.SetValue(0)
	_DS_Hunterborn_BlockSkyRe.SetValue(0)
	_DS_Hunterborn_BrewLevel.SetValue(0)
	_DS_Hunterborn_ButcherTimed.SetValue(1)
	_DS_Hunterborn_CarcassYield.SetValue(1)
	_DS_Hunterborn_ClawsAsHuntingKnife.SetValue(1)
	_DS_Hunterborn_DebugMode.SetValue(1)
	_DS_Hunterborn_DragonsCorporeal.SetValue(0)
	_DS_Hunterborn_DressTimed.SetValue(1)
	_DS_Hunterborn_EnableBotanyPerk.SetValue(1)
	_DS_Hunterborn_EnableBountyPerk.SetValue(1)
	_DS_Hunterborn_EnableForaging.SetValue(1)
	_DS_Hunterborn_EnableHuntersCache.SetValue(1)
	_DS_Hunterborn_EnablePrimitiveCooking.SetValue(1)
	_DS_Hunterborn_EnableSavageArrows.SetValue(1)
	_DS_Hunterborn_EnableScrimshaw.SetValue(1)
	_DS_Hunterborn_EnableSenseDirection.SetValue(1)
	_DS_Hunterborn_EnableSoupsStews.SetValue(0)
	_DS_Hunterborn_FadeOuts.SetValue(1)
	_DS_Hunterborn_ForageExp.SetValue(0)
	_DS_Hunterborn_ForageLevel.SetValue(0)
	_DS_Hunterborn_ForageTimed.SetValue(1)
	_DS_Hunterborn_Frostfall_Added.SetValue(0)
	_DS_Hunterborn_Frostfall_Removed.SetValue(0)
	_DS_Hunterborn_HarvestExp.SetValue(0)
	_DS_Hunterborn_HarvestLevel.SetValue(0)
	_DS_Hunterborn_HarvestTimed.SetValue(1)
	_DS_Hunterborn_Hotkey_HideAbilities.SetValue(0)
	_DS_Hunterborn_Hotkey_HideMenu.SetValue(0)
	_DS_Hunterborn_HotkeyButcher.SetValue(0)
	_DS_Hunterborn_HotkeyDress.SetValue(0)
	_DS_Hunterborn_HotkeyForage.SetValue(0)
	_DS_Hunterborn_HotkeyHarvest.SetValue(0)
	_DS_Hunterborn_HotkeyPrimitiveCooking.SetValue(0)
	_DS_Hunterborn_HotkeyProcess.SetValue(0)
	_DS_Hunterborn_HotkeyScrimshaw.SetValue(0)
	_DS_Hunterborn_HotkeySenseDirection.SetValue(0)
	_DS_Hunterborn_HotkeySkin.SetValue(0)
	_DS_Hunterborn_HotkeyTaxonomy.SetValue(0)
	_DS_Hunterborn_HuntingKnife.SetValue(-1)
	_DS_Hunterborn_IncludeChicken.SetValue(1)
	_DS_Hunterborn_IncludeDog.SetValue(1)
	_DS_Hunterborn_IncludeHare.SetValue(1)
	_DS_Hunterborn_IncludeMonsterChaurus.SetValue(1)
	_DS_Hunterborn_IncludeMonsterDragons.SetValue(1)
	_DS_Hunterborn_IncludeMonsterSpiders.SetValue(1)
	_DS_Hunterborn_IncludeMonsterSpriggans.SetValue(1)
	_DS_Hunterborn_IncludeMonsterTrolls.SetValue(1)
	_DS_Hunterborn_IncludeMonsterWerewolves.SetValue(1)
	_DS_Hunterborn_IncludeMudcrab.SetValue(1)
	_DS_Hunterborn_IncludeSkeever.SetValue(1)
	_DS_Hunterborn_IncludeSlaughterfish.SetValue(1)
	_DS_Hunterborn_KnifeSales.SetValue(0)
	_DS_Hunterborn_MatAmount.SetValue(0)
	_DS_Hunterborn_MeatValue.SetValue(2)
	_DS_Hunterborn_MeatYield.SetValue(1)
	_DS_Hunterborn_MeatYieldCustom.SetValue(25)
	_DS_Hunterborn_MonsterHunter.SetValue(1)
	_DS_Hunterborn_PeltValue.SetValue(1)
	_DS_Hunterborn_PerMaAddLeather.SetValue(1)
	_DS_Hunterborn_PerMaGathererWarned.SetValue(0)
	_DS_Hunterborn_PerMaLevelWayfarer.SetValue(1)
	_DS_Hunterborn_PreventBearStash.SetValue(1)
	_DS_Hunterborn_PreventInCombat.SetValue(1)
	_DS_Hunterborn_PreventOverburden.SetValue(1)
	_DS_Hunterborn_RemoveManualLoot.SetValue(0)
	_DS_Hunterborn_RequireCookbook.SetValue(1)
	_DS_Hunterborn_RequireHuntingKnife.SetValue(0)
	_DS_Hunterborn_ReweighMeat.SetValue(0)
	_DS_Hunterborn_RiteRing_Wearing.SetValue(0)
	_DS_Hunterborn_RiteStage_Elm.SetValue(0)
	_DS_Hunterborn_RiteStage_Oak.SetValue(0)
	_DS_Hunterborn_RiteStage_Yew.SetValue(0)
	_DS_Hunterborn_ShowScreenBlood.SetValue(1)
	_DS_Hunterborn_SkinExp.SetValue(0)
	_DS_Hunterborn_SkinLevel.SetValue(0)
	_DS_Hunterborn_SkinTimed.SetValue(1)
	_DS_Hunterborn_SkyReAddLeather.SetValue(1)
	_DS_Hunterborn_SkyReGathererWarned.SetValue(0)
	_DS_Hunterborn_SkyReLevelWayfarer.SetValue(1)
	_DS_Hunterborn_SmallGame.SetValue(1)
	_DS_Hunterborn_SoupLifetime.SetValue(2.0)
	_DS_Hunterborn_SoupReturnBowl.SetValue(0)
	_DS_Hunterborn_SoupStayHot.SetValue(0)
	_DS_Hunterborn_UseAnimation.SetValue(1)
	_DS_Hunterborn_UseCampfireWood.SetValue(1)
	_DS_Hunterborn_UseCombinedCustomMats.SetValue(0)
	_DS_Hunterborn_UseCombinedCustomMeats.SetValue(0)
	_DS_Hunterborn_UseCombinedCustomPelts.SetValue(0)
	_DS_Hunterborn_UseCustomMats.SetValue(0)
	_DS_Hunterborn_EnableFurPlate.SetValue(0)
	_DS_Hunterborn_UseCustomMeats.SetValue(0)
	_DS_Hunterborn_UseCustomPelts.SetValue(0)
	_DS_Hunterborn_UseCustomTextures.SetValue(0)
	_DS_Hunterborn_UseHiSTextures.SetValue(0)
	_DS_Hunterborn_TotalCleans.SetValue(0)
EndFunction

function BackupValues(int jMod)
	JMap.setFlt(jMod, "_DS_Hunterborn_Action_Crouch", _DS_Hunterborn_Action_Crouch.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ActionCleanCarcass", _DS_Hunterborn_ActionCleanCarcass.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ActionCleanCarcassSneak", _DS_Hunterborn_ActionCleanCarcassSneak.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ActionFreshCarcass", _DS_Hunterborn_ActionFreshCarcass.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ActionFreshCarcassSneak", _DS_Hunterborn_ActionFreshCarcassSneak.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ActionsTimed", _DS_Hunterborn_ActionsTimed.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_AddTaxonomy", _DS_Hunterborn_AddTaxonomy.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_BlockSkyRe", _DS_Hunterborn_BlockSkyRe.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_BrewLevel", _DS_Hunterborn_BrewLevel.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ButcherTimed", _DS_Hunterborn_ButcherTimed.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_CarcassYield", _DS_Hunterborn_CarcassYield.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ClawsAsHuntingKnife", _DS_Hunterborn_ClawsAsHuntingKnife.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_DebugMode", _DS_Hunterborn_DebugMode.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_DragonsCorporeal", _DS_Hunterborn_DragonsCorporeal.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_DressTimed", _DS_Hunterborn_DressTimed.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableBotanyPerk", _DS_Hunterborn_EnableBotanyPerk.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableBountyPerk", _DS_Hunterborn_EnableBountyPerk.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableForaging", _DS_Hunterborn_EnableForaging.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableHuntersCache", _DS_Hunterborn_EnableHuntersCache.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnablePrimitiveCooking", _DS_Hunterborn_EnablePrimitiveCooking.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableSavageArrows", _DS_Hunterborn_EnableSavageArrows.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableScrimshaw", _DS_Hunterborn_EnableScrimshaw.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableSenseDirection", _DS_Hunterborn_EnableSenseDirection.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableSoupsStews", _DS_Hunterborn_EnableSoupsStews.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_FadeOuts", _DS_Hunterborn_FadeOuts.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ForageExp", _DS_Hunterborn_ForageExp.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ForageLevel", _DS_Hunterborn_ForageLevel.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ForageTimed", _DS_Hunterborn_ForageTimed.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_Frostfall_Added", _DS_Hunterborn_Frostfall_Added.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_Frostfall_Removed", _DS_Hunterborn_Frostfall_Removed.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HarvestExp", _DS_Hunterborn_HarvestExp.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HarvestLevel", _DS_Hunterborn_HarvestLevel.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HarvestTimed", _DS_Hunterborn_HarvestTimed.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_Hotkey_HideAbilities", _DS_Hunterborn_Hotkey_HideAbilities.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_Hotkey_HideMenu", _DS_Hunterborn_Hotkey_HideMenu.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyButcher", _DS_Hunterborn_HotkeyButcher.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyDress", _DS_Hunterborn_HotkeyDress.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyForage", _DS_Hunterborn_HotkeyForage.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyHarvest", _DS_Hunterborn_HotkeyHarvest.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyPrimitiveCooking", _DS_Hunterborn_HotkeyPrimitiveCooking.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyProcess", _DS_Hunterborn_HotkeyProcess.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyScrimshaw", _DS_Hunterborn_HotkeyScrimshaw.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeySenseDirection", _DS_Hunterborn_HotkeySenseDirection.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeySkin", _DS_Hunterborn_HotkeySkin.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HotkeyTaxonomy", _DS_Hunterborn_HotkeyTaxonomy.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_HuntingKnife", _DS_Hunterborn_HuntingKnife.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeChicken", _DS_Hunterborn_IncludeChicken.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeDog", _DS_Hunterborn_IncludeDog.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeHare", _DS_Hunterborn_IncludeHare.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterChaurus", _DS_Hunterborn_IncludeMonsterChaurus.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterDragons", _DS_Hunterborn_IncludeMonsterDragons.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterSpiders", _DS_Hunterborn_IncludeMonsterSpiders.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterSpriggans", _DS_Hunterborn_IncludeMonsterSpriggans.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterTrolls", _DS_Hunterborn_IncludeMonsterTrolls.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMonsterWerewolves", _DS_Hunterborn_IncludeMonsterWerewolves.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeMudcrab", _DS_Hunterborn_IncludeMudcrab.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeSkeever", _DS_Hunterborn_IncludeSkeever.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_IncludeSlaughterfish", _DS_Hunterborn_IncludeSlaughterfish.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_KnifeSales", _DS_Hunterborn_KnifeSales.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_MatAmount", _DS_Hunterborn_MatAmount.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_MeatValue", _DS_Hunterborn_MeatValue.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_MeatYield", _DS_Hunterborn_MeatYield.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_MeatYieldCustom", _DS_Hunterborn_MeatYieldCustom.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_MonsterHunter", _DS_Hunterborn_MonsterHunter.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_PeltValue", _DS_Hunterborn_PeltValue.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_PerMaAddLeather", _DS_Hunterborn_PerMaAddLeather.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_PerMaGathererWarned", _DS_Hunterborn_PerMaGathererWarned.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_PerMaLevelWayfarer", _DS_Hunterborn_PerMaLevelWayfarer.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_PreventBearStash", _DS_Hunterborn_PreventBearStash.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_PreventInCombat", _DS_Hunterborn_PreventInCombat.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_PreventOverburden", _DS_Hunterborn_PreventOverburden.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_RemoveManualLoot", _DS_Hunterborn_RemoveManualLoot.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_RequireCookbook", _DS_Hunterborn_RequireCookbook.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_RequireHuntingKnife", _DS_Hunterborn_RequireHuntingKnife.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ReweighMeat", _DS_Hunterborn_ReweighMeat.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_RiteRing_Wearing", _DS_Hunterborn_RiteRing_Wearing.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_RiteStage_Elm", _DS_Hunterborn_RiteStage_Elm.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_RiteStage_Oak", _DS_Hunterborn_RiteStage_Oak.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_RiteStage_Yew", _DS_Hunterborn_RiteStage_Yew.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_ShowScreenBlood", _DS_Hunterborn_ShowScreenBlood.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SkinExp", _DS_Hunterborn_SkinExp.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SkinLevel", _DS_Hunterborn_SkinLevel.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SkinTimed", _DS_Hunterborn_SkinTimed.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SkyReAddLeather", _DS_Hunterborn_SkyReAddLeather.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SkyReGathererWarned", _DS_Hunterborn_SkyReGathererWarned.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SkyReLevelWayfarer", _DS_Hunterborn_SkyReLevelWayfarer.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SmallGame", _DS_Hunterborn_SmallGame.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SoupLifetime", _DS_Hunterborn_SoupLifetime.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SoupReturnBowl", _DS_Hunterborn_SoupReturnBowl.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_SoupStayHot", _DS_Hunterborn_SoupStayHot.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseAnimation", _DS_Hunterborn_UseAnimation.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseCampfireWood", _DS_Hunterborn_UseCampfireWood.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseCombinedCustomMats", _DS_Hunterborn_UseCombinedCustomMats.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseCombinedCustomMeats", _DS_Hunterborn_UseCombinedCustomMeats.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseCombinedCustomPelts", _DS_Hunterborn_UseCombinedCustomPelts.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseCustomMats", _DS_Hunterborn_UseCustomMats.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_EnableFurPlate", _DS_Hunterborn_EnableFurPlate.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseCustomMeats", _DS_Hunterborn_UseCustomMeats.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseCustomPelts", _DS_Hunterborn_UseCustomPelts.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseCustomTextures", _DS_Hunterborn_UseCustomTextures.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_UseHiSTextures", _DS_Hunterborn_UseHiSTextures.GetValue())
	JMap.setFlt(jMod, "_DS_Hunterborn_TotalCleans", _DS_Hunterborn_TotalCleans.GetValue())
EndFunction

function restoreValues(int jMod)
	
	_DS_Hunterborn_Action_Crouch.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Action_Crouch"))
	_DS_Hunterborn_ActionCleanCarcass.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionCleanCarcass"))
	_DS_Hunterborn_ActionCleanCarcassSneak.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionCleanCarcassSneak"))
	_DS_Hunterborn_ActionFreshCarcass.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionFreshCarcass"))
	_DS_Hunterborn_ActionFreshCarcassSneak.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionFreshCarcassSneak"))
	_DS_Hunterborn_ActionsTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ActionsTimed"))
	_DS_Hunterborn_AddTaxonomy.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_AddTaxonomy"))
	_DS_Hunterborn_BlockSkyRe.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_BlockSkyRe"))
	_DS_Hunterborn_BrewLevel.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_BrewLevel"))
	_DS_Hunterborn_ButcherTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ButcherTimed"))
	_DS_Hunterborn_CarcassYield.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_CarcassYield"))
	_DS_Hunterborn_ClawsAsHuntingKnife.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ClawsAsHuntingKnife"))
	_DS_Hunterborn_DebugMode.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_DebugMode"))
	_DS_Hunterborn_DragonsCorporeal.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_DragonsCorporeal"))
	_DS_Hunterborn_DressTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_DressTimed"))
	_DS_Hunterborn_EnableBotanyPerk.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableBotanyPerk"))
	_DS_Hunterborn_EnableBountyPerk.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableBountyPerk"))
	_DS_Hunterborn_EnableForaging.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableForaging"))
	_DS_Hunterborn_EnableHuntersCache.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableHuntersCache"))
	_DS_Hunterborn_EnablePrimitiveCooking.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnablePrimitiveCooking"))
	_DS_Hunterborn_EnableSavageArrows.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableSavageArrows"))
	_DS_Hunterborn_EnableScrimshaw.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableScrimshaw"))
	_DS_Hunterborn_EnableSenseDirection.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableSenseDirection"))
	_DS_Hunterborn_EnableSoupsStews.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableSoupsStews"))
	_DS_Hunterborn_FadeOuts.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_FadeOuts"))
	_DS_Hunterborn_ForageExp.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ForageExp"))
	_DS_Hunterborn_ForageLevel.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ForageLevel"))
	_DS_Hunterborn_ForageTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ForageTimed"))
	_DS_Hunterborn_Frostfall_Added.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Frostfall_Added"))
	_DS_Hunterborn_Frostfall_Removed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Frostfall_Removed"))
	_DS_Hunterborn_HarvestExp.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HarvestExp"))
	_DS_Hunterborn_HarvestLevel.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HarvestLevel"))
	_DS_Hunterborn_HarvestTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HarvestTimed"))
	_DS_Hunterborn_Hotkey_HideAbilities.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Hotkey_HideAbilities"))
	_DS_Hunterborn_Hotkey_HideMenu.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_Hotkey_HideMenu"))
	_DS_Hunterborn_HotkeyButcher.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyButcher"))
	_DS_Hunterborn_HotkeyDress.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyDress"))
	_DS_Hunterborn_HotkeyForage.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyForage"))
	_DS_Hunterborn_HotkeyHarvest.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyHarvest"))
	_DS_Hunterborn_HotkeyPrimitiveCooking.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyPrimitiveCooking"))
	_DS_Hunterborn_HotkeyProcess.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyProcess"))
	_DS_Hunterborn_HotkeyScrimshaw.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyScrimshaw"))
	_DS_Hunterborn_HotkeySenseDirection.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeySenseDirection"))
	_DS_Hunterborn_HotkeySkin.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeySkin"))
	_DS_Hunterborn_HotkeyTaxonomy.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HotkeyTaxonomy"))
	_DS_Hunterborn_HuntingKnife.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_HuntingKnife"))
	_DS_Hunterborn_IncludeChicken.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeChicken"))
	_DS_Hunterborn_IncludeDog.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeDog"))
	_DS_Hunterborn_IncludeHare.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeHare"))
	_DS_Hunterborn_IncludeMonsterChaurus.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterChaurus"))
	_DS_Hunterborn_IncludeMonsterDragons.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterDragons"))
	_DS_Hunterborn_IncludeMonsterSpiders.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterSpiders"))
	_DS_Hunterborn_IncludeMonsterSpriggans.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterSpriggans"))
	_DS_Hunterborn_IncludeMonsterTrolls.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterTrolls"))
	_DS_Hunterborn_IncludeMonsterWerewolves.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMonsterWerewolves"))
	_DS_Hunterborn_IncludeMudcrab.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeMudcrab"))
	_DS_Hunterborn_IncludeSkeever.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeSkeever"))
	_DS_Hunterborn_IncludeSlaughterfish.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_IncludeSlaughterfish"))
	_DS_Hunterborn_KnifeSales.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_KnifeSales"))
	_DS_Hunterborn_MatAmount.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MatAmount"))
	_DS_Hunterborn_MeatValue.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MeatValue"))
	_DS_Hunterborn_MeatYield.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MeatYield"))
	_DS_Hunterborn_MeatYieldCustom.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MeatYieldCustom"))
	_DS_Hunterborn_MonsterHunter.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_MonsterHunter"))
	_DS_Hunterborn_PeltValue.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PeltValue"))
	_DS_Hunterborn_PerMaAddLeather.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PerMaAddLeather"))
	_DS_Hunterborn_PerMaGathererWarned.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PerMaGathererWarned"))
	_DS_Hunterborn_PerMaLevelWayfarer.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PerMaLevelWayfarer"))
	_DS_Hunterborn_PreventBearStash.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PreventBearStash"))
	_DS_Hunterborn_PreventInCombat.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PreventInCombat"))
	_DS_Hunterborn_PreventOverburden.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_PreventOverburden"))
	_DS_Hunterborn_RemoveManualLoot.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RemoveManualLoot"))
	_DS_Hunterborn_RequireCookbook.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RequireCookbook"))
	_DS_Hunterborn_RequireHuntingKnife.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RequireHuntingKnife"))
	_DS_Hunterborn_ReweighMeat.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ReweighMeat"))
	_DS_Hunterborn_RiteRing_Wearing.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RiteRing_Wearing"))
	_DS_Hunterborn_RiteStage_Elm.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RiteStage_Elm"))
	_DS_Hunterborn_RiteStage_Oak.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RiteStage_Oak"))
	_DS_Hunterborn_RiteStage_Yew.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_RiteStage_Yew"))
	_DS_Hunterborn_ShowScreenBlood.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_ShowScreenBlood"))
	_DS_Hunterborn_SkinExp.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkinExp"))
	_DS_Hunterborn_SkinLevel.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkinLevel"))
	_DS_Hunterborn_SkinTimed.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkinTimed"))
	_DS_Hunterborn_SkyReAddLeather.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkyReAddLeather"))
	_DS_Hunterborn_SkyReGathererWarned.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkyReGathererWarned"))
	_DS_Hunterborn_SkyReLevelWayfarer.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SkyReLevelWayfarer"))
	_DS_Hunterborn_SmallGame.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SmallGame"))
	_DS_Hunterborn_SoupLifetime.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SoupLifetime"))
	_DS_Hunterborn_SoupReturnBowl.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SoupReturnBowl"))
	_DS_Hunterborn_SoupStayHot.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_SoupStayHot"))
	_DS_Hunterborn_UseAnimation.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseAnimation"))
	_DS_Hunterborn_UseCampfireWood.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCampfireWood"))
	_DS_Hunterborn_UseCombinedCustomMats.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCombinedCustomMats"))
	_DS_Hunterborn_UseCombinedCustomMeats.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCombinedCustomMeats"))
	_DS_Hunterborn_UseCombinedCustomPelts.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCombinedCustomPelts"))
	_DS_Hunterborn_UseCustomMats.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCustomMats"))
	_DS_Hunterborn_EnableFurPlate.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_EnableFurPlate"))
	_DS_Hunterborn_UseCustomMeats.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCustomMeats"))
	_DS_Hunterborn_UseCustomPelts.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCustomPelts"))
	_DS_Hunterborn_UseCustomTextures.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseCustomTextures"))
	_DS_Hunterborn_UseHiSTextures.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_UseHiSTextures"))
	_DS_Hunterborn_TotalCleans.SetValue(JMap.getFlt(jMod, "_DS_Hunterborn_TotalCleans"))
endfunction