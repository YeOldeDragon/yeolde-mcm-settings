Scriptname _DS_HB_MCM extends SKI_ConfigBase
; SCRIPT VERSION ----------------------------------------------------------------------------------

int Function GetVersion()

	Return 165
	
EndFunction

; PROPERTIES --------------------------------------------------------------------------------------

_DS_HB_MAIN Property dsMain Auto
_DS_HB_Actions Property dsActions Auto
_DS_HB_Animals Property dsAnimals Auto
_DS_HB_Monsters Property dsMonsters Auto
_DS_HB_Knives Property dsKnives Auto
_DS_HB_Globals Property dsGlobals Auto
_DS_HB_CarcassArray Property dsCarcassArray Auto

String Property HBVersion Auto

Actor Property PlayerRef Auto

LeveledItem Property HunterLootLItem Auto

Perk Property CarcassMonsterPerk Auto
Perk Property BotanyPerk Auto
Perk Property BountyPerk Auto
Perk Property SavageArrowsPerk Auto

Spell Property ConfigSpell Auto
Spell Property ForagingSpell Auto
Spell Property ScrimshawSpell Auto
Spell Property TaxonomySpell Auto
Spell Property SenseDirSpell Auto
Spell Property PrimCookingSpell Auto

Potion Property StrangeBrew Auto

Spell Property hkFieldDress Auto
Spell Property hkSkin Auto
Spell Property hkHarvest Auto
Spell Property hkButcher Auto
Spell Property hkProcess Auto

FormList Property flRiteSpells Auto
GlobalVariable Property CACO_CACOIsInstalled Auto		;added Version 1.5

; LOCALIZATION ------------------------------------------------------------------------------------

string[] Property FreshActionStrings Auto
string[] Property CleanActionStrings Auto
string[] Property PeltValueStrings Auto
string[] Property MeatValueStrings Auto
string[] Property MatAmountStrings Auto
string[] Property MeatYieldStrings Auto
string[] Property KnifeSaleStrings Auto
string[] Property ExperienceStrings Auto


; PRIVATE VARIABLES -------------------------------------------------------------------------------

; OIDs (T:Text B:Toggle S:Slider M:Menu, C:Color, K:Key)

int			_toggleActive_OID_B
int			_toggleActionsTime_OID_B
int			_toggleDressTime_OID_B
int			_toggleSkinTime_OID_B
Int			_toggleHarvestTime_OID_B
int			_toggleButcherTime_OID_B
int			_toggleForageTime_OID_B
int			_toggleSmall_Chicken_OID_B
int			_toggleSmall_Dog_OID_B
int			_toggleSmall_Hare_OID_B
int			_toggleSmall_Mudcrab_OID_B
int			_toggleSmall_Skeever_OID_B
int			_toggleSmall_Slaughterfish_OID_B

int			_ActionFreshKill_OID_M
int			_ActionFreshKillSneak_OID_M
int			_ActionCleanKill_OID_M
int			_ActionCleanKillSneak_OID_M
int			_PresetPeltValue_OID_M
int			_PresetMeatValue_OID_M
int			_PresetMatAmount_OID_M
int			_PresetMeatYield_OID_M
int			_sliderMeatYield_OID_S
Int			_PresetKnifeSales_OID_M
; Realism
int			_toggleReweighMeat_OID_B
int			_toggleRemoveManualLoot_OID_B
int			_togglePreventBearStash_OID_B
int			_togglePreventOverburden_OID_B
int			_togglePreventInCombat_OID_B
int			_toggleRequireHuntingKnife_OID_B
int			_toggleClawsAsHuntingKnife_OID_B
int			_toggleShowScreenBlood_OID_B
int			_toggleUseAnimation_OID_B
int			_toggleFadeouts_OID_B
;int			_toggleEnableHuntersCache_OID_B
int			_toggleEnableConfig_OID_B
int			_toggleEnableForaging_OID_B
int			_toggleEnableScrimshaw_OID_B
int			_toggleEnablePrimitiveCooking_OID_B
int			_toggleEnableSenseDirection_OID_B
int			_toggleEnableBotany_OID_B
int			_toggleEnableBounty_OID_B
int			_toggleEnableSavageArrows_OID_B
int			_toggleEnableSoupsStews_OID_B
int			_sliderSoupLifetime_OID_S

int			_hotkeyDress_OID
int			_hotkeySkin_OID
int			_hotkeyHarvest_OID
int			_hotkeyButcher_OID
int			_hotkeyProcess_OID
int			_hotkeyForage_OID
int			_hotkeyScrimshaw_OID
int			_hotkeyTaxonomy_OID
int			_hotkeySenseDirection_OID
int			_hotkeyPrimitiveCooking_OID
int			_toggleHotkeysHideAbilities_OID_B
int			_toggleHotkeysHideMenu_OID_B

int			_textTotalCleans_OID
int			_textSkinningLevel_OID
int			_textSkinningLevelDisabled_OID
int			_textHarvestingLevel_OID
int			_textHarvestingLevelDisabled_OID
int			_textForagingLevel_OID
int			_textStatsDress_OID
int			_textStatsSkin_OID
int			_textStatsHarvest_OID
int			_textStatsButcher_OID
int			_Experience_OID_M
int			_textExpReset_OID

int			_toggleMonsterHunter_OID_B
int			_toggleMonster_Chaurus_OID_B
int			_toggleMonster_Spiders_OID_B
int			_toggleMonster_Spriggans_OID_B
int			_toggleMonster_Trolls_OID_B
int			_toggleMonster_Werewolves_OID_B
int			_toggleMonster_Dragons_OID_B
int			_toggleDragonsCorporeal_OID_B

int			_toggleAddTaxonomy_OID_B
int			_toggleSkyReAddLeather_OID_B
int			_toggleSkyReLevelWayfarer_OID_B
int			_toggleSkyReRemoveGatherer_OID_B
int			_togglePerMaAddLeather_OID_B
int			_togglePerMaLevelWayfarer_OID_B
int			_togglePerMaRemoveGatherer_OID_B
int			_toggleUseCustomPelts_OID_B
int			_toggleUseCombinedCustomPelts_OID_B
int			_toggleUseCustomMats_OID_B
int			_toggleEnableFurPlate_OID_B
int			_toggleUseCombinedCustomMats_OID_B
int			_toggleUseCustomMeats_OID_B
int			_toggleUseCombinedCustomMeats_OID_B
int			_toggleUseCustomTextures_OID_B
int			_toggleUseHiSCompatibility_OID_B
int			_toggleUseHiSTextures_OID_B
int			_toggleReapplyTemplates_OID_B
int			_toggleDebugMode_OID_B

bool		_HunterbornStarting				= false
bool		_HunterbornStopping				= false
Bool 		_ToggleCorpDragons				= False
bool		_ToggleSmallGame				= false
bool		_TogglePeltValue				= false
bool		_ToggleMeatValue				= false
bool		_ToggleKnifeSales				= false
bool		_ToggleReweighMeat				= false
bool		_ToggleKnife					= false
bool		_ToggleHideAbilities			= false
bool		_ToggleExpReset					= false
bool		_ToggleMonsterHunter			= false
bool		_ToggleConfig					= false
Bool 		_ToggleForaging					= False
Bool 		_ToggleScrimshaw				= False
Bool 		_TogglePrimCooking				= False
Bool 		_ToggleSenseDir					= False
Bool 		_ToggleBotany					= False
Bool 		_ToggleBounty					= False
Bool 		_ToggleSavageArrows				= False
Bool 		_ToggleTaxonomy					= False
bool		_ToggleSkyReAddLeather			= false
bool		_ToggleSkyReGatherer			= false
bool		_TogglePerMaAddLeather			= false
bool		_TogglePerMaGatherer			= false

int			_ExpResetTo				= 0


; INITIALIZATION ----------------------------------------------------------------------------------

; @implements SKI_ConfigBase
Event OnConfigInit()
	{Called when this config menu is initialized}

	Pages = new string[7]
	Pages[0] = "$_DS_HB_Page0"
	Pages[1] = "$_DS_HB_Page1"
	Pages[2] = "$_DS_HB_Page2"
	Pages[3] = "$_DS_HB_Page3"
	Pages[4] = "$_DS_HB_Page4"
	Pages[5] = "$_DS_HB_Page5"
	Pages[6] = "$_DS_HB_Page6"
	
EndEvent

; @implements SKI_QuestBase
Event OnVersionUpdate(int a_version)
	{Called when a version update of this script has been detected}
	
	; a_version is the new version, CurrentVersion is the old version
	If (a_version != CurrentVersion)
		Debug.Trace(" >>=======> Hunterborn is updating from " + CurrentVersion + " to " + a_version)
		If (dsGlobals.gHunterbornActive)
			OnConfigInit()
		
			; Re-init all the OID's
			OnPageReset("$_DS_HB_Page0")
			OnPageReset("$_DS_HB_Page1")
			OnPageReset("$_DS_HB_Page2")
			OnPageReset("$_DS_HB_Page3")
			OnPageReset("$_DS_HB_Page4")
			OnPageReset("$_DS_HB_Page5")
			OnPageReset("$_DS_HB_Page6")
			OnPageReset("")
		
			dsMain.DoInitStuff()
		EndIf
		
	EndIf
	
EndEvent


; EVENTS ------------------------------------------------------------------------------------------

; @implements SKI_ConfigBase
Event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}

	If (a_page == "")
		LoadCustomContent("Hunterborn/Hunterborn.dds", 113, 148)
		Return
	Else
		UnloadCustomContent()
	EndIf

	int disableFlag
	int subFlag
	
	If (dsGlobals.gHunterbornActive)
		disableFlag = OPTION_FLAG_NONE
	Else
		disableFlag = OPTION_FLAG_DISABLED
	EndIf

	; FEATURES
	;
	If (a_page == Pages[0])

		SetCursorFillMode(TOP_TO_BOTTOM)

		AddTextOption("$_DS_HB_Version", GetHBVersion(), OPTION_FLAG_NONE)
		AddEmptyOption()

		AddHeaderOption("$_DS_HB_Time", OPTION_FLAG_NONE)
		_toggleDressTime_OID_B = AddToggleOption("$_DS_HB_DressTimed", dsGlobals.gDressTimed, disableFlag)
		_toggleSkinTime_OID_B = AddToggleOption("$_DS_HB_SkinTimed", dsGlobals.gSkinTimed, disableFlag)
		_toggleHarvestTime_OID_B = AddToggleOption("$_DS_HB_HarvestTimed", dsGlobals.gHarvestTimed, disableFlag)
		_toggleButcherTime_OID_B = AddToggleOption("$_DS_HB_ButcherTimed", dsGlobals.gButcherTimed, disableFlag)
		_toggleForageTime_OID_B = AddToggleOption("$_DS_HB_ForageTimed", dsGlobals.gForageTimed, disableFlag)
		_toggleActionsTime_OID_B = AddToggleOption("$_DS_HB_ActionsTimed", dsGlobals.gActionsTimed, disableFlag)

		SetCursorPosition(1)

		If (_HunterbornStarting)
			AddTextOption("", "$_DS_HB_ExitToStart", OPTION_FLAG_NONE)
		ElseIf (_HunterbornStopping)
			AddTextOption("", "$_DS_HB_ExitToStop", OPTION_FLAG_NONE)
		ElseIf (dsGlobals.gHunterbornActive)
			_toggleActive_OID_B = AddTextOption("", "$_DS_HB_StopHB", OPTION_FLAG_NONE)
		Else
			_toggleActive_OID_B = AddTextOption("", "$_DS_HB_StartHB", OPTION_FLAG_NONE)
		EndIf
		AddEmptyOption()

		AddHeaderOption("$_DS_HB_SmallGame", OPTION_FLAG_NONE)
		_toggleSmall_Chicken_OID_B = AddToggleOption("$_DS_HB_Chickens", dsGlobals.gIncludeChicken, disableFlag)
		_toggleSmall_Dog_OID_B = AddToggleOption("$_DS_HB_Dogs", dsGlobals.gIncludeDog, disableFlag)
		_toggleSmall_Hare_OID_B = AddToggleOption("$_DS_HB_Hares", dsGlobals.gIncludeHare, disableFlag)
		_toggleSmall_Mudcrab_OID_B = AddToggleOption("$_DS_HB_Mudcrabs", dsGlobals.gIncludeMudcrab, disableFlag)
		_toggleSmall_Skeever_OID_B = AddToggleOption("$_DS_HB_Skeevers", dsGlobals.gIncludeSkeever, disableFlag)
		_toggleSmall_Slaughterfish_OID_B = AddToggleOption("$_DS_HB_Slaughterfish", dsGlobals.gIncludeSlaughterfish, disableFlag)

	; TWEAKS
	;
	ElseIf (a_page == Pages[1])

		SetCursorFillMode(TOP_TO_BOTTOM)

		AddHeaderOption("$_DS_HB_DefaultActions", OPTION_FLAG_NONE)
		_ActionFreshKill_OID_M = AddMenuOption("$_DS_HB_ClickOnFreshKill", FreshActionStrings[dsGlobals.gActionFreshCarcass], disableFlag)
		_ActionFreshKillSneak_OID_M = AddMenuOption("$_DS_HB_ClickOnFreshKillSneak", FreshActionStrings[dsGlobals.gActionFreshCarcassSneak], disableFlag)
		_ActionCleanKill_OID_M = AddMenuOption("$_DS_HB_ClickOnCleanKill", CleanActionStrings[dsGlobals.gActionCleanCarcass], disableFlag)
		_ActionCleanKillSneak_OID_M = AddMenuOption("$_DS_HB_ClickOnCleanKillSneak", CleanActionStrings[dsGlobals.gActionCleanCarcassSneak], disableFlag)
		AddEmptyOption()

		AddHeaderOption("$_DS_HB_Presets", OPTION_FLAG_NONE)
		_PresetPeltValue_OID_M = AddMenuOption("$_DS_HB_PeltValues", PeltValueStrings[dsGlobals.gPeltValue], disableFlag)
;		_PresetMeatValue_OID_M = AddMenuOption("$_DS_HB_MeatValues", MeatValueStrings[dsGlobals.gMeatValue], disableFlag)
		_PresetMatAmount_OID_M = AddMenuOption("$_DS_HB_MatAmount", MatAmountStrings[dsGlobals.gMatAmount], disableFlag)
		If dsGlobals.gMeatYield > 100
			_PresetMeatYield_OID_M = AddMenuOption("$_DS_HB_MeatYield", "$_DS_HB_MeatYield_Hungerborn", disableFlag)
		Else
			_PresetMeatYield_OID_M = AddMenuOption("$_DS_HB_MeatYield", MeatYieldStrings[dsGlobals.gMeatYield], disableFlag)
		EndIf
		
		If (dsGlobals.gHunterbornActive && dsGlobals.gMeatYield == 4)
			subFlag = OPTION_FLAG_NONE
		Else
			subFlag = OPTION_FLAG_DISABLED
		EndIf
		_sliderMeatYield_OID_S = AddSliderOption("$_DS_HB_CustomMeatYield", dsGlobals.gMeatYieldCustom, "{0}%", subFlag)

		_PresetKnifeSales_OID_M = AddMenuOption("$_DS_HB_KnifeSales", KnifeSaleStrings[dsGlobals.gKnifeSales], disableFlag)
		
		SetCursorPosition(1)
		
		AddHeaderOption("$_DS_HB_Realism", OPTION_FLAG_NONE)
;		_toggleReweighMeat_OID_B = AddToggleOption("$_DS_HB_ReweighMeat", dsGlobals.gReweighMeat, disableFlag)
		_toggleRemoveManualLoot_OID_B = AddToggleOption("$_DS_HB_RemoveManualLoot", dsGlobals.gRemoveManualLoot, disableFlag)
		_togglePreventBearStash_OID_B = AddToggleOption("$_DS_HB_PreventBearStash", dsGlobals.gPreventBearStash, disableFlag)
		_togglePreventOverburden_OID_B = AddToggleOption("$_DS_HB_PreventOverburden", dsGlobals.gPreventOverburden, disableFlag)
		_togglePreventInCombat_OID_B = AddToggleOption("$_DS_HB_PreventInCombat", dsGlobals.gPreventInCombat, disableFlag)
		_toggleRequireHuntingKnife_OID_B = AddToggleOption("$_DS_HB_RequireHuntingKnife", dsGlobals.gRequireHuntingKnife, disableFlag)
		If (dsGlobals.gHunterbornActive && dsGlobals.gRequireHuntingKnife == 1)
			subFlag = OPTION_FLAG_NONE
		Else
			subFlag = OPTION_FLAG_DISABLED
		EndIf
		_toggleClawsAsHuntingKnife_OID_B = AddToggleOption("$_DS_HB_ClawsAsHuntingKnife", dsGlobals.gClawsAsHuntingKnife, subFlag)
		_toggleShowScreenBlood_OID_B = AddToggleOption("$_DS_HB_ShowScreenBlood", dsGlobals.gShowScreenBlood, disableFlag)
		_toggleUseAnimation_OID_B = AddToggleOption("$_DS_HB_UseAnimation", dsGlobals.gUseAnimation, disableFlag)
		_toggleFadeouts_OID_B = AddToggleOption("$_DS_HB_Fadeouts", dsGlobals.gFadeOuts, disableFlag)
		AddEmptyOption()
		
	; Enable/Disable Page
	;
	ElseIf (a_page == Pages[2])

		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("$_DS_HB_SpellPower", OPTION_FLAG_NONE)
		
		;_toggleEnableHuntersCache_OID_B = AddToggleOption("$_DS_HB_EnableHuntersCache", dsGlobals.gEnableHuntersCache, disableFlag)
		_toggleEnableConfig_OID_B = AddToggleOption("$_DS_HB_EnableConfig", dsGlobals.gEnableConfig, disableFlag)
		_toggleEnableForaging_OID_B = AddToggleOption("$_DS_HB_EnableForaging", dsGlobals.gEnableForaging, disableFlag)
		_toggleEnableScrimshaw_OID_B = AddToggleOption("$_DS_HB_EnableScrimshaw", dsGlobals.gEnableScrimshaw, disableFlag)
		_toggleEnablePrimitiveCooking_OID_B = AddToggleOption("$_DS_HB_EnablePrimitiveCooking", dsGlobals.gEnablePrimitiveCooking, disableFlag)
		_toggleEnableSenseDirection_OID_B = AddToggleOption("$_DS_HB_EnableSenseDirection", dsGlobals.gEnableSenseDirection, disableFlag)
		_toggleAddTaxonomy_OID_B = AddToggleOption("$_DS_HB_AddTaxonomy", dsGlobals.gAddTaxonomy, disableFlag)
		
		SetCursorPosition(1)
		
		AddHeaderOption("$_DS_HB_PerkCrafting", OPTION_FLAG_NONE)
		
		_toggleEnableBotany_OID_B = AddToggleOption("$_DS_HB_EnableBotanyPerk", dsGlobals.gEnableBotanyPerk, disableFlag)
		_toggleEnableBounty_OID_B = AddToggleOption("$_DS_HB_EnableBountyPerk", dsGlobals.gEnableBountyPerk, disableFlag)
		_toggleEnableSavageArrows_OID_B = AddToggleOption("$_DS_HB_EnableSavageArrows", dsGlobals.gEnableSavageArrows, disableFlag)
		_toggleEnableSoupsStews_OID_B = AddToggleOption("$_DS_HB_EnableSoupsStews", dsGlobals.gEnableSoupsStews, disableFlag)
		if (dsGlobals.gEnableSoupsStews)
			_sliderSoupLifetime_OID_S = AddSliderOption("$_DS_HB_SoupLifetime", dsGlobals.gSoupLifetime, "{0} Hours", disableFlag)
		endIf
		
		
	; HOTKEYS
	;
	ElseIf (a_page == Pages[3])
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("$_DS_HB_HotkeysAnimals", OPTION_FLAG_NONE)
		_hotkeyDress_OID = AddKeyMapOption("$_DS_HB_HotkeyDress", dsGlobals.gHotkeyDress, subFlag)
		_hotkeySkin_OID = AddKeyMapOption("$_DS_HB_HotkeySkin", dsGlobals.gHotkeySkin, subFlag)
		_hotkeyHarvest_OID = AddKeyMapOption("$_DS_HB_HotkeyHarvest", dsGlobals.gHotkeyHarvest, subFlag)
		_hotkeyButcher_OID = AddKeyMapOption("$_DS_HB_HotkeyButcher", dsGlobals.gHotkeyButcher, subFlag)
		_hotkeyProcess_OID = AddKeyMapOption("$_DS_HB_HotkeyProcess", dsGlobals.gHotkeyProcess, subFlag)
		AddEmptyOption()

		AddHeaderOption("$_DS_HB_HotkeysSettings", OPTION_FLAG_NONE)
		_toggleHotkeysHideAbilities_OID_B = AddToggleOption("$_DS_HB_HotkeysHideAbilities", dsGlobals.gHotkey_HideAbilities, disableFlag)
		_toggleHotkeysHideMenu_OID_B = AddToggleOption("$_DS_HB_HotkeysHideMenu", dsGlobals.gHotkey_HideMenu, disableFlag)
		
		SetCursorPosition(1)
				
		AddHeaderOption("$_DS_HB_HotkeysAbilities", OPTION_FLAG_NONE)
		_hotkeyForage_OID = AddKeyMapOption("$_DS_HB_HotkeyForage", dsGlobals.gHotkeyForage, subFlag)
		_hotkeyScrimshaw_OID = AddKeyMapOption("$_DS_HB_HotkeyScrimshaw", dsGlobals.gHotkeyScrimshaw, subFlag)
		_hotkeyTaxonomy_OID = AddKeyMapOption("$_DS_HB_HotkeyTaxonomy", dsGlobals.gHotkeyTaxonomy, subFlag)
		_hotkeySenseDirection_OID = AddKeyMapOption("$_DS_HB_HotkeySenseDirection", dsGlobals.gHotkeySenseDirection, subFlag)
		_hotkeyPrimitiveCooking_OID = AddKeyMapOption("$_DS_HB_HotkeyPrimitiveCooking", dsGlobals.gHotkeyPrimitiveCooking, subFlag)
		

	; STATS
	;
	ElseIf (a_page == Pages[4])

		SetCursorFillMode(TOP_TO_BOTTOM)

		AddHeaderOption("$_DS_HB_Proficiency", OPTION_FLAG_NONE)
		_textTotalCleans_OID = AddTextOption("$_DS_HB_TotalCleans", dsGlobals.gTotalCleans, OPTION_FLAG_NONE)
		_textSkinningLevel_OID = AddTextOption("$_DS_HB_SkinningLevel", dsGlobals.gSkinLevel, OPTION_FLAG_NONE)
		_textHarvestingLevel_OID = AddTextOption("$_DS_HB_HarvestingLevel", dsGlobals.gHarvestLevel, OPTION_FLAG_NONE)
		_textForagingLevel_OID = AddTextOption("$_DS_HB_ForagingLevel", dsGlobals.gForageLevel, OPTION_FLAG_NONE)
		AddEmptyOption()

		If (dsGlobals.gHunterbornActive)
			AddHeaderOption("$_DS_HB_StatsTime", OPTION_FLAG_NONE)
			int index = dsAnimals.INDEX_DEER
			int knife = dsActions.GetHuntingKnife()
			float time_dress = dsActions.GetDressTime(index, knife) * 60
			float time_skin = dsActions.GetSkinTime(index, knife, False) * 60
			float time_harvest = dsActions.GetHarvestTime(index, knife, False) * 60
			
			Potion meattype = dsAnimals.MeatTypes[index]
			int meatcount = dsAnimals.GetMeatCount(4)
			float meatweight = meattype.GetWeight()
			int totalweight = Math.Ceiling(meatweight * meatcount)
			float butcherpenalty = dsActions.GetStandardPenalty(knife, 15)
			int totalpenalty = Math.Floor(butcherpenalty) + 8
			int limit = 100 - totalpenalty
			int section = dsActions.ButcherPrep_SectionSize(totalweight, limit, knife)
			totalpenalty += dsActions.ButcherPrep_SectionTime(totalweight, limit, knife, section)
			float time_butcher = dsActions.GetButcherTime(totalpenalty, knife) * 60
			
			_textStatsDress_OID = AddTextOption("$_DS_HB_StatsDress", Math.Ceiling(time_dress), OPTION_FLAG_NONE)
			_textStatsSkin_OID = AddTextOption("$_DS_HB_StatsSkin", Math.Ceiling(time_skin), OPTION_FLAG_NONE)
			_textStatsHarvest_OID = AddTextOption("$_DS_HB_StatsHarvest", Math.Ceiling(time_harvest), OPTION_FLAG_NONE)
			_textStatsButcher_OID = AddTextOption("$_DS_HB_StatsButcher", Math.Ceiling(time_butcher), OPTION_FLAG_NONE)
		EndIf
		
		SetCursorPosition(1)
		
		AddHeaderOption("$_DS_HB_Experience", OPTION_FLAG_NONE)
		_Experience_OID_M = AddMenuOption("$_DS_HB_ExpReset", ExperienceStrings[_ExpResetTo], disableFlag)
		If (_ToggleExpReset)
			_textExpReset_OID = AddTextOption("", "$_DS_HB_ExpResetExitNow", OPTION_FLAG_NONE)
		Else
			_textExpReset_OID = AddTextOption("", "", OPTION_FLAG_NONE)
		EndIf
		
		
	; MONSTER HUNTER
	;
	ElseIf (a_page == Pages[5])

		SetCursorFillMode(TOP_TO_BOTTOM)

		_toggleMonsterHunter_OID_B = AddToggleOption("$_DS_HB_EnableMonsters", dsGlobals.gMonsterHunter, disableFlag)
		AddEmptyOption()
		
		AddHeaderOption("$_DS_HB_MonsterList", OPTION_FLAG_NONE)
		
		If (dsGlobals.gHunterbornActive && dsGlobals.gMonsterHunter)
			subFlag = OPTION_FLAG_NONE
		Else
			subFlag = OPTION_FLAG_DISABLED
		EndIf		
		_toggleMonster_Chaurus_OID_B = AddToggleOption("$_DS_HB_MonsterChaurus", dsGlobals.gIncludeMonsterChaurus, subFlag)
		_toggleMonster_Spiders_OID_B = AddToggleOption("$_DS_HB_MonsterSpiders", dsGlobals.gIncludeMonsterSpiders, subFlag)
;		_toggleMonster_Spriggans_OID_B = AddToggleOption("$_DS_HB_MonsterSpriggans", dsGlobals.gIncludeMonsterSpriggans, subFlag)
		_toggleMonster_Trolls_OID_B = AddToggleOption("$_DS_HB_MonsterTrolls", dsGlobals.gIncludeMonsterTrolls, subFlag)
		_toggleMonster_Werewolves_OID_B = AddToggleOption("$_DS_HB_MonsterWerewolves", dsGlobals.gIncludeMonsterWerewolves, subFlag)
		_toggleMonster_Dragons_OID_B = AddToggleOption("$_DS_HB_MonsterDragons", dsGlobals.gIncludeMonsterDragons, subFlag)
		
		SetCursorPosition(1)
		
		AddEmptyOption()
		AddEmptyOption()
		
		AddHeaderOption("$_DS_HB_MonsterOptions", OPTION_FLAG_NONE)
		
		If (dsGlobals.gHunterbornActive && dsGlobals.gMonsterHunter && dsGlobals.gIncludeMonsterDragons)
			subFlag = OPTION_FLAG_NONE
		Else
			subFlag = OPTION_FLAG_DISABLED
		EndIf
		_toggleDragonsCorporeal_OID_B = AddToggleOption("$_DS_HB_DragonsCorporeal", dsGlobals.gDragonsCorporeal, subFlag)
		
	; COMPATIBILITY
	;
	ElseIf (a_page == Pages[6])

		SetCursorFillMode(TOP_TO_BOTTOM)

		AddHeaderOption("$_DS_HB_CompatibilityOptions", OPTION_FLAG_NONE)
		
		
		;/
		If (dsGlobals.isSkyReLoaded)
			_toggleSkyReAddLeather_OID_B = AddToggleOption("$_DS_HB_SkyReAddLeather", dsGlobals.gSkyReAddLeather, disableFlag)
			_toggleSkyReLevelWayfarer_OID_B = AddToggleOption("$_DS_HB_SkyReLevelWayfarer", dsGlobals.gSkyReLevelWayfarer, disableFlag)
		ElseIf (dsGlobals.isPerMaLoaded)
			_togglePerMaAddLeather_OID_B = AddToggleOption("$_DS_HB_PerMaAddLeather", dsGlobals.gPerMaAddLeather, disableFlag)
			_togglePerMaLevelWayfarer_OID_B = AddToggleOption("$_DS_HB_PerMaLevelWayfarer", dsGlobals.gPerMaLevelWayfarer, disableFlag)
		Else
		
			_toggleUseCustomPelts_OID_B = AddToggleOption("$_DS_HB_UseCustomPelts", dsGlobals.gUseCustomPelts, disableFlag)
			if (dsGlobals.gHunterbornActive && dsGlobals.gUseCustomPelts)
				subFlag = OPTION_FLAG_NONE
			Else
				subFlag = OPTION_FLAG_DISABLED
			EndIf
			_toggleUseCombinedCustomPelts_OID_B = AddToggleOption("$_DS_HB_UseCombinedCustomPelts", dsGlobals.gUseCombinedCustomPelts, subFlag)
		EndIf
		_toggleEnableFurPlate_OID_B = AddToggleOption("$_DS_HB_EnableFurPlate", dsGlobals.gEnableFurPlate, disableFlag)		;added Version 1.5
		_toggleUseCustomMats_OID_B = AddToggleOption("$_DS_HB_UseCustomMats", dsGlobals.gUseCustomMats, disableFlag)
		if (dsGlobals.gHunterbornActive && dsGlobals.gUseCustomMats)
			subFlag = OPTION_FLAG_NONE
		Else
			subFlag = OPTION_FLAG_DISABLED
		EndIf
		_toggleUseCombinedCustomMats_OID_B = AddToggleOption("$_DS_HB_UseCombinedCustomMats", dsGlobals.gUseCombinedCustomMats, subFlag)
		
		_toggleUseCustomMeats_OID_B = AddToggleOption("$_DS_HB_UseCustomMeats", dsGlobals.gUseCustomMeats, disableFlag)
		if (dsGlobals.gHunterbornActive && dsGlobals.gUseCustomMeats)
			subFlag = OPTION_FLAG_NONE
		Else
			subFlag = OPTION_FLAG_DISABLED
		EndIf
		_toggleUseCombinedCustomMeats_OID_B = AddToggleOption("$_DS_HB_UseCombinedCustomMeats", dsGlobals.gUseCombinedCustomMeats, subFlag)
/;		
		
		If (dsGlobals.isHiSLoaded)
			_toggleUseHiSCompatibility_OID_B = AddToggleOption("$_DS_HB_UseHiSCompatibility", dsGlobals.gUseHiSCompatibility, disableFlag)
			_toggleUseHiSTextures_OID_B = AddToggleOption("$_DS_HB_UseHiSTextures", dsGlobals.gUseHiSTextures, disableFlag)
		Else
			_toggleUseCustomTextures_OID_B = AddToggleOption("$_DS_HB_UseCustomTextures", dsGlobals.gUseCustomTextures, disableFlag)
		EndIf
		
		AddEmptyOption()
		AddEmptyOption()
		
		_toggleReapplyTemplates_OID_B = AddToggleOption("$_DS_HB_ReapplyTemplates", dsGlobals.gDoInitStuff, disableFlag)
		_toggleDebugMode_OID_B = AddToggleOption("$_DS_HB_DebugMode", dsGlobals.gDebugMode, OPTION_FLAG_NONE)
		
		SetCursorPosition(1)
;/		
		AddHeaderOption("$_DS_HB_CompatibilityChecks")
		AddToggleOption("$_DS_HB_SKSELoaded", dsGlobals.isSKSELoaded, OPTION_FLAG_DISABLED)
		AddToggleOption("$_DS_HB_RNDLoaded", dsGlobals.isRNDLoaded, OPTION_FLAG_DISABLED)
		;AddToggleOption("$_DS_HB_CACOLoaded", CACO_CACOIsInstalled.GetValue(), OPTION_FLAG_DISABLED)				;added Version 1.5
		AddToggleOption("$_DS_HB_CampfireLoaded", dsGlobals.isCampfireLoaded, OPTION_FLAG_DISABLED)				;added Version 1.5
		;AddToggleOption("$_DS_HB_FrostfallLoaded", dsGlobals.isFrostfallLoaded, OPTION_FLAG_DISABLED)
		AddToggleOption("$_DS_HB_SkyReLoaded", dsGlobals.isSkyReLoaded, OPTION_FLAG_DISABLED)
		If (dsGlobals.gHunterbornActive && dsGlobals.isSkyReLoaded)
			If (dsMain.HasSkyReGatherer())
				subFlag = OPTION_FLAG_NONE
			Else
				subFlag = OPTION_FLAG_DISABLED
			EndIf
			_toggleSkyReRemoveGatherer_OID_B = AddToggleOption("$_DS_HB_SkyReRemoveGatherer", False, subFlag)
		EndIf
		AddToggleOption("$_DS_HB_PerMaLoaded", dsGlobals.isPerMaLoaded, OPTION_FLAG_DISABLED)
		If (dsGlobals.gHunterbornActive && dsGlobals.isPerMaLoaded)
			If (dsMain.HasPerMaGatherer())
				subFlag = OPTION_FLAG_NONE
			Else
				subFlag = OPTION_FLAG_DISABLED
			EndIf
			_togglePerMaRemoveGatherer_OID_B = AddToggleOption("$_DS_HB_PerMaRemoveGatherer", False, subFlag)
		EndIf
		AddToggleOption("$_DS_HB_RequiemLoaded", dsGlobals.isRequiemLoaded, OPTION_FLAG_DISABLED)
		AddToggleOption("$_DS_HB_IALoaded", dsGlobals.isIALoaded, OPTION_FLAG_DISABLED)
		AddToggleOption("$_DS_HB_DawnguardLoaded", dsGlobals.isDLC1Loaded, OPTION_FLAG_DISABLED)
		AddToggleOption("$_DS_HB_HearthfireLoaded", dsGlobals.isBYOHLoaded, OPTION_FLAG_DISABLED)
		AddToggleOption("$_DS_HB_DragonbornLoaded", dsGlobals.isDLC2Loaded, OPTION_FLAG_DISABLED)
/;		
	EndIf

EndEvent

; @implements SKI_ConfigBase
event OnOptionHighlight(int a_option)
	{Called when highlighting an option}

	if (a_option == _toggleActionsTime_OID_B)
		SetInfoText("$_DS_HB_Hint_ActionsTimed")

	elseIf (a_option == _toggleDressTime_OID_B)
		SetInfoText("$_DS_HB_Hint_DressTimed")

	elseIf (a_option == _toggleSkinTime_OID_B)
		SetInfoText("$_DS_HB_Hint_SkinTimed")

	elseIf (a_option == _toggleHarvestTime_OID_B)
		SetInfoText("$_DS_HB_Hint_HarvestTimed")

	elseIf (a_option == _toggleButcherTime_OID_B)
		SetInfoText("$_DS_HB_Hint_ButcherTimed")

	elseIf (a_option == _toggleForageTime_OID_B)
		SetInfoText("$_DS_HB_Hint_ForageTimed")
		
	elseIf (a_option == _toggleSmall_Chicken_OID_B)
		SetInfoText("$_DS_HB_Hint_SmallChickens")

	elseIf (a_option == _toggleSmall_Dog_OID_B)
		SetInfoText("$_DS_HB_Hint_SmallDogs")

	elseIf (a_option == _toggleSmall_Hare_OID_B)
		SetInfoText("$_DS_HB_Hint_SmallHares")

	elseIf (a_option == _toggleSmall_Mudcrab_OID_B)
		SetInfoText("$_DS_HB_Hint_SmallMudcrabs")

	elseIf (a_option == _toggleSmall_Skeever_OID_B)
		SetInfoText("$_DS_HB_Hint_SmallSkeevers")

	elseIf (a_option == _toggleSmall_Slaughterfish_OID_B)
		SetInfoText("$_DS_HB_Hint_SmallSlaughterfish")

	elseIf (a_option == _ActionFreshKill_OID_M)
		SetInfoText("$_DS_HB_Hint_ActionFreshKill")

	elseIf (a_option == _ActionFreshKillSneak_OID_M)
		SetInfoText("$_DS_HB_Hint_ActionFreshKillSneak")

	elseIf (a_option == _ActionCleanKill_OID_M)
		SetInfoText("$_DS_HB_Hint_ActionCleanKill")

	elseIf (a_option == _ActionCleanKillSneak_OID_M)
		SetInfoText("$_DS_HB_Hint_ActionCleanKillSneak")

	elseIf (a_option == _PresetPeltValue_OID_M)
		SetInfoText("$_DS_HB_Hint_PresetPeltValue")

	elseIf (a_option == _PresetMeatValue_OID_M)
		SetInfoText("$_DS_HB_Hint_PresetMeatValue")

	elseIf (a_option == _PresetMatAmount_OID_M)
		SetInfoText("$_DS_HB_Hint_PresetMatAmount")
		
	elseIf (a_option == _PresetMeatYield_OID_M)
		SetInfoText("$_DS_HB_Hint_PresetMeatYield")
		
	elseIf (a_option == _sliderMeatYield_OID_S)
		SetInfoText("$_DS_HB_Hint_CustomMeatYield")
		
	elseIf (a_option == _PresetKnifeSales_OID_M)
		SetInfoText("$_DS_HB_Hint_PresetKnifeSales")
		
	elseIf (a_option == _toggleReweighMeat_OID_B)
		SetInfoText("$_DS_HB_Hint_ReweighMeat")

	elseIf (a_option == _togglePreventBearStash_OID_B)
		SetInfoText("$_DS_HB_Hint_PreventBearStash")

	elseIf (a_option == _togglePreventOverburden_OID_B)
		SetInfoText("$_DS_HB_Hint_PreventOverburden")

	elseIf (a_option == _togglePreventInCombat_OID_B)
		SetInfoText("$_DS_HB_Hint_PreventInCombat")

	elseIf (a_option == _toggleUseAnimation_OID_B)
		SetInfoText("$_DS_HB_Hint_UseAnimation")

	elseIf (a_option == _toggleFadeouts_OID_B)
		SetInfoText("$_DS_HB_Hint_Fadeouts")

	elseIf (a_option == _toggleShowScreenBlood_OID_B)
		SetInfoText("$_DS_HB_Hint_ShowScreenBlood")

	elseIf (a_option == _toggleRemoveManualLoot_OID_B)
		SetInfoText("$_DS_HB_Hint_RemoveManualLoot")

	elseIf (a_option == _toggleRequireHuntingKnife_OID_B)
		SetInfoText("$_DS_HB_Hint_RequireHuntingKnife")

	elseIf (a_option == _toggleClawsAsHuntingKnife_OID_B)
		SetInfoText("$_DS_HB_Hint_ClawsAsHuntingKnife")

;	elseIf (a_option == _toggleEnableHuntersCache_OID_B)
;		SetInfoText("$_DS_HB_Hint_EnableHuntersCache")

	elseIf (a_option == _toggleEnableConfig_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableConfig")

	elseIf (a_option == _toggleEnableForaging_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableForaging")

	elseIf (a_option == _toggleEnableScrimshaw_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableScrimshaw")

	elseIf (a_option == _toggleEnablePrimitiveCooking_OID_B)
		SetInfoText("$_DS_HB_Hint_EnablePrimitiveCooking")

	elseIf (a_option == _toggleEnableSenseDirection_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableSenseDirection")

	elseIf (a_option == _toggleEnableBotany_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableBotanyPerk")

	elseIf (a_option == _toggleEnableBounty_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableBountyPerk")

	elseIf (a_option == _toggleEnableSavageArrows_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableSavageArrows")

	elseIf (a_option == _toggleEnableSoupsStews_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableSoupsStews")
		
	elseIf (a_option == _sliderSoupLifetime_OID_S)
		SetInfoText("$_DS_HB_Hint_SoupLifetime")
		
	elseIf (a_option == _hotkeyDress_OID)
		SetInfoText("$_DS_HB_Hint_HotkeyDress")

	elseIf (a_option == _hotkeySkin_OID)
		SetInfoText("$_DS_HB_Hint_HotkeySkin")

	elseIf (a_option == _hotkeyHarvest_OID)
		SetInfoText("$_DS_HB_Hint_HotkeyHarvest")

	elseIf (a_option == _hotkeyButcher_OID)
		SetInfoText("$_DS_HB_Hint_HotkeyButcher")

	elseIf (a_option == _hotkeyProcess_OID)
		SetInfoText("$_DS_HB_Hint_HotkeyProcess")

	elseIf (a_option == _hotkeyForage_OID)
		SetInfoText("$_DS_HB_Hint_HotkeyForage")

	elseIf (a_option == _hotkeyScrimshaw_OID)
		SetInfoText("$_DS_HB_Hint_HotkeyScrimshaw")

	elseIf (a_option == _hotkeyTaxonomy_OID)
		SetInfoText("$_DS_HB_Hint_HotkeyTaxonomy")

	elseIf (a_option == _hotkeySenseDirection_OID)
		SetInfoText("$_DS_HB_Hint_HotkeySenseDirection")

	elseIf (a_option == _hotkeyPrimitiveCooking_OID)
		SetInfoText("$_DS_HB_Hint_HotkeyPrimitiveCooking")

	elseIf (a_option == _toggleHotkeysHideAbilities_OID_B)
		SetInfoText("$_DS_HB_Hint_HotkeysHideAbilities")

	elseIf (a_option == _toggleHotkeysHideMenu_OID_B)
		SetInfoText("$_DS_HB_Hint_HotkeysHideMenu")

	elseIf (a_option == _textTotalCleans_OID)
		SetInfoText("$_DS_HB_Hint_TotalCleans")

	elseIf (a_option == _textSkinningLevel_OID)
		SetInfoText("$_DS_HB_Hint_SkinningLevel")

	elseIf (a_option == _textSkinningLevelDisabled_OID)
		SetInfoText("$_DS_HB_Hint_SkinningLevelDisabled")

	elseIf (a_option == _textHarvestingLevel_OID)
		SetInfoText("$_DS_HB_Hint_HarvestingLevel")
		
	elseIf (a_option == _textHarvestingLevelDisabled_OID)
		SetInfoText("$_DS_HB_Hint_HarvestingLevelDisabled")
		
	elseIf (a_option == _textForagingLevel_OID)
		SetInfoText("$_DS_HB_Hint_ForagingLevel")
		
	elseIf (a_option == _textStatsDress_OID)
		SetInfoText("$_DS_HB_Hint_StatsDress")
		
	elseIf (a_option == _textStatsSkin_OID)
		SetInfoText("$_DS_HB_Hint_StatsSkin")
		
	elseIf (a_option == _textStatsHarvest_OID)
		SetInfoText("$_DS_HB_Hint_StatsHarvest")
		
	elseIf (a_option == _textStatsButcher_OID)
		SetInfoText("$_DS_HB_Hint_StatsButcher")
		
	elseIf (a_option == _Experience_OID_M)
		SetInfoText("$_DS_HB_Hint_ExpReset")
		
	elseIf (a_option == _toggleMonsterHunter_OID_B)
		SetInfoText("$_DS_HB_Hint_EnableMonsters")

	elseIf (a_option == _toggleMonster_Chaurus_OID_B)
		SetInfoText("$_DS_HB_Hint_MonsterChaurus")

	elseIf (a_option == _toggleMonster_Spiders_OID_B)
		SetInfoText("$_DS_HB_Hint_MonsterSpiders")

	elseIf (a_option == _toggleMonster_Spriggans_OID_B)
		SetInfoText("$_DS_HB_Hint_MonsterSpriggans")

	elseIf (a_option == _toggleMonster_Trolls_OID_B)
		SetInfoText("$_DS_HB_Hint_MonsterTrolls")

	elseIf (a_option == _toggleMonster_Werewolves_OID_B)
		SetInfoText("$_DS_HB_Hint_MonsterWerewolves")

	elseIf (a_option == _toggleMonster_Dragons_OID_B)
		SetInfoText("$_DS_HB_Hint_MonsterDragons")

	elseIf (a_option == _toggleDragonsCorporeal_OID_B)
		SetInfoText("$_DS_HB_Hint_DragonsCorporeal")

	elseIf (a_option == _toggleAddTaxonomy_OID_B)
		SetInfoText("$_DS_HB_Hint_AddTaxonomy")
		
	elseIf (a_option == _toggleSkyReAddLeather_OID_B)
		SetInfoText("$_DS_HB_Hint_SkyReAddLeather")
		
	elseIf (a_option == _toggleSkyReLevelWayfarer_OID_B)
		SetInfoText("$_DS_HB_Hint_SkyReLevelWayfarer")
		
	elseIf (a_option == _toggleSkyReRemoveGatherer_OID_B)
		SetInfoText("$_DS_HB_Hint_SkyReRemoveGatherer")
		
	elseIf (a_option == _togglePerMaAddLeather_OID_B)
		SetInfoText("$_DS_HB_Hint_PerMaAddLeather")
		
	elseIf (a_option == _togglePerMaLevelWayfarer_OID_B)
		SetInfoText("$_DS_HB_Hint_PerMaLevelWayfarer")
		
	elseIf (a_option == _togglePerMaRemoveGatherer_OID_B)
		SetInfoText("$_DS_HB_Hint_PerMaRemoveGatherer")
		
	elseIf (a_option == _toggleUseCustomPelts_OID_B)
		SetInfoText("$_DS_HB_Hint_UseCustomPelts")
		
	elseIf (a_option == _toggleUseCombinedCustomPelts_OID_B)
		SetInfoText("$_DS_HB_Hint_UseCombinedCustomPelts")
		
	elseIf (a_option == _toggleUseCustomMats_OID_B)
		SetInfoText("$_DS_HB_Hint_UseCustomMats")

	elseIf (a_option == _toggleEnableFurPlate_OID_B)				;added Version 1.5
		SetInfoText("$_DS_HB_Hint_EnableFurPlate")				;added Version 1.5
		
	elseIf (a_option == _toggleUseCombinedCustomMats_OID_B)
		SetInfoText("$_DS_HB_Hint_UseCombinedCustomMats")
		
	elseIf (a_option == _toggleUseCustomMeats_OID_B)
		SetInfoText("$_DS_HB_Hint_UseCustomMeats")
		
	elseIf (a_option == _toggleUseCombinedCustomMeats_OID_B)
		SetInfoText("$_DS_HB_Hint_UseCombinedCustomMeats")
		
	elseIf (a_option == _toggleUseCustomTextures_OID_B)
		SetInfoText("$_DS_HB_Hint_UseCustomTextures")
		
	elseIf (a_option == _toggleUseHiSCompatibility_OID_B)
		SetInfoText("$_DS_HB_Hint_UseHiSCompatibility")
		
	elseIf (a_option == _toggleUseHiSTextures_OID_B)
		SetInfoText("$_DS_HB_Hint_UseHiSTextures")
		
	elseIf (a_option == _toggleReapplyTemplates_OID_B)
		SetInfoText("$_DS_HB_Hint_ReapplyTemplates")
		
	elseIf (a_option == _toggleDebugMode_OID_B)
		SetInfoText("$_DS_HB_Hint_DebugMode")
		
	endIf

endEvent

; @implements SKI_ConfigBase
event OnOptionSelect(int a_option)
	{Called when a non-interactive option has been selected}

	int disableFlag
	
	if (a_option == _toggleActive_OID_B)
		Log ("OnOptionSelect() -> _HunterbornStarting:"  + _HunterbornStarting)
		if (_HunterbornStarting || _HunterbornStopping)
			return
		elseIf (dsGlobals.gHunterbornActive)
			SetTextOptionValue(_toggleActive_OID_B, "$_DS_HB_OKExitToStop", false)
			_HunterbornStopping = true
		else
			SetTextOptionValue(_toggleActive_OID_B, "$_DS_HB_OKExitToStart", false)
			_HunterbornStarting = true
			Log ("OnOptionSelect() -> Exit to Start: _HunterbornStarting:"  + _HunterbornStarting)
		endIf

	elseIf (a_option == _toggleActionsTime_OID_B)
		dsGlobals.gActionsTimed = !dsGlobals.gActionsTimed
		SetToggleOptionValue(_toggleActionsTime_OID_B, dsGlobals.gActionsTimed, false)
		
	elseIf (a_option == _toggleDressTime_OID_B)
		dsGlobals.gDressTimed = !dsGlobals.gDressTimed
		SetToggleOptionValue(_toggleDressTime_OID_B, dsGlobals.gDressTimed, false)

	elseIf (a_option == _toggleSkinTime_OID_B)
		dsGlobals.gSkinTimed = !dsGlobals.gSkinTimed
		SetToggleOptionValue(_toggleSkinTime_OID_B, dsGlobals.gSkinTimed, false)

	elseIf (a_option == _toggleHarvestTime_OID_B)
		dsGlobals.gHarvestTimed = !dsGlobals.gHarvestTimed
		SetToggleOptionValue(_toggleHarvestTime_OID_B, dsGlobals.gHarvestTimed, false)

	elseIf (a_option == _toggleButcherTime_OID_B)
		dsGlobals.gButcherTimed = !dsGlobals.gButcherTimed
		SetToggleOptionValue(_toggleButcherTime_OID_B, dsGlobals.gButcherTimed, false)

	elseIf (a_option == _toggleForageTime_OID_B)
		dsGlobals.gForageTimed = !dsGlobals.gForageTimed
		SetToggleOptionValue(_toggleForageTime_OID_B, dsGlobals.gForageTimed, false)

	elseIf (a_option == _toggleSmall_Chicken_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeChicken = !dsGlobals.gIncludeChicken
		SetToggleOptionValue(_toggleSmall_Chicken_OID_B, dsGlobals.gIncludeChicken, false)

	elseIf (a_option == _toggleSmall_Dog_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeDog = !dsGlobals.gIncludeDog
		SetToggleOptionValue(_toggleSmall_Dog_OID_B, dsGlobals.gIncludeDog, false)

	elseIf (a_option == _toggleSmall_Hare_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeHare = !dsGlobals.gIncludeHare
		SetToggleOptionValue(_toggleSmall_Hare_OID_B, dsGlobals.gIncludeHare, false)

	elseIf (a_option == _toggleSmall_Mudcrab_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeMudcrab = !dsGlobals.gIncludeMudcrab
		SetToggleOptionValue(_toggleSmall_Mudcrab_OID_B, dsGlobals.gIncludeMudcrab, false)

	elseIf (a_option == _toggleSmall_Skeever_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeSkeever = !dsGlobals.gIncludeSkeever
		SetToggleOptionValue(_toggleSmall_Skeever_OID_B, dsGlobals.gIncludeSkeever, false)

	elseIf (a_option == _toggleSmall_Slaughterfish_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeSlaughterfish = !dsGlobals.gIncludeSlaughterfish
		SetToggleOptionValue(_toggleSmall_Slaughterfish_OID_B, dsGlobals.gIncludeSlaughterfish, false)

	elseIf (a_option == _toggleReweighMeat_OID_B)
		_ToggleReweighMeat = True
		dsGlobals.gReweighMeat = !dsGlobals.gReweighMeat
		SetToggleOptionValue(_toggleReweighMeat_OID_B, dsGlobals.gReweighMeat, false)

	elseIf (a_option == _togglePreventBearStash_OID_B)
		dsGlobals.gPreventBearStash = !dsGlobals.gPreventBearStash
		SetToggleOptionValue(_togglePreventBearStash_OID_B, dsGlobals.gPreventBearStash, false)

	elseIf (a_option == _togglePreventOverburden_OID_B)
		dsGlobals.gPreventOverburden = !dsGlobals.gPreventOverburden
		SetToggleOptionValue(_togglePreventOverburden_OID_B, dsGlobals.gPreventOverburden, false)

	elseIf (a_option == _togglePreventInCombat_OID_B)
		dsGlobals.gPreventInCombat = !dsGlobals.gPreventInCombat
		SetToggleOptionValue(_togglePreventInCombat_OID_B, dsGlobals.gPreventInCombat, false)

	elseIf (a_option == _toggleUseAnimation_OID_B)
		dsGlobals.gUseAnimation = !dsGlobals.gUseAnimation
		SetToggleOptionValue(_toggleUseAnimation_OID_B, dsGlobals.gUseAnimation, false)

	elseIf (a_option == _toggleFadeouts_OID_B)
		dsGlobals.gFadeOuts = !dsGlobals.gFadeOuts
		SetToggleOptionValue(_toggleFadeouts_OID_B, dsGlobals.gFadeOuts, false)

	elseIf (a_option == _toggleShowScreenBlood_OID_B)
		dsGlobals.gShowScreenBlood = !dsGlobals.gShowScreenBlood
		SetToggleOptionValue(_toggleShowScreenBlood_OID_B, dsGlobals.gShowScreenBlood, false)

	elseIf (a_option == _toggleRemoveManualLoot_OID_B)
		dsGlobals.gRemoveManualLoot = !dsGlobals.gRemoveManualLoot
		SetToggleOptionValue(_toggleRemoveManualLoot_OID_B, dsGlobals.gRemoveManualLoot, false)

	elseIf (a_option == _toggleRequireHuntingKnife_OID_B)
		_ToggleKnife = True
		dsGlobals.gRequireHuntingKnife = !dsGlobals.gRequireHuntingKnife
		SetToggleOptionValue(_toggleRequireHuntingKnife_OID_B, dsGlobals.gRequireHuntingKnife, false)
		If (dsGlobals.gRequireHuntingKnife)
			disableFlag = OPTION_FLAG_NONE
		Else
			disableFlag = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(_toggleClawsAsHuntingKnife_OID_B, disableFlag, false)

	elseIf (a_option == _toggleClawsAsHuntingKnife_OID_B)
		_ToggleKnife = True
		dsGlobals.gClawsAsHuntingKnife = !dsGlobals.gClawsAsHuntingKnife
		SetToggleOptionValue(_toggleClawsAsHuntingKnife_OID_B, dsGlobals.gClawsAsHuntingKnife, false)

;	elseIf (a_option == _toggleEnableHuntersCache_OID_B)
;		dsGlobals.gEnableHuntersCache = !dsGlobals.gEnableHuntersCache
;		SetToggleOptionValue(_toggleEnableHuntersCache_OID_B, dsGlobals.gEnableHuntersCache)

	elseIf (a_option == _toggleEnableConfig_OID_B)
		_ToggleConfig = True
		dsGlobals.gEnableConfig = !dsGlobals.gEnableConfig
		SetToggleOptionValue(_toggleEnableConfig_OID_B, dsGlobals.gEnableConfig, false)

	elseIf (a_option == _toggleEnableForaging_OID_B)
		_ToggleForaging = True
		dsGlobals.gEnableForaging = !dsGlobals.gEnableForaging
		SetToggleOptionValue(_toggleEnableForaging_OID_B, dsGlobals.gEnableForaging, false)

	elseIf (a_option == _toggleEnableScrimshaw_OID_B)
		_ToggleScrimshaw = True
		dsGlobals.gEnableScrimshaw = !dsGlobals.gEnableScrimshaw
		SetToggleOptionValue(_toggleEnableScrimshaw_OID_B, dsGlobals.gEnableScrimshaw, false)

	elseIf (a_option == _toggleEnablePrimitiveCooking_OID_B)
		_TogglePrimCooking = True
		dsGlobals.gEnablePrimitiveCooking = !dsGlobals.gEnablePrimitiveCooking
		SetToggleOptionValue(_toggleEnablePrimitiveCooking_OID_B, dsGlobals.gEnablePrimitiveCooking, false)

	elseIf (a_option == _toggleEnableSenseDirection_OID_B)
		_ToggleSenseDir = True
		dsGlobals.gEnableSenseDirection = !dsGlobals.gEnableSenseDirection
		SetToggleOptionValue(_toggleEnableSenseDirection_OID_B, dsGlobals.gEnableSenseDirection, false)

	elseIf (a_option == _toggleEnableBotany_OID_B)
		_ToggleBotany = True
		dsGlobals.gEnableBotanyPerk = !dsGlobals.gEnableBotanyPerk
		SetToggleOptionValue(_toggleEnableBotany_OID_B, dsGlobals.gEnableBotanyPerk, false)

	elseIf (a_option == _toggleEnableBounty_OID_B)
		_ToggleBounty = True
		dsGlobals.gEnableBountyPerk = !dsGlobals.gEnableBountyPerk
		SetToggleOptionValue(_toggleEnableBounty_OID_B, dsGlobals.gEnableBountyPerk, false)

	elseIf (a_option == _toggleEnableSavageArrows_OID_B)
		_ToggleSavageArrows = True
		dsGlobals.gEnableSavageArrows = !dsGlobals.gEnableSavageArrows
		SetToggleOptionValue(_toggleEnableSavageArrows_OID_B, dsGlobals.gEnableSavageArrows, false)

	elseIf (a_option == _toggleEnableSoupsStews_OID_B)
		dsGlobals.gEnableSoupsStews = !dsGlobals.gEnableSoupsStews
		If dsGlobals.gEnableSoupsStews
			Potion token
			token = Game.GetFormFromFile(0x800, "Hunterborn - Soups and Stews.esp") as Potion
			If token == None
				 ShowMessage("This feature requires an activated ESP that could not be loaded.\n\nYou may need to reinstall Hunterborn, or check that Hunterborn - Soups and Stews is enabled.",false,"$Yes","$No")
				dsGlobals.gEnableSoupsStews = False
			ElseIf dsGlobals.isINEEDLoaded
				token = Game.GetFormFromFile(0x801, "Hunterborn - iNeed Patch.esp") as Potion
				If token == None
					 ShowMessage("iNeed was detected, but the iNeed patch is not enabled. This patch is needed to turn iNeed waterskins into the water used for soups and stews.\n\nYou may need to reinstall Hunterborn, or check that Hunterborn - iNeed Patch is enabled.",false,"$Yes","$No")
					dsGlobals.gEnableSoupsStews = False
				EndIf
			EndIf
		EndIf
		ForcePageReset()
		SetToggleOptionValue(_toggleEnableSoupsStews_OID_B, dsGlobals.gEnableSoupsStews, false)

	elseIf (a_option == _toggleHotKeysHideAbilities_OID_B)
		_ToggleHideAbilities = True
		dsGlobals.gHotkey_HideAbilities = !dsGlobals.gHotkey_HideAbilities
		SetToggleOptionValue(_toggleHotKeysHideAbilities_OID_B, dsGlobals.gHotkey_HideAbilities, false)

	elseIf (a_option == _toggleHotKeysHideMenu_OID_B)
		dsGlobals.gHotkey_HideMenu = !dsGlobals.gHotkey_HideMenu
		SetToggleOptionValue(_toggleHotKeysHideMenu_OID_B, dsGlobals.gHotkey_HideMenu, false)

	elseIf (a_option == _toggleMonsterHunter_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gMonsterHunter = !dsGlobals.gMonsterHunter
		SetToggleOptionValue(_toggleMonsterHunter_OID_B, dsGlobals.gMonsterHunter, false)
		SetOptionFlagsForMonsters()

	elseIf (a_option == _toggleMonster_Chaurus_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterChaurus = !dsGlobals.gIncludeMonsterChaurus
		SetToggleOptionValue(_toggleMonster_Chaurus_OID_B, dsGlobals.gIncludeMonsterChaurus, false)

	elseIf (a_option == _toggleMonster_Spiders_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterSpiders = !dsGlobals.gIncludeMonsterSpiders
		SetToggleOptionValue(_toggleMonster_Spiders_OID_B, dsGlobals.gIncludeMonsterSpiders, false)

	elseIf (a_option == _toggleMonster_Spriggans_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterSpriggans = !dsGlobals.gIncludeMonsterSpriggans
		SetToggleOptionValue(_toggleMonster_Spriggans_OID_B, dsGlobals.gIncludeMonsterSpriggans, false)

	elseIf (a_option == _toggleMonster_Trolls_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterTrolls = !dsGlobals.gIncludeMonsterTrolls
		SetToggleOptionValue(_toggleMonster_Trolls_OID_B, dsGlobals.gIncludeMonsterTrolls, false)

	elseIf (a_option == _toggleMonster_Werewolves_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterWerewolves = !dsGlobals.gIncludeMonsterWerewolves
		SetToggleOptionValue(_toggleMonster_Werewolves_OID_B, dsGlobals.gIncludeMonsterWerewolves, false)

	elseIf (a_option == _toggleMonster_Dragons_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterDragons = !dsGlobals.gIncludeMonsterDragons
		SetToggleOptionValue(_toggleMonster_Dragons_OID_B, dsGlobals.gIncludeMonsterDragons, false)
		SetOptionFlagsForMonsters()

	elseIf (a_option == _toggleDragonsCorporeal_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gDragonsCorporeal = !dsGlobals.gDragonsCorporeal
		SetToggleOptionValue(_toggleDragonsCorporeal_OID_B, dsGlobals.gDragonsCorporeal, false)

	elseIf (a_option == _toggleAddTaxonomy_OID_B)
		_ToggleTaxonomy = True
		dsGlobals.gAddTaxonomy = !dsGlobals.gAddTaxonomy
		SetToggleOptionValue(_toggleAddTaxonomy_OID_B, dsGlobals.gAddTaxonomy, false)

	elseIf (a_option == _toggleSkyReAddLeather_OID_B)
		_ToggleSkyReAddLeather = True
		dsGlobals.gSkyReAddLeather = !dsGlobals.gSkyReAddLeather
		SetToggleOptionValue(_toggleSkyReAddLeather_OID_B, dsGlobals.gSkyReAddLeather, false)
	
	elseIf (a_option == _toggleSkyReLevelWayfarer_OID_B)
		dsGlobals.gSkyReLevelWayfarer = !dsGlobals.gSkyReLevelWayfarer
		SetToggleOptionValue(_toggleSkyReLevelWayfarer_OID_B, dsGlobals.gSkyReLevelWayfarer, false)
	
	elseIf (a_option == _toggleSkyReRemoveGatherer_OID_B)
		_ToggleSkyReGatherer = !_ToggleSkyReGatherer
		SetToggleOptionValue(_toggleSkyReRemoveGatherer_OID_B, _ToggleSkyReGatherer, false)

	elseIf (a_option == _togglePerMaAddLeather_OID_B)
		_TogglePerMaAddLeather = True
		dsGlobals.gPerMaAddLeather = !dsGlobals.gPerMaAddLeather
		SetToggleOptionValue(_togglePerMaAddLeather_OID_B, dsGlobals.gPerMaAddLeather, false)
	
	elseIf (a_option == _togglePerMaLevelWayfarer_OID_B)
		dsGlobals.gPerMaLevelWayfarer = !dsGlobals.gPerMaLevelWayfarer
		SetToggleOptionValue(_togglePerMaLevelWayfarer_OID_B, dsGlobals.gPerMaLevelWayfarer, false)
	
	elseIf (a_option == _togglePerMaRemoveGatherer_OID_B)
		_TogglePerMaGatherer = !_TogglePerMaGatherer
		SetToggleOptionValue(_togglePerMaRemoveGatherer_OID_B, _TogglePerMaGatherer, false)

	elseIf (a_option == _toggleUseCustomPelts_OID_B)
		dsGlobals.gUseCustomPelts = !dsGlobals.gUseCustomPelts
		SetToggleOptionValue(_toggleUseCustomPelts_OID_B, dsGlobals.gUseCustomPelts, false)
		If (dsGlobals.gUseCustomPelts)
			disableFlag = OPTION_FLAG_NONE
		Else
			disableFlag = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(_toggleUseCombinedCustomPelts_OID_B, disableFlag, false)

	elseIf (a_option == _toggleUseCombinedCustomPelts_OID_B)
		dsGlobals.gUseCombinedCustomPelts = !dsGlobals.gUseCombinedCustomPelts
		SetToggleOptionValue(_toggleUseCombinedCustomPelts_OID_B, dsGlobals.gUseCombinedCustomPelts, false)

	elseIf (a_option == _toggleUseCustomMats_OID_B)
		dsGlobals.gUseCustomMats = !dsGlobals.gUseCustomMats
		SetToggleOptionValue(_toggleUseCustomMats_OID_B, dsGlobals.gUseCustomMats, false)
		If (dsGlobals.gUseCustomMats)
			disableFlag = OPTION_FLAG_NONE
		Else
			disableFlag = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(_toggleUseCombinedCustomMats_OID_B, disableFlag, false)
	
	elseIf (a_option == _toggleEnableFurPlate_OID_B)										;added Version 1.5
		dsGlobals.gEnableFurPlate = !dsGlobals.gEnableFurPlate							
		SetToggleOptionValue(_toggleEnableFurPlate_OID_B, dsGlobals.gEnableFurPlate, false)

	elseIf (a_option == _toggleUseCombinedCustomMats_OID_B)
		dsGlobals.gUseCombinedCustomMats = !dsGlobals.gUseCombinedCustomMats
		SetToggleOptionValue(_toggleUseCombinedCustomMats_OID_B, dsGlobals.gUseCombinedCustomMats, false)

	elseIf (a_option == _toggleUseCustomMeats_OID_B)
		dsGlobals.gUseCustomMeats = !dsGlobals.gUseCustomMeats
		SetToggleOptionValue(_toggleUseCustomMeats_OID_B, dsGlobals.gUseCustomMeats, false)
		If (dsGlobals.gUseCustomMeats)
			disableFlag = OPTION_FLAG_NONE
		Else
			disableFlag = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(_toggleUseCombinedCustomMeats_OID_B, disableFlag, false)

	elseIf (a_option == _toggleUseCombinedCustomMeats_OID_B)
		dsGlobals.gUseCombinedCustomMeats = !dsGlobals.gUseCombinedCustomMeats
		SetToggleOptionValue(_toggleUseCombinedCustomMeats_OID_B, dsGlobals.gUseCombinedCustomMeats, false)

	elseIf (a_option == _toggleUseCustomTextures_OID_B)
		dsGlobals.gUseCustomTextures = !dsGlobals.gUseCustomTextures
		SetToggleOptionValue(_toggleUseCustomTextures_OID_B, dsGlobals.gUseCustomTextures, false)

	ElseIf (a_option == _toggleUseHiSCompatibility_OID_B)
		dsGlobals.gUseHiSCompatibility = !dsGlobals.gUseHiSCompatibility
		SetToggleOptionValue(_toggleUseHiSCompatibility_OID_B, dsGlobals.gUseHiSCompatibility, false)
		
	ElseIf (a_option == _toggleUseHiSTextures_OID_B)
		dsGlobals.gUseHiSTextures = !dsGlobals.gUseHiSTextures
		SetToggleOptionValue(_toggleUseHiSTextures_OID_B, dsGlobals.gUseHiSTextures, false)

	ElseIf (a_option == _toggleReapplyTemplates_OID_B)
		dsGlobals.gDoInitStuff = !dsGlobals.gDoInitStuff
		SetToggleOptionValue(_toggleReapplyTemplates_OID_B, dsGlobals.gDoInitStuff, false)

	ElseIf (a_option == _toggleDebugMode_OID_B)
		dsGlobals.gDebugMode = !dsGlobals.gDebugMode
		SetToggleOptionValue(_toggleDebugMode_OID_B, dsGlobals.gDebugMode, false)

	endIf

endEvent

; @implements SKI_ConfigBase
event OnOptionDefault(int a_option)
	{Called when resetting an option to its default value}

	if (a_option == _toggleActionsTime_OID_B)
		dsGlobals.gActionsTimed = True
		SetToggleOptionValue(_toggleActionsTime_OID_B, dsGlobals.gActionsTimed, false)

	elseIf (a_option == _toggleDressTime_OID_B)
		dsGlobals.gDressTimed = True
		SetToggleOptionValue(_toggleDressTime_OID_B, dsGlobals.gDressTimed, false)

	elseIf (a_option == _toggleSkinTime_OID_B)
		dsGlobals.gSkinTimed = True
		SetToggleOptionValue(_toggleSkinTime_OID_B, dsGlobals.gSkinTimed, false)

	elseIf (a_option == _toggleHarvestTime_OID_B)
		dsGlobals.gHarvestTimed = True
		SetToggleOptionValue(_toggleHarvestTime_OID_B, dsGlobals.gHarvestTimed, false)

	elseIf (a_option == _toggleButcherTime_OID_B)
		dsGlobals.gButcherTimed = True
		SetToggleOptionValue(_toggleButcherTime_OID_B, dsGlobals.gButcherTimed, false)

	elseIf (a_option == _toggleForageTime_OID_B)
		dsGlobals.gForageTimed = True
		SetToggleOptionValue(_toggleForageTime_OID_B, dsGlobals.gForageTimed, false)
		
	elseIf (a_option == _toggleSmall_Chicken_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeChicken = True
		SetToggleOptionValue(_toggleSmall_Chicken_OID_B, dsGlobals.gIncludeChicken, false)
		
	elseIf (a_option == _toggleSmall_Dog_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeDog = True
		SetToggleOptionValue(_toggleSmall_Dog_OID_B, dsGlobals.gIncludeDog, false)
		
	elseIf (a_option == _toggleSmall_Hare_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeHare = True
		SetToggleOptionValue(_toggleSmall_Hare_OID_B, dsGlobals.gIncludeHare, false)
		
	elseIf (a_option == _toggleSmall_Mudcrab_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeMudcrab = True
		SetToggleOptionValue(_toggleSmall_Mudcrab_OID_B, dsGlobals.gIncludeMudcrab, false)
		
	elseIf (a_option == _toggleSmall_Skeever_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeSkeever = True
		SetToggleOptionValue(_toggleSmall_Skeever_OID_B, dsGlobals.gIncludeSkeever, false)
		
	elseIf (a_option == _toggleSmall_Slaughterfish_OID_B)
		_ToggleSmallGame = True
		dsGlobals.gIncludeSlaughterfish = True
		SetToggleOptionValue(_toggleSmall_Slaughterfish_OID_B, dsGlobals.gIncludeSlaughterfish, false)
		
	elseIf (a_option == _toggleReweighMeat_OID_B)
		_ToggleReweighMeat = True
		dsGlobals.gReweighMeat = False
		SetToggleOptionValue(_toggleReweighMeat_OID_B, dsGlobals.gReweighMeat, false)
		
	elseIf (a_option == _togglePreventBearStash_OID_B)
		dsGlobals.gPreventBearStash = True
		SetToggleOptionValue(_togglePreventBearStash_OID_B, dsGlobals.gPreventBearStash, false)
		
	elseIf (a_option == _togglePreventOverburden_OID_B)
		dsGlobals.gPreventOverburden = True
		SetToggleOptionValue(_togglePreventOverburden_OID_B, dsGlobals.gPreventOverburden, false)
		
	elseIf (a_option == _togglePreventInCombat_OID_B)
		dsGlobals.gPreventInCombat = True
		SetToggleOptionValue(_togglePreventInCombat_OID_B, dsGlobals.gPreventInCombat, false)
				
	elseIf (a_option == _toggleUseAnimation_OID_B)
		dsGlobals.gUseAnimation = True
		SetToggleOptionValue(_toggleUseAnimation_OID_B, dsGlobals.gUseAnimation, false)
		
	elseIf (a_option == _toggleFadeouts_OID_B)
		dsGlobals.gFadeOuts = True
		SetToggleOptionValue(_toggleFadeouts_OID_B, dsGlobals.gFadeOuts, false)
		
	elseIf (a_option == _toggleShowScreenBlood_OID_B)
		dsGlobals.gShowScreenBlood = True
		SetToggleOptionValue(_toggleShowScreenBlood_OID_B, dsGlobals.gShowScreenBlood, false)
		
	elseIf (a_option == _toggleRemoveManualLoot_OID_B)
		dsGlobals.gRemoveManualLoot = False
		SetToggleOptionValue(_toggleRemoveManualLoot_OID_B, dsGlobals.gRemoveManualLoot, false)
		
	elseIf (a_option == _toggleRequireHuntingKnife_OID_B)
		_ToggleKnife = True
		dsGlobals.gRequireHuntingKnife = False
		SetToggleOptionValue(_toggleRequireHuntingKnife_OID_B, dsGlobals.gRequireHuntingKnife, false)
		
	elseIf (a_option == _toggleClawsAsHuntingKnife_OID_B)
		_ToggleKnife = True
		dsGlobals.gClawsAsHuntingKnife = False
		SetToggleOptionValue(_toggleClawsAsHuntingKnife_OID_B, dsGlobals.gClawsAsHuntingKnife, false)
		
;	elseIf (a_option == _toggleEnableHuntersCache_OID_B)
;		dsGlobals.gEnableHuntersCache = False
;		SetToggleOptionValue(_toggleEnableHuntersCache_OID_B, dsGlobals.gEnableHuntersCache)

	elseIf (a_option == _toggleEnableConfig_OID_B)
		_ToggleConfig = True
		dsGlobals.gEnableConfig = False
		SetToggleOptionValue(_toggleEnableConfig_OID_B, dsGlobals.gEnableConfig, false)
		
	elseIf (a_option == _toggleEnableForaging_OID_B)
		_ToggleForaging = True
		dsGlobals.gEnableForaging = False
		SetToggleOptionValue(_toggleEnableForaging_OID_B, dsGlobals.gEnableForaging, false)
		
	elseIf (a_option == _toggleEnableScrimshaw_OID_B)
		_ToggleScrimshaw = True
		dsGlobals.gEnableScrimshaw = False
		SetToggleOptionValue(_toggleEnableScrimshaw_OID_B, dsGlobals.gEnableScrimshaw, false)
		
	elseIf (a_option == _toggleEnablePrimitiveCooking_OID_B)
		_TogglePrimCooking = True
		dsGlobals.gEnablePrimitiveCooking = False
		SetToggleOptionValue(_toggleEnablePrimitiveCooking_OID_B, dsGlobals.gEnablePrimitiveCooking, false)
		
	elseIf (a_option == _toggleEnableSenseDirection_OID_B)
		_ToggleSenseDir = True
		dsGlobals.gEnableSenseDirection = False
		SetToggleOptionValue(_toggleEnableSenseDirection_OID_B, dsGlobals.gEnableSenseDirection, false)
		
	elseIf (a_option == _toggleEnableBotany_OID_B)
		_ToggleBotany = True
		dsGlobals.gEnableBotanyPerk = False
		SetToggleOptionValue(_toggleEnableBotany_OID_B, dsGlobals.gEnableBotanyPerk, false)
		
	elseIf (a_option == _toggleEnableBounty_OID_B)
		_ToggleBounty = True
		dsGlobals.gEnableBountyPerk = False
		SetToggleOptionValue(_toggleEnableBounty_OID_B, dsGlobals.gEnableBountyPerk, false)
		
	elseIf (a_option == _toggleEnableSavageArrows_OID_B)
		_ToggleSavageArrows = True
		dsGlobals.gEnableSavageArrows = False
		SetToggleOptionValue(_toggleEnableSavageArrows_OID_B, dsGlobals.gEnableSavageArrows, false)

	elseIf (a_option == _toggleEnableSoupsStews_OID_B)
		dsGlobals.gEnableSoupsStews = False
		SetToggleOptionValue(_toggleEnableSoupsStews_OID_B, dsGlobals.gEnableSoupsStews, false)

	elseIf (a_option == _hotkeyDress_OID)
		dsGlobals.gHotkeyDress = 0
		SetKeyMapOptionValue(_hotkeyDress_OID, 0, "")
		
	elseIf (a_option == _hotkeySkin_OID)
		dsGlobals.gHotkeySkin = 0
		SetKeyMapOptionValue(_hotkeySkin_OID, 0, "")
		
	elseIf (a_option == _hotkeyHarvest_OID)
		dsGlobals.gHotkeyHarvest = 0
		SetKeyMapOptionValue(_hotkeyHarvest_OID, 0, "")
		
	elseIf (a_option == _hotkeyButcher_OID)
		dsGlobals.gHotkeyButcher = 0
		SetKeyMapOptionValue(_hotkeyButcher_OID, 0, "")
		
	elseIf (a_option == _hotkeyProcess_OID)
		dsGlobals.gHotkeyProcess = 0
		SetKeyMapOptionValue(_hotkeyProcess_OID, 0, "")
		
	elseIf (a_option == _hotkeyForage_OID)
		dsGlobals.gHotkeyForage = 0
		SetKeyMapOptionValue(_hotkeyForage_OID, 0, "")
		
	elseIf (a_option == _hotkeyScrimshaw_OID)
		dsGlobals.gHotkeyScrimshaw = 0
		SetKeyMapOptionValue(_hotkeyScrimshaw_OID, 0, "")
		
	elseIf (a_option == _hotkeyTaxonomy_OID)
		dsGlobals.gHotkeyTaxonomy = 0
		SetKeyMapOptionValue(_hotkeyTaxonomy_OID, 0, "")
		
	elseIf (a_option == _hotkeySenseDirection_OID)
		dsGlobals.gHotkeySenseDirection = 0
		SetKeyMapOptionValue(_hotkeySenseDirection_OID, 0, "")
		
	elseIf (a_option == _hotkeyPrimitiveCooking_OID)
		dsGlobals.gHotkeyPrimitiveCooking = 0
		SetKeyMapOptionValue(_hotkeyPrimitiveCooking_OID, 0, "")
		
	elseIf (a_option == _toggleHotkeysHideAbilities_OID_B)
		_ToggleHideAbilities = True
		dsGlobals.gHotkey_HideAbilities = False
		SetToggleOptionValue(_toggleHotkeysHideAbilities_OID_B, dsGlobals.gHotkey_HideAbilities, false)
		
	elseIf (a_option == _toggleHotkeysHideMenu_OID_B)
		dsGlobals.gHotkey_HideMenu = False
		SetToggleOptionValue(_toggleHotkeysHideMenu_OID_B, dsGlobals.gHotkey_HideMenu, false)
		
	elseIf (a_option == _toggleMonsterHunter_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gMonsterHunter = False
		SetToggleOptionValue(_toggleMonsterHunter_OID_B, dsGlobals.gMonsterHunter, false)
		SetOptionFlagsForMonsters()
		
	elseIf (a_option == _toggleMonster_Chaurus_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterChaurus = True
		SetToggleOptionValue(_toggleMonster_Chaurus_OID_B, dsGlobals.gIncludeMonsterChaurus, false)
		
	elseIf (a_option == _toggleMonster_Spiders_OID_B) 
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterSpiders = True
		SetToggleOptionValue(_toggleMonster_Spiders_OID_B, dsGlobals.gIncludeMonsterSpiders, false)
		
	elseIf (a_option == _toggleMonster_Spriggans_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterSpriggans = True
		SetToggleOptionValue(_toggleMonster_Spriggans_OID_B, dsGlobals.gIncludeMonsterSpriggans, false)
		
	elseIf (a_option == _toggleMonster_Trolls_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterTrolls = True
		SetToggleOptionValue(_toggleMonster_Trolls_OID_B, dsGlobals.gIncludeMonsterTrolls, false)
		
	elseIf (a_option == _toggleMonster_Werewolves_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterWerewolves = True
		SetToggleOptionValue(_toggleMonster_Werewolves_OID_B, dsGlobals.gIncludeMonsterWerewolves, false)
		
	elseIf (a_option == _toggleMonster_Dragons_OID_B)
		_ToggleMonsterHunter = True
		dsGlobals.gIncludeMonsterDragons = True
		SetToggleOptionValue(_toggleMonster_Dragons_OID_B, dsGlobals.gIncludeMonsterDragons, false)
		
	elseIf (a_option == _toggleAddTaxonomy_OID_B)
		_ToggleTaxonomy = True
		dsGlobals.gAddTaxonomy = False
		SetToggleOptionValue(_toggleAddTaxonomy_OID_B, dsGlobals.gAddTaxonomy, false)
		
	elseIf (a_option == _toggleSkyReAddLeather_OID_B)
		dsGlobals.gSkyReAddLeather = True
		SetToggleOptionValue(_toggleSkyReAddLeather_OID_B, dsGlobals.gSkyReAddLeather, false)
		
	elseIf (a_option == _toggleSkyReLevelWayfarer_OID_B)
		dsGlobals.gSkyReLevelWayfarer = True
		SetToggleOptionValue(_toggleSkyReLevelWayfarer_OID_B, dsGlobals.gSkyReLevelWayfarer, false)
		
	elseIf (a_option == _togglePerMaAddLeather_OID_B)
		dsGlobals.gPerMaAddLeather = True
		SetToggleOptionValue(_togglePerMaAddLeather_OID_B, dsGlobals.gPerMaAddLeather, false)
		
	elseIf (a_option == _togglePerMaLevelWayfarer_OID_B)
		dsGlobals.gPerMaLevelWayfarer = True
		SetToggleOptionValue(_togglePerMaLevelWayfarer_OID_B, dsGlobals.gPerMaLevelWayfarer, false)
		
	elseIf (a_option == _toggleUseCustomPelts_OID_B)
		dsGlobals.gUseCustomPelts = False
		SetToggleOptionValue(_toggleUseCustomPelts_OID_B, dsGlobals.gUseCustomPelts, false)
		SetOptionFlags(_toggleUseCombinedCustomPelts_OID_B, OPTION_FLAG_DISABLED, false)
		
	elseIf (a_option == _toggleUseCombinedCustomPelts_OID_B)
		dsGlobals.gUseCombinedCustomPelts = False
		SetToggleOptionValue(_toggleUseCombinedCustomPelts_OID_B, dsGlobals.gUseCombinedCustomPelts, false)
		
	elseIf (a_option == _toggleUseCustomMats_OID_B)
		dsGlobals.gUseCustomMats = False
		SetToggleOptionValue(_toggleUseCustomMats_OID_B, dsGlobals.gUseCustomMats, false)
		SetOptionFlags(_toggleUseCombinedCustomMats_OID_B, OPTION_FLAG_DISABLED, false)
		
	elseIf (a_option == _toggleUseCombinedCustomMats_OID_B)
		dsGlobals.gUseCombinedCustomMats = False
		SetToggleOptionValue(_toggleUseCombinedCustomMats_OID_B, dsGlobals.gUseCombinedCustomMats, false)
		
	elseIf (a_option == _toggleUseCustomMeats_OID_B)
		dsGlobals.gUseCustomMeats = False
		SetToggleOptionValue(_toggleUseCustomMeats_OID_B, dsGlobals.gUseCustomMeats, false)
		SetOptionFlags(_toggleUseCombinedCustomMeats_OID_B, OPTION_FLAG_DISABLED, false)
		
	elseIf (a_option == _toggleUseCombinedCustomMeats_OID_B)
		dsGlobals.gUseCombinedCustomMeats = False
		SetToggleOptionValue(_toggleUseCombinedCustomMeats_OID_B, dsGlobals.gUseCombinedCustomMeats, false)
		
	elseIf (a_option == _toggleUseCustomTextures_OID_B)
		dsGlobals.gUseCustomTextures = False
		SetToggleOptionValue(_toggleUseCustomTextures_OID_B, dsGlobals.gUseCustomTextures, false)
		
	ElseIf (a_option == _toggleUseHiSCompatibility_OID_B)
		dsGlobals.gUseHiSCompatibility = True
		SetToggleOptionValue(_toggleUseHiSCompatibility_OID_B, dsGlobals.gUseHiSCompatibility, false)
		
	ElseIf (a_option == _toggleUseHiSTextures_OID_B)
		dsGlobals.gUseHiSTextures = True
		SetToggleOptionValue(_toggleUseHiSTextures_OID_B, dsGlobals.gUseHiSTextures, false)
		
	EndIf

endEvent

; @implements SKI_ConfigBase
event OnOptionSliderOpen(int a_option)
	{Called when a slider option has been selected}

	if (a_option == _sliderMeatYield_OID_S)
		SetSliderDialogStartValue(dsGlobals.gMeatYieldCustom)
		SetSliderDialogDefaultValue(25)
		SetSliderDialogRange(1, 200)
		SetSliderDialogInterval(1)
	elseIf (a_option == _sliderSoupLifetime_OID_S)
		SetSliderDialogStartValue(dsGlobals.gSoupLifetime)
		SetSliderDialogDefaultValue(2)
		SetSliderDialogRange(0, 168)
		SetSliderDialogInterval(1)
	endIf

endEvent

; @implements SKI_ConfigBase
event OnOptionSliderAccept(int a_option, float a_value)
	{Called when a new slider value has been accepted}

	if (a_option == _sliderMeatYield_OID_S)
		dsGlobals.gMeatYieldCustom = Math.Floor(a_value)
		SetSliderOptionValue(a_option, a_value, "{0}%", false)
		If a_value > 100
			SetMenuOptionValue(_PresetMeatYield_OID_M, "$_DS_HB_MeatYield_Hungerborn", false)
		EndIf
	elseIf (a_option == _sliderSoupLifetime_OID_S)
		dsGlobals.gSoupLifetime = Math.Floor(a_value)
		SetSliderOptionValue(a_option, a_value, "{0} Hours", false)
	endIf
	
endEvent

; @implements SKI_ConfigBase
event OnOptionMenuOpen(int a_option)
	{Called when a menu option has been selected}

	if (a_option == _ActionFreshKill_OID_M)
		SetMenuDialogOptions(FreshActionStrings)
		SetMenuDialogStartIndex(dsGlobals.gActionFreshCarcass)
		SetMenuDialogDefaultIndex(0) ; Default action is Prompt

	elseIf (a_option == _ActionFreshKillSneak_OID_M)
		SetMenuDialogOptions(FreshActionStrings)
		SetMenuDialogStartIndex(dsGlobals.gActionFreshCarcassSneak)
		SetMenuDialogDefaultIndex(1) ; Default action is Pick up

	elseIf (a_option == _ActionCleanKill_OID_M)
		SetMenuDialogOptions(CleanActionStrings)
		SetMenuDialogStartIndex(dsGlobals.gActionCleanCarcass)
		SetMenuDialogDefaultIndex(0) ; Default action is Prompt

	elseIf (a_option == _ActionCleanKillSneak_OID_M)
		SetMenuDialogOptions(CleanActionStrings)
		SetMenuDialogStartIndex(dsGlobals.gActionCleanCarcassSneak)
		SetMenuDialogDefaultIndex(0) ; Default action is Prompt

	elseIf (a_option == _PresetPeltValue_OID_M)
		SetMenuDialogOptions(PeltValueStrings)
		SetMenuDialogStartIndex(dsGlobals.gPeltValue)
		SetMenuDialogDefaultIndex(1) ; Default value is Default

	elseIf (a_option == _PresetMeatValue_OID_M)
		SetMenuDialogOptions(MeatValueStrings)
		SetMenuDialogStartIndex(dsGlobals.gMeatValue)
		SetMenuDialogDefaultIndex(2) ; Default value is Default
		
	elseIf (a_option == _PresetMatAmount_OID_M)
		SetMenuDialogOptions(MatAmountStrings)
		SetMenuDialogStartIndex(dsGlobals.gMatAmount)
		SetMenuDialogDefaultIndex(0) ; Default yield is Low

	elseIf (a_option == _PresetMeatYield_OID_M)
		SetMenuDialogOptions(MeatYieldStrings)
		SetMenuDialogStartIndex(dsGlobals.gMeatYield)
		SetMenuDialogDefaultIndex(2) ; Default yield is Generous

	elseIf (a_option == _PresetKnifeSales_OID_M)
		SetMenuDialogOptions(KnifeSaleStrings)
		SetMenuDialogStartIndex(dsGlobals.gKnifeSales)
		SetMenuDialogDefaultIndex(0) ; Default availability is None (since Require Knives is now default False)

	elseIf (a_option == _Experience_OID_M)
		SetMenuDialogOptions(ExperienceStrings)
		SetMenuDialogStartIndex(_ExpResetTo)
		SetMenuDialogDefaultIndex(0)

	endIf

endEvent

; @implements SKI_ConfigBase
event OnOptionMenuAccept(int a_option, int a_index)
	{Called when a menu entry has been accepted}

	if (a_option == _ActionFreshKill_OID_M)
		dsGlobals.gActionFreshCarcass = a_index
		SetMenuOptionValue(_ActionFreshKill_OID_M, FreshActionStrings[a_index], false)

	elseIf (a_option == _ActionFreshKillSneak_OID_M)
		dsGlobals.gActionFreshCarcassSneak = a_index
		SetMenuOptionValue(_ActionFreshKillSneak_OID_M, FreshActionStrings[a_index], false)

	elseIf (a_option == _ActionCleanKill_OID_M)
		dsGlobals.gActionCleanCarcass = a_index
		SetMenuOptionValue(_ActionCleanKill_OID_M, CleanActionStrings[a_index], false)

	elseIf (a_option == _ActionCleanKillSneak_OID_M)
		dsGlobals.gActionCleanCarcassSneak = a_index
		SetMenuOptionValue(_ActionCleanKillSneak_OID_M, CleanActionStrings[a_index], false)

	elseIf (a_option == _PresetPeltValue_OID_M)
		_TogglePeltValue = True
		dsGlobals.gPeltValue = a_index
		SetMenuOptionValue(_PresetPeltValue_OID_M, PeltValueStrings[a_index], false)

	elseIf (a_option == _PresetMeatValue_OID_M)
		_ToggleMeatValue = True
		dsGlobals.gMeatValue = a_index
		SetMenuOptionValue(_PresetMeatValue_OID_M, MeatValueStrings[a_index], false)

	elseIf (a_option == _PresetMatAmount_OID_M)
		dsGlobals.gMatAmount = a_index
		SetMenuOptionValue(_PresetMatAmount_OID_M, MatAmountStrings[a_index], false)

	elseIf (a_option == _PresetMeatYield_OID_M)
		dsGlobals.gMeatYield = a_index
		SetMenuOptionValue(_PresetMeatYield_OID_M, MeatYieldStrings[a_index], false)
		int disableFlag
		If (a_index == 4)
			disableFlag = OPTION_FLAG_NONE
		Else
			disableFlag = OPTION_FLAG_DISABLED
		EndIf
		SetSliderOptionValue(_sliderMeatYield_OID_S, dsGlobals.gMeatYieldCustom, "{0}%", false)
		SetOptionFlags(_sliderMeatYield_OID_S, disableFlag, false)

	elseIf (a_option == _PresetKnifeSales_OID_M)
		_ToggleKnifeSales = True
		dsGlobals.gKnifeSales = a_index
		SetMenuOptionValue(_PresetKnifeSales_OID_M, KnifeSaleStrings[a_index], false)

	elseIf (a_option == _Experience_OID_M)
		If (a_index > 0)
			_ToggleExpReset = True
			_ExpResetTo = a_index
			SetTextOptionValue(_textExpReset_OID, "$_DS_HB_ExpResetExitNow", false)
		Else
			_ToggleExpReset = False
			SetTextOptionValue(_textExpReset_OID, "", false)
		EndIf
		SetMenuOptionValue(_Experience_OID_M, ExperienceStrings[a_index], false)

	endIf

endEvent

; @implements SKI_ConfigBase
event OnOptionColorOpen(int a_option)
	{Called when a color option has been selected}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionColorAccept(int a_option, int a_color)
	{Called when a new color has been accepted}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionKeyMapChange(int a_option, int a_keyCode, string a_conflictControl, string a_conflictName)
	{Called when a key has been remapped}
	
	DebugMode("OnOptionKeyMapChange a_option = " + a_option + " ; a_keyCode = " + a_keyCode + " ; a_conflictControl = " + a_conflictControl + " ; a_conflictName = " + a_conflictName)
	
	If (a_conflictControl != "")
		If (a_conflictName != "")
			ShowMessage("This key is already mapped to " + a_conflictControl + " in " + a_conflictName + ". Please choose a different key.",true,"$Yes","$No")
		Else
			ShowMessage("This key is already mapped to " + a_conflictControl + " in Skyrim. Please choose a different key.",true,"$Yes","$No")
		EndIf
		Return
	EndIf
	
	If (a_option == _hotkeyDress_OID)
		DebugMode("Registered to HotkeyDress.")
		dsGlobals.gHotkeyDress = a_keyCode
	ElseIf (a_option == _hotkeySkin_OID)
		DebugMode("Registered to HotkeySkin.")
		dsGlobals.gHotkeySkin = a_keyCode
	ElseIf (a_option == _hotkeyHarvest_OID)
		DebugMode("Registered to HotkeyHarvest.")
		dsGlobals.gHotkeyHarvest = a_keyCode
	ElseIf (a_option == _hotkeyButcher_OID)
		DebugMode("Registered to HotkeyButcher.")
		dsGlobals.gHotkeyButcher = a_keyCode
	ElseIf (a_option == _hotkeyProcess_OID)
		DebugMode("Registered to HotkeyProcess.")
		dsGlobals.gHotkeyProcess = a_keyCode
	ElseIf (a_option == _hotkeyForage_OID)
		DebugMode("Registered to HotkeyForage.")
		dsGlobals.gHotkeyForage = a_keyCode
	ElseIf (a_option == _hotkeyScrimshaw_OID)
		DebugMode("Registered to HotkeyScrimshaw.")
		dsGlobals.gHotkeyScrimshaw = a_keyCode
	ElseIf (a_option == _hotkeyTaxonomy_OID)
		DebugMode("Registered to HotkeyTaxonomy.")
		dsGlobals.gHotkeyTaxonomy = a_keyCode
	ElseIf (a_option == _hotkeySenseDirection_OID)
		DebugMode("Registered to HotkeySenseDirection.")
		dsGlobals.gHotkeySenseDirection = a_keyCode
	ElseIf (a_option == _hotkeyPrimitiveCooking_OID)
		DebugMode("Registered to HotkeyPrimitiveCooking.")
		dsGlobals.gHotkeyPrimitiveCooking = a_keyCode
	Else
		DebugMode("No matching registration.")
		Return
	EndIf

	RegisterForKey(a_keyCode)
	ForcePageReset()
	
endEvent

; @implements SKI_ConfigBase
Event OnConfigOpen()

	_HunterbornStarting				= false
	_HunterbornStopping				= false
	
	_ToggleCorpDragons				= false
	_ToggleSmallGame				= false
	_TogglePeltValue				= false
	_ToggleMeatValue				= false
	_ToggleKnifeSales				= false
	_ToggleReweighMeat				= false
	_ToggleKnife					= false
	_ToggleHideAbilities			= false
	_ToggleExpReset					= false
	_ToggleMonsterHunter			= false
	_ToggleConfig					= False
	_ToggleForaging					= False
	_ToggleScrimshaw				= False
	_TogglePrimCooking				= False
	_ToggleSenseDir					= False
	_ToggleBotany					= False
	_ToggleBounty					= False
	_ToggleSavageArrows				= False
	_ToggleTaxonomy					= False

	_ExpResetTo						= 0

EndEvent

; @implements SKI_ConfigBase
Event OnConfigClose()
	if (_HunterbornStarting && !dsGlobals.gHunterbornActive)
		dsMain.StartHunterborn()
	ElseIf (_HunterbornStopping && dsGlobals.gHunterbornActive)
		UnregisterForAllKeys()
		dsMain.StopHunterborn()
	ElseIf (dsGlobals.gHunterbornActive)
	
		; (Re-)Initialize DeathItem (LeveledItem's) to include / exclude the tokens.
		;
		If (_ToggleSmallGame)
			dsAnimals.InitDeathItems()
		EndIf

		; Same with corporeal dragons.
		;
		If (_ToggleCorpDragons)
			dsMonsters.InitDeathItems(!dsGlobals.gMonsterHunter)
		EndIf
		
		; (Re-)Stock merchants with hunting knives.
		;
		If (_ToggleKnifeSales)
			dsKnives.SetKnifeSales(0) ; This prevents accidentally adding stock
			If dsGlobals.gKnifeSales > 0
				dsKnives.SetKnifeSales(dsGlobals.gKnifeSales)
			EndIf
		EndIf
		
		dsActions.GetHuntingKnife(True)

		If _ToggleMonsterHunter
			dsMonsters.InitDeathItems(!dsGlobals.gMonsterHunter)
			If (dsGlobals.gMonsterHunter && !PlayerRef.HasPerk(CarcassMonsterPerk))
				PlayerRef.AddPerk(CarcassMonsterPerk)
			ElseIf (!dsGlobals.gMonsterHunter && PlayerRef.HasPerk(CarcassMonsterPerk))
				PlayerRef.RemovePerk(CarcassMonsterPerk)
			EndIf
		EndIf
		
		If (_ToggleHideAbilities)
			If (dsGlobals.gHotkey_HideAbilities)
				PlayerRef.RemoveSpell(ConfigSpell)
				PlayerRef.RemoveSpell(ForagingSpell)
				PlayerRef.RemoveSpell(ScrimshawSpell)
				PlayerRef.RemoveSpell(SenseDirSpell)
				PlayerRef.RemoveSpell(PrimCookingSpell)
				PlayerRef.RemoveSpell(TaxonomySpell)
			Else
				PlayerRef.AddSpell(ConfigSpell)
				PlayerRef.AddSpell(ForagingSpell)
				PlayerRef.AddSpell(ScrimshawSpell)
				PlayerRef.AddSpell(SenseDirSpell)
				PlayerRef.AddSpell(PrimCookingSpell)
				If (dsGlobals.gAddTaxonomy)
					PlayerRef.AddSpell(TaxonomySpell)
				EndIf
			EndIf
		EndIf
		
		; Manually set Total Cleans, Skin Level, Harvest Level.
		;
		If (_ToggleExpReset)
			If (_ExpResetTo == 1) ; Novice
				dsGlobals.gTotalCleans = 0
				dsGlobals.gSkinLevel = 0
				dsGlobals.gSkinExp = 0
				dsGlobals.gHarvestLevel = 0
				dsGlobals.gHarvestExp = 0
				dsGlobals.gForageLevel = 0
				dsGlobals.gForageExp = 0
			ElseIf (_ExpResetTo == 2) ; Apprentice
				dsGlobals.gTotalCleans = 10
				dsGlobals.gSkinLevel = 2
				dsGlobals.gSkinExp = 500
				dsGlobals.gHarvestLevel = 1
				dsGlobals.gHarvestExp = 500
				dsGlobals.gForageLevel = 2
				dsGlobals.gForageExp = 500
			ElseIf (_ExpResetTo == 3) ; Adept
				dsGlobals.gTotalCleans = 20
				dsGlobals.gSkinLevel = 5
				dsGlobals.gSkinExp = 1000
				dsGlobals.gHarvestLevel = 3
				dsGlobals.gHarvestExp = 1000
				dsGlobals.gForageLevel = 3
				dsGlobals.gForageExp = 1000
			ElseIf (_ExpResetTo == 4) ; Expert
				dsGlobals.gTotalCleans = 50
				dsGlobals.gSkinLevel = 8
				dsGlobals.gSkinExp = 2500
				dsGlobals.gHarvestLevel = 5
				dsGlobals.gHarvestExp = 2500
				dsGlobals.gForageLevel = 6
				dsGlobals.gForageExp = 2500
			ElseIf (_ExpResetTo == 5) ; Master
				dsGlobals.gTotalCleans = 150
				dsGlobals.gSkinLevel = 10
				dsGlobals.gSkinExp = 5000
				dsGlobals.gHarvestLevel = 10
				dsGlobals.gHarvestExp = 7500
				dsGlobals.gForageLevel = 10
				dsGlobals.gForageExp = 6200
			EndIf
		EndIf
		
		; All the Enable- modules.
		;
		ToggleSpell(_ToggleConfig, ConfigSpell, dsGlobals.gEnableConfig)
		ToggleSpell(_ToggleForaging, ForagingSpell, dsGlobals.gEnableForaging)
		ToggleSpell(_TogglePrimCooking, PrimCookingSpell, dsGlobals.gEnablePrimitiveCooking)
		ToggleSpell(_ToggleScrimshaw, ScrimshawSpell, dsGlobals.gEnableScrimshaw)
		ToggleSpell(_ToggleSenseDir, SenseDirSpell, dsGlobals.gEnableSenseDirection)
		TogglePerk(_ToggleBotany, BotanyPerk, dsGlobals.gEnableBotanyPerk)
		TogglePerk(_ToggleBounty, BountyPerk, dsGlobals.gEnableBountyPerk)
		TogglePerk(_ToggleSavageArrows, SavageArrowsPerk, dsGlobals.gEnableSavageArrows)
		ToggleSpell(_ToggleTaxonomy, TaxonomySpell, dsGlobals.gAddTaxonomy)
		
		If (dsGlobals.gDoInitStuff)
			Debug.Notification("Hunterborn is reapplying its templates...")
			dsMain.DoInitStuff()
			Debug.Notification("Hunterborn is done reapplying templates.")
		EndIf
		
		; Why you eat the bowl stupid!?
		; Makes it so when you eat soup you get the bowl back
		If (!dsGlobals.gSoupReturnBowl)
			dsGlobals.gSoupReturnBowl = 1
		EndIf
		
		; FakeUpdate has extra init-type stuff. Mostly just for dev use to get around needing a clean save for certain things.
		; It only runs if _DS_Hunterborn_FakeUpdate is True.
		dsMain.FakeUpdate()
		
		; Workaround in case CritSection somehow gets stuck.
		dsMain.ReleaseCritSection()
		
		; Disables Hunting In Skyrim Skinning System
		If (dsGlobals.gUseHiSCompatibility && dsGlobals.isHiSLoaded)
			dsActions.DisableHiSSkinning()
		endIf

	EndIf
	
EndEvent

function OnBackupRequest(int jMod)
    dsGlobals.BackupValues(jMod)
endfunction

function OnRestoreRequest(int jMod)
    dsGlobals.RestoreValues(jMod)
endfunction


; FUNCTIONS ---------------------------------------------------------------------------------------

Function ToggleSpell(Bool abToggled, Spell akSpell, Bool abEnabled)

	If !abToggled
	
	ElseIf abEnabled
		PlayerRef.AddSpell(akSpell)
	Else
		PlayerRef.RemoveSpell(akSpell)
	EndIf

EndFunction

Function TogglePerk(Bool abToggled, Perk akPerk, Bool abEnabled)

	If !abToggled
	
	ElseIf abEnabled
		PlayerRef.AddPerk(akPerk)	
	Else
		PlayerRef.RemovePerk(akPerk)
	EndIf

EndFunction

string Function GetCustomControl(int keyCode)

	; Does not support $ localization strings, lame. :(

	DebugMode("GetCustomControl = " + keyCode)
	
	If (keyCode == dsGlobals.gHotkeyDress)
		Return "Field Dress"
	ElseIf (keyCode == dsGlobals.gHotkeySkin)
		Return "Skin"
	ElseIf (keyCode == dsGlobals.gHotkeyHarvest)
		Return "Harvest"
	ElseIf (keyCode == dsGlobals.gHotkeyButcher)
		Return "Butcher"
	ElseIf (keyCode == dsGlobals.gHotkeyProcess)
		Return "Process"
	ElseIf (keyCode == dsGlobals.gHotkeyForage)
		Return "Forage"
	ElseIf (keyCode == dsGlobals.gHotkeyScrimshaw)
		Return "Scrimshaw"
	ElseIf (keyCode == dsGlobals.gHotkeyTaxonomy)
		Return "Taxonomy"
	ElseIf (keyCode == dsGlobals.gHotkeySenseDirection)
		Return "Sense Direction"
	ElseIf (keyCode == dsGlobals.gHotkeyPrimitiveCooking)
		Return "Primitive Cooking"
	Else
		Return ""
	EndIf
	
endFunction

string Function GetHBVersion()

	; The minor can be updated without a clean save.
	string MinorVer = ".6.2"
	
	Return HBVersion + MinorVer

EndFunction

Function SetOptionFlagsForMonsters()

	int disableFlag

	If (dsGlobals.gMonsterHunter)
		disableFlag = OPTION_FLAG_NONE
	Else
		disableFlag = OPTION_FLAG_DISABLED
	EndIf
	SetOptionFlags(_toggleMonster_Chaurus_OID_B, disableFlag, false)
	SetOptionFlags(_toggleMonster_Spiders_OID_B, disableFlag, false)
;	SetOptionFlags(_toggleMonster_Spriggans_OID_B, disableFlag, false)
	SetOptionFlags(_toggleMonster_Trolls_OID_B, disableFlag, false)
	SetOptionFlags(_toggleMonster_Werewolves_OID_B, disableFlag, false)
	SetOptionFlags(_toggleMonster_Dragons_OID_B, disableFlag, false)
	
	If (dsGlobals.gMonsterHunter && dsGlobals.gIncludeMonsterDragons)
		disableFlag = OPTION_FLAG_NONE
	Else
		disableFlag = OPTION_FLAG_DISABLED
	EndIf
	SetOptionFlags(_toggleDragonsCorporeal_OID_B, disableFlag, false)
	
EndFunction

; HOTKEY HANDLING ---------------------------------------------------------------------------------

Event OnKeyUp(int keyCode, float holdTime)

	DebugMode("OnKeyUp = " + keyCode)
	
	If (!dsGlobals.gHunterbornActive)
		UnregisterForAllKeys()
		Return
	EndIf
	
	If (UI.IsMenuOpen("Console") || Utility.IsInMenuMode() || PlayerRef.GetSitState() != 0)
		DebugMode("Ignored, player is in a menu or seated.")
		Return
		
	ElseIf (keyCode == dsGlobals.gHotkeyDress)
		hkFieldDress.Cast(PlayerRef)
	ElseIf (keyCode == dsGlobals.gHotkeySkin)
		hkSkin.Cast(PlayerRef)
	ElseIf (keyCode == dsGlobals.gHotkeyHarvest)
		hkHarvest.Cast(PlayerRef)
	ElseIf (keyCode == dsGlobals.gHotkeyButcher)
		hkButcher.Cast(PlayerRef)
	ElseIf (keyCode == dsGlobals.gHotkeyProcess)
		hkProcess.Cast(PlayerRef)
	ElseIf (keyCode == dsGlobals.gHotkeyForage)
		If (dsGlobals.gEnableForaging)
			ForagingSpell.Cast(PlayerRef)
		EndIf
	ElseIf (keyCode == dsGlobals.gHotkeyScrimshaw)
		If (dsGlobals.gEnableScrimshaw)
			ScrimshawSpell.Cast(PlayerRef)
		EndIf
	ElseIf (keyCode == dsGlobals.gHotkeyTaxonomy)
		If (dsGlobals.gAddTaxonomy)
			TaxonomySpell.Cast(PlayerRef)
		EndIf
	ElseIf (keyCode == dsGlobals.gHotkeySenseDirection)
		If (dsGlobals.gEnableSenseDirection)
			SenseDirSpell.Cast(PlayerRef)
		EndIf
	ElseIf (keyCode == dsGlobals.gHotkeyPrimitiveCooking)
		If (dsGlobals.gEnablePrimitiveCooking)
			PrimCookingSpell.Cast(PlayerRef)
		EndIf
	Else
		DebugMode("Key not recognized. Unregistering.")
		UnregisterForKey(keyCode)
	
	EndIf

EndEvent


; -- DebugMode
;
Function DebugMode(string sMsg)
	If dsGlobals.gDebugMode
		Debug.Trace("HUNTERBORN DEBUG :: " + sMsg)
	EndIf
EndFunction

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction
