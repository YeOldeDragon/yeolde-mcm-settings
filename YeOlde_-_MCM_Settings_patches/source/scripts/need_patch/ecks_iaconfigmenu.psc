Scriptname Ecks_IAConfigMenu extends SKI_ConfigBase

Actor Property PlayerRef  Auto

Ecks_IADistributionScript Property IAAdminQuest  Auto

FormList Property IAChanceNoneArmorList  Auto
FormList Property IAChanceNoneShieldList  Auto
FormList Property IACraftingToggleArmorList  Auto
FormList Property IACraftingToggleShieldList  Auto

GlobalVariable Property IACNGlacialCrystal  Auto
GlobalVariable Property IACNRedguardKnight  Auto
GlobalVariable Property IACNVvardenfellGlass  Auto

GlobalVariable Property IADTAfflicted  Auto
GlobalVariable Property IADTAlikr  Auto
GlobalVariable Property IADTBandit  Auto
GlobalVariable Property IADTBattlemage  Auto
GlobalVariable Property IADTDraugr  Auto
GlobalVariable Property IADTForsworn  Auto
GlobalVariable Property IADTHunter  Auto
GlobalVariable Property IADTKhajiit  Auto
GlobalVariable Property IADTOrc  Auto
GlobalVariable Property IADTRobber  Auto
GlobalVariable Property IADTSeadog  Auto
GlobalVariable Property IADTSoldier  Auto
GlobalVariable Property IADTThalmor  Auto
GlobalVariable Property IADTVampire  Auto
GlobalVariable Property IADTVigilant  Auto
GlobalVariable Property IADTWarlock  Auto
GlobalVariable Property IADTCreatures  Auto

GlobalVariable Property IAGAlternateStart  Auto
GlobalVariable Property IAGBreakdown  Auto
GlobalVariable Property IAGConfigBusy  Auto
GlobalVariable Property IAGGuardHelms  Auto
GlobalVariable Property IAGMenuPosition  Auto
GlobalVariable Property IAGNPCArmor  Auto
GlobalVariable Property IAGRemoveSpell  Auto
GlobalVariable Property IAGVendors  Auto
GlobalVariable Property IAGNoQuestCrafting  Auto

GlobalVariable Property IAVCNArmorFurHoodHeavy  Auto
GlobalVariable Property IAVCNArmorFurHoodLight  Auto
GlobalVariable Property IAVCNBoiledChitinHeavy  Auto
GlobalVariable Property IAVCNBoiledChitinLight  Auto
GlobalVariable Property IAVCNDragonhideHeavy  Auto
GlobalVariable Property IAVCNDragonhideLight  Auto
GlobalVariable Property IAVCNDragonhideUnarmored  Auto
GlobalVariable Property IAVCNDwarvenMageHeavy  Auto
GlobalVariable Property IAVCNDwarvenMageLight  Auto
GlobalVariable Property IAVCNDwarvenMageUnarmored  Auto
GlobalVariable Property IAVCNEbonyMageHeavy  Auto
GlobalVariable Property IAVCNEbonyMageLight  Auto
GlobalVariable Property IAVCNEbonyMageUnarmored  Auto
GlobalVariable Property IAVCNGildergreenAegisHeavy  Auto
GlobalVariable Property IAVCNGildergreenAegisLight  Auto
GlobalVariable Property IAVCNGlacialCrystalHeavy  Auto
GlobalVariable Property IAVCNGlacialCrystalLight  Auto
GlobalVariable Property IAVCNMantleSilverHandHeavy  Auto
GlobalVariable Property IAVCNMantleSilverHandLight  Auto
GlobalVariable Property IAVCNPrimitiveNordHeavy  Auto
GlobalVariable Property IAVCNPrimitiveNordLight  Auto
GlobalVariable Property IAVCNRedguardKnightHeavy  Auto
GlobalVariable Property IAVCNRedguardKnightLight  Auto
GlobalVariable Property IAVCNShamanLight  Auto
GlobalVariable Property IAVCNShamanUnarmored  Auto
GlobalVariable Property IAVCNShieldJorrvaskrHeavy  Auto
GlobalVariable Property IAVCNShieldJorrvaskrLight  Auto
GlobalVariable Property IAVCNShieldTargetHeavy  Auto
GlobalVariable Property IAVCNShieldTargetLight  Auto
GlobalVariable Property IAVCNSpellbinderCrimson  Auto
GlobalVariable Property IAVCNSpellbinderRunic  Auto
GlobalVariable Property IAVCNTribunalHeavy  Auto
GlobalVariable Property IAVCNTribunalLight  Auto
GlobalVariable Property IAVCNTribunalUnarmored  Auto
GlobalVariable Property IAVCNWarchiefHeavy  Auto
GlobalVariable Property IAVCNWarchiefLight  Auto

GlobalVariable Property IAVTArmorFurHood  Auto
GlobalVariable Property IAVTEinherjarBrigandine  Auto
GlobalVariable Property IAVTEinherjarPlate  Auto
GlobalVariable Property IAVTFurHoodColor  Auto
GlobalVariable Property IAVTFurHoodScarf  Auto
GlobalVariable Property IAVTNordMailHauberk  Auto
GlobalVariable Property IAVTNordMailShirt  Auto
GlobalVariable Property IAVTSpellbinder  Auto
GlobalVariable Property IAVTTribunalColor  Auto
GlobalVariable Property IAVTVagabond  Auto

GlobalVariable Property IAWTBoiledChitin  Auto
GlobalVariable Property IAWTBosmer  Auto
GlobalVariable Property IAWTDragonEbon  Auto
GlobalVariable Property IAWTDragonhideRobe  Auto
GlobalVariable Property IAWTDragonKnight  Auto
GlobalVariable Property IAWTDwarvenMageRobe  Auto
GlobalVariable Property IAWTEbonyMageRobe  Auto
GlobalVariable Property IAWTGildergreenAegis  Auto
GlobalVariable Property IAWTGlacialCrystal  Auto
GlobalVariable Property IAWTMantleSilverHand  Auto
GlobalVariable Property IAWTPrimitiveNord  Auto
GlobalVariable Property IAWTRedguardKnight  Auto
GlobalVariable Property IAWTShamanRobe  Auto
GlobalVariable Property IAWTShieldJorrvaskr  Auto
GlobalVariable Property IAWTShieldTarget  Auto
GlobalVariable Property IAWTTribunalRobe  Auto
GlobalVariable Property IAWTWarchief  Auto

Spell Property IASpellConfig  Auto

GlobalVariable[] IAChanceNoneArmor
GlobalVariable[] IAChanceNoneShield
GlobalVariable[] IACraftingToggleArmor
GlobalVariable[] IACraftingToggleShield

;OIDs (T:Text B:Bool S:Slider M:Menu, C:Color, K:Key)

Int[] CraftingArmorOID_B
Int[] CraftingShieldOID_B
Int[] DistributionArmorOID_B
Int[] DistributionShieldOID_B

Int DistributionFlag
Int ThalmorDistributionFlag

Int IADTAfflictedOID_B
Int IADTAlikrOID_B
Int IADTBanditOID_B
Int IADTBattlemageOID_B
Int IADTDraugrOID_B
Int IADTForswornOID_B
Int IADTHunterOID_B
Int IADTKhajiitOID_B
Int IADTOrcOID_B
Int IADTRobberOID_B
Int IADTSeadogOID_B
Int IADTSoldierOID_B
Int IADTThalmorOID_B
Int IADTVampireOID_B
Int IADTVigilantOID_B
Int IADTWarlockOID_B
Int IADTCreaturesOID_B

Int IAGBreakdownOID_B
Int IAGGuardHelmsOID_B
Int IAGNPCArmorOID_B
Int IAGVendorsOID_B
Int IAGAlternateStartOID_B
Int IAGNoQuestCraftingOID_B
Int IAVTArmorFurHoodOID_B
Int IAVTArmorFurHoodOID_T
Int IAVTEinherjarBrigandineOID_T
Int IAVTEinherjarPlateOID_T
Int IAVTFurHoodScarfOID_B
Int IAVTFurHoodColorOID_T
Int IAVTNordMailHauberkOID_T
Int IAVTNordMailShirtOID_T
Int IAVTSpellbinderOID_T
Int IAVTTribunalColorOID_T
Int IAVTVagabondOID_T

Int IAWTArmorFurHoodOID_T
Int IAWTBoiledChitinOID_T
Int IAWTBosmerOID_T
Int IAWTDragonEbonOID_T
Int IAWTDragonhideRobeOID_T
Int IAWTDragonKnightOID_T
Int IAWTDwarvenMageRobeOID_T
Int IAWTEbonyMageRobeOID_T
Int IAWTGildergreenAegisOID_T
Int IAWTGlacialCrystalOID_T
Int IAWTMantleSilverHandOID_T
Int IAWTPrimitiveNordOID_T
Int IAWTRedguardKnightOID_T
Int IAWTShamanRobeOID_T
Int IAWTShieldJorrvaskrOID_T
Int IAWTShieldTargetOID_T
Int IAWTTribunalRobeOID_T
Int IAWTWarchiefOID_T

String[] ArmorName
String[] ArmorWeight
String[] BlackPlainWhite
String[] CrimsonDusk
String[] CrimsonRunic
String[] DarkLight
String[] FullFox
String[] HelmetHood
String[] HelmetSpectacle
String[] LooseTight
String[] OpenClosed
String[] ShieldName
String[] SleekShieldDouble
String[] TribunalColor

Event OnConfigInit ()

ModName = "$Immersive Armors"

CraftingArmorOID_B = New Int[56]
CraftingShieldOID_B = New Int[28]
DistributionArmorOID_B = New Int[56]
DistributionShieldOID_B = New Int[28]

IAChanceNoneArmor = New GlobalVariable[56]
IAChanceNoneShield = New GlobalVariable[28]
IACraftingToggleArmor = New GlobalVariable[56]
IACraftingToggleShield = New GlobalVariable[28]

If IAGNPCArmor.GetValue()
	DistributionFlag = OPTION_FLAG_NONE
Else
	DistributionFlag = OPTION_FLAG_DISABLED
EndIf

Int i = 1
While i < 56
	IAChanceNoneArmor[i] = IAChanceNoneArmorList.GetAt(i - 1) as GlobalVariable
	IACraftingToggleArmor[i] = IACraftingToggleArmorList.GetAt(i - 1) as GlobalVariable
	i += 1
EndWhile
i = 1
While i < 28
	IAChanceNoneShield[i] = IAChanceNoneShieldList.GetAt(i - 1) as GlobalVariable
	IACraftingToggleShield[i] = IACraftingToggleShieldList.GetAt(i - 1) as GlobalVariable
	i += 1
EndWhile

Pages = New String[3]
Pages[0] = "$Armor Options"
Pages[1] = "$Shield Options"
Pages[2] = "$Extra Options"

ArmorName = New String[56]
ArmorName[1] = "$Akaviri Samurai Armor"
ArmorName[2] = "$Alduin Scale Armor"
ArmorName[3] = "$Apotheus Armor"
ArmorName[4] = "$Armored Fur Hoods"
ArmorName[5] = "$Bandanas"
ArmorName[6] = "$Barbarian Armor"
ArmorName[7] = "$Barbarian Hero Armor"
ArmorName[8] = "$Boiled Chitin Armor"
ArmorName[9] = "$Bosmer Armor"
ArmorName[10] = "$Bosmer Engraved Armor"
ArmorName[11] = "$Bosmer Wild Hunt Heavy Armor"
ArmorName[12] = "$Bosmer Wild Hunt Light Armor"
ArmorName[13] = "$Brigand Armors"
ArmorName[14] = "$Crimson Archer Armor"
ArmorName[15] = "$Daedric Lord Armor"
ArmorName[16] = "$Dragonbone Ebonsteel Armor"
ArmorName[17] = "$Dragonhide Robe"
ArmorName[18] = "$Dragon Knight Armor"
ArmorName[19] = "$Dwarven Mage Robe"
ArmorName[20] = "$Ebony Mage Robe"
ArmorName[21] = "$Einherjar Brigandine Armor"
ArmorName[22] = "$Einherjar Plate Armor"
ArmorName[23] = "$Falkreath Armor"
ArmorName[24] = "$Fur Collar"
ArmorName[25] = "$Fur Hoods"
ArmorName[26] = "$Glacial Crystal Armor"
ArmorName[27] = "$Hedge Knight Armor"
ArmorName[28] = "$Heroic Imperial Armor"
ArmorName[29] = "$Heroic Stormcloak Armor"
ArmorName[30] = "$Hunter Armor"
ArmorName[31] = "$Imperial Knight Armor"
ArmorName[32] = "$Mantle of the Silver Hand"
ArmorName[33] = "$Mercenary Armor"
ArmorName[34] = "$Nord Mail Hauberk"
ArmorName[35] = "$Nord Mail Shirt"
ArmorName[36] = "$Orcish Masked Helm"
ArmorName[37] = "$Paladin Armor"
ArmorName[38] = "$Primitive Nord Armor"
ArmorName[39] = "$Ranger Armor"
ArmorName[40] = "$Redguard Knight Mail"
ArmorName[41] = "$Ringmail Armor"
ArmorName[42] = "$Ritual Boethiah Armor"
ArmorName[43] = "$Seadog Armor"
ArmorName[44] = "$Shaman Robe"
ArmorName[45] = "$Snow Bear Armor"
ArmorName[46] = "$Spellbinder Plate Armor"
ArmorName[47] = "$Stormlord Armor"
ArmorName[48] = "$Tribunal Masks"
ArmorName[49] = "$Tribunal Robes"
ArmorName[50] = "$Trollbane Armor"
ArmorName[51] = "$Vagabond Armor"
ArmorName[52] = "$Vanguard Plate Armor"
ArmorName[53] = "$Vvardenfell Glass Armor"
ArmorName[54] = "$Warchief Bulwark"
ArmorName[55] = "$Witchplate Armor"

ArmorWeight = New String[3]
ArmorWeight[0] = "$Heavy Armor"
ArmorWeight[1] = "$Light Armor"
ArmorWeight[2] = "$Unarmored"

BlackPlainWhite = New String[3]
BlackPlainWhite[0] = "$Black"
BlackPlainWhite[1] = "$Plain"
BlackPlainWhite[2] = "$White"

CrimsonDusk = New String[2]
CrimsonDusk[0] = "$Crimson"
CrimsonDusk[1] = "$Dusk"

CrimsonRunic = New String[2]
CrimsonRunic[0] = "$Crimson"
CrimsonRunic[1] = "$Runic"

DarkLight = New String[2]
DarkLight[0] = "$Dark Fur"
DarkLight[1] = "$Light Fur"

HelmetHood = New String[2]
HelmetHood[0] = "$Helmet"
HelmetHood[1] = "$Hood"

HelmetSpectacle = New String[2]
HelmetSpectacle[0] = "$Helmet"
HelmetSpectacle[1] = "$Spectacle Helm"

ShieldName = New String[28]
ShieldName[1] = "$Bucklers"
ShieldName[2] = "$Faction Shields"
ShieldName[3] = "$Gildergreen Aegis"
ShieldName[4] = "$Nordic Shields Set"
ShieldName[5] = "$Painted Spiked Targes"
ShieldName[6] = "$Painted Hide Shields"
ShieldName[7] = "$Painted Iron Shields"
ShieldName[8] = "$Jorrvaskr Shields"
ShieldName[9] = "$Heavy Painted Kite Shields"
ShieldName[10] = "$Light Painted Kite Shields"
ShieldName[11] = "$Heavy Spiked Kite Shields"
ShieldName[12] = "$Light Spiked Kite Shields"
ShieldName[13] = "$Heavy Splinted Kite Shields"
ShieldName[14] = "$Light Splinted Kite Shields"
ShieldName[15] = "$Heavy Painted Body Shields"
ShieldName[16] = "$Light Painted Body Shields"
ShieldName[17] = "$Heavy Spiked Body Shields"
ShieldName[18] = "$Light Spiked Body Shields"
ShieldName[19] = "$Heavy Splinted Body Shields"
ShieldName[20] = "$Light Splinted Body Shields"
ShieldName[21] = "$Heavy Painted Round Shields"
ShieldName[22] = "$Light Painted Round Shields"
ShieldName[23] = "$Heavy Spiked Round Shields"
ShieldName[24] = "$Light Spiked Round Shields"
ShieldName[25] = "$Heavy Splinted Round Shields"
ShieldName[26] = "$Light Splinted Round Shields"
ShieldName[27] = "$Target Shields"

TribunalColor = New String[5]
TribunalColor[0] = "$Black"
TribunalColor[1] = "$Blue"
TribunalColor[2] = "$Green"
TribunalColor[3] = "$Red"
TribunalColor[4] = "$White"

EndEvent

Event OnPageReset (String MenuPage)

If MenuPage == ""
	LoadCustomContent("SkyUI/IA/ImmersiveArmors.dds", 0, 2)
	Return
ElseIf IAGConfigBusy.GetValue()
	LoadCustomContent("SkyUI/IA/ImmersiveArmors.dds", 0, 2)
	SetTitleText("$Configuration Busy")
	Return
Else
	UnloadCustomContent()
EndIf

If MenuPage == "$Armor Options"
	SetCursorFillMode (1)
	AddHeaderOption ("$Crafting")
	AddHeaderOption ("$Distribution")
	Int i = 1
	While i < 56
		CraftingArmorOID_B[i] = AddToggleOption(ArmorName[i], (IACraftingToggleArmor[i].GetValue() as Bool) )
		DistributionArmorOID_B[i] = AddToggleOption("------------------------------------------------------------------------", !(IAChanceNoneArmor[i].GetValue() as Bool) )
		i += 1
	EndWhile
ElseIf MenuPage == "$Shield Options"
	SetCursorFillMode (1)
	AddHeaderOption ("$Crafting")
	AddHeaderOption ("$Distribution")
	Int i = 1
	While i < 28
		CraftingShieldOID_B[i] = AddToggleOption(ShieldName[i], (IACraftingToggleShield[i].GetValue() as Bool) )
		DistributionShieldOID_B[i] = AddToggleOption("------------------------------------------------------------------------", !(IAChanceNoneShield[i].GetValue() as Bool) )
		i += 1
	EndWhile
ElseIf MenuPage == "$Extra Options"
	SetCursorFillMode (2)
	AddHeaderOption ("$Armor Type")
	IAWTArmorFurHoodOID_T = AddTextOption("$Armored Fur Hoods", ArmorWeight[(IAVTArmorFurHood.GetValue() as Int) / 6 ])
	IAWTBoiledChitinOID_T = AddTextOption("$Boiled Chitin Armor", ArmorWeight[IAWTBoiledChitin.GetValue() as Int])
	IAWTBosmerOID_T = AddTextOption("$Bosmer Armor", ArmorWeight[IAWTBosmer.GetValue() as Int])
	IAWTDragonEbonOID_T = AddTextOption("$Dragonbone Ebonsteel Armor", ArmorWeight[IAWTDragonEbon.GetValue() as Int])
	IAWTDragonKnightOID_T = AddTextOption("$Dragon Knight Armor", ArmorWeight[IAWTDragonKnight.GetValue() as Int])
	IAWTGildergreenAegisOID_T = AddTextOption("$Gildergreen Aegis", ArmorWeight[IAWTGildergreenAegis.GetValue() as Int])
	IAWTGlacialCrystalOID_T = AddTextOption("$Glacial Crystal Armor", ArmorWeight[IAWTGlacialCrystal.GetValue() as Int])
	IAWTShieldJorrvaskrOID_T = AddTextOption("$Jorrvaskr Shields", ArmorWeight[IAWTShieldJorrvaskr.GetValue() as Int])
	IAWTMantleSilverHandOID_T = AddTextOption("$Mantle of the Silver Hand", ArmorWeight[IAWTMantleSilverHand.GetValue() as Int])
	IAWTPrimitiveNordOID_T = AddTextOption("$Primitive Nord Armor", ArmorWeight[IAWTPrimitiveNord.GetValue() as Int])
	IAWTRedguardKnightOID_T = AddTextOption("$Redguard Knight Mail", ArmorWeight[IAWTRedguardKnight.GetValue() as Int])
	IAWTShieldTargetOID_T = AddTextOption("$Target Shields", ArmorWeight[IAWTShieldTarget.GetValue() as Int])
	IAWTWarchiefOID_T = AddTextOption("$Warchief Bulwark", ArmorWeight[IAWTWarchief.GetValue() as Int])
	AddHeaderOption ("$Robe Type")
	IAWTDragonhideRobeOID_T = AddTextOption("$Dragonhide Robe", ArmorWeight[IAWTDragonhideRobe.GetValue() as Int])
	IAWTDwarvenMageRobeOID_T = AddTextOption("$Dwarven Mage Robe", ArmorWeight[IAWTDwarvenMageRobe.GetValue() as Int])
	IAWTEbonyMageRobeOID_T = AddTextOption("$Ebony Mage Robe", ArmorWeight[IAWTEbonyMageRobe.GetValue() as Int])
	IAWTShamanRobeOID_T = AddTextOption("$Shaman Robe", ArmorWeight[IAWTShamanRobe.GetValue() as Int])
	IAWTTribunalRobeOID_T = AddTextOption("$Tribunal Robes", ArmorWeight[IAWTTribunalRobe.GetValue() as Int])
	AddHeaderOption ("$Tribunal Robe Style")
	IAVTTribunalColorOID_T = AddTextOption("$Tribunal Robe Color", TribunalColor[IAVTTribunalColor.GetValue() as Int])
	AddHeaderOption ("$Armor Variations")
	IAVTEinherjarBrigandineOID_T = AddTextOption("$Einherjar Brigandine Armor", DarkLight[IAVTEinherjarBrigandine.GetValue() as Int])
	IAVTEinherjarPlateOID_T = AddTextOption("$Einherjar Plate Armor", DarkLight[IAVTEinherjarPlate.GetValue() as Int])
	IAVTNordMailHauberkOID_T = AddTextOption("$Nord Mail Hauberk", HelmetSpectacle[IAVTNordMailHauberk.GetValue() as Int])
	IAVTNordMailShirtOID_T = AddTextOption("$Nord Mail Shirt", HelmetSpectacle[IAVTNordMailShirt.GetValue() as Int])
	IAVTSpellbinderOID_T = AddTextOption("$Spellbinder Plate Armor", CrimsonRunic[IAVTSpellbinder.GetValue() as Int])
	IAVTVagabondOID_T = AddTextOption("$Vagabond Armor", CrimsonDusk[IAVTVagabond.GetValue() as Int])
	SetCursorPosition(1)
	AddHeaderOption ("$General Mod Options")
	IAGBreakdownOID_B = AddToggleOption("$Breakdown Armors", IAGBreakdown.GetValue() as Bool)
	IAGVendorsOID_B = AddToggleOption("$Armors for Sale", IAGVendors.GetValue() as Bool)
	IAGAlternateStartOID_B = AddToggleOption("$Alternate Start", IAGAlternateStart.GetValue() as Bool)
	IAGNoQuestCraftingOID_B = AddToggleOption("$Crafting Without Questing", IAGNoQuestCrafting.GetValue() as Bool)
	IADTCreaturesOID_B = AddToggleOption("$Creatures Distribution", IADTCreatures.GetValue() as Bool)
	AddHeaderOption ("$Special Distribution Options")
	IAGNPCArmorOID_B = AddToggleOption("$NPC Armor use", IAGNPCArmor.GetValue() as Bool)
	IAGGuardHelmsOID_B = AddToggleOption("$Varied Guard Helmets", IAGGuardHelms.GetValue() as Bool, DistributionFlag)
	IADTAfflictedOID_B = AddToggleOption("$Afflicted Distribution", IADTAfflicted.GetValue() as Bool, DistributionFlag)
	IADTAlikrOID_B = AddToggleOption("$Alikr Distribution", IADTAlikr.GetValue() as Bool, DistributionFlag)
	IADTBanditOID_B = AddToggleOption("$Bandit Distribution", IADTBandit.GetValue() as Bool, DistributionFlag)
	IADTBattlemageOID_B = AddToggleOption("$Battlemage Distribution", IADTBattlemage.GetValue() as Bool, DistributionFlag)
	IADTDraugrOID_B = AddToggleOption("$Draugr Distribution", IADTDraugr.GetValue() as Bool, DistributionFlag)
	IADTForswornOID_B = AddToggleOption("$Forsworn Distribution", IADTForsworn.GetValue() as Bool, DistributionFlag)
	IADTHunterOID_B = AddToggleOption("$Hunter Distribution", IADTHunter.GetValue() as Bool, DistributionFlag)
	IADTKhajiitOID_B = AddToggleOption("$Khajiit Distribution", IADTKhajiit.GetValue() as Bool, DistributionFlag)
	IADTOrcOID_B = AddToggleOption("$Orc Distribution", IADTOrc.GetValue() as Bool, DistributionFlag)
	IADTRobberOID_B = AddToggleOption("$Robber Distribution", IADTRobber.GetValue() as Bool, DistributionFlag)
	IADTSeadogOID_B = AddToggleOption("$Seadog Distribution", IADTSeadog.GetValue() as Bool, DistributionFlag)
	IADTSoldierOID_B = AddToggleOption("$Soldier Distribution", IADTSoldier.GetValue() as Bool, DistributionFlag)
	If DistributionFlag || (IACNGlacialCrystal.GetValue() && IACNVvardenfellGlass.GetValue())
		ThalmorDistributionFlag = 1
	Else
		ThalmorDistributionFlag = 0
	EndIf
	IADTThalmorOID_B = AddToggleOption("$Thalmor Distribution", IADTThalmor.GetValue() as Bool, ThalmorDistributionFlag)
	IADTVampireOID_B = AddToggleOption("$Vampire Distribution", IADTVampire.GetValue() as Bool, DistributionFlag)
	IADTVigilantOID_B = AddToggleOption("$Vigilant Distribution", IADTVigilant.GetValue() as Bool, DistributionFlag)
	IADTWarlockOID_B = AddToggleOption("$Warlock Distribution", IADTWarlock.GetValue() as Bool, DistributionFlag)

	AddHeaderOption ("$Special Variants")
	If IAVTArmorFurHood.GetValue() < 6
		IAVTArmorFurHoodOID_T = AddTextOption("$Armored Fur Hood Color", BlackPlainWhite[(IAVTArmorFurHood.GetValue() as Int) / 2 ])
	Else
		IAVTArmorFurHoodOID_T = AddTextOption("$Armored Fur Hood Color", BlackPlainWhite[((IAVTArmorFurHood.GetValue() as Int) - 6 ) / 2 ])
	EndIf
	If (IAVTArmorFurHood.GetValue()/2) as Int == ((IAVTArmorFurHood.GetValue() + 1)/2) as Int
		IAVTArmorFurHoodOID_B = AddToggleOption("$Armored Fur Mantle Version", false)
	Else
		IAVTArmorFurHoodOID_B = AddToggleOption("$Armored Fur Mantle Version", true)
	EndIf
	IAVTFurHoodColorOID_T = AddTextOption("$Fur Hood Color", BlackPlainWhite[IAVTFurHoodColor.GetValue() as Int])
	IAVTFurHoodScarfOID_B = AddToggleOption("$Fur Mantle Version", IAVTFurHoodScarf.GetValue() as Bool)
EndIf

EndEvent



function OnBackupRequest(int jMod)
	; Armor Options
	int jArmors = JMap.object()
	int jChanceArmor = JArray.object()
	JMap.setObj(jMod, "IACraftingToggleArmor", jArmors)
	JMap.setObj(jMod,"IAChanceoNneArmor", jChanceArmor )
	int i = 1
	While i < 56
		JMap.setFlt(jArmors, ArmorName[i], IACraftingToggleArmor[i].GetValue())
		JArray.AddFlt(jChanceArmor, IAChanceoNneArmor[i].GetValue())
		i += 1
	EndWhile

	; Shield Options
	int jShields = JMap.object()
	int jChanceShield = JArray.object()
	JMap.setObj(jMod, "IACraftingToggleShield", jShields)
	JMap.setObj(jMod,"IAChanceNoneShield", jChanceShield )
	i = 1
	While i < 28
		JMap.setFlt(jShields, ShieldName[i], IACraftingToggleShield[i].GetValue())
		JArray.AddFlt(jChanceShield, IAChanceNoneShield[i].GetValue())
		i += 1
	EndWhile

	; Armor Type		
	JMap.setObj(jMod, "IAVTArmorFurHood", IAVTArmorFurHood.GetValue())
	JMap.setObj(jMod, "IAWTBoiledChitin", IAWTBoiledChitin.GetValue())
	JMap.setObj(jMod, "IAWTBosmer", IAWTBosmer.GetValue())
	JMap.setObj(jMod, "IAWTDragonEbon", IAWTDragonEbon.GetValue())
	JMap.setObj(jMod, "IAWTDragonKnight", IAWTDragonKnight.GetValue())
	JMap.setObj(jMod, "IAWTGildergreenAegis", IAWTGildergreenAegis.GetValue())
	JMap.setObj(jMod, "IAWTGlacialCrystal", IAWTGlacialCrystal.GetValue())
	JMap.setObj(jMod, "IAWTShieldJorrvaskr", IAWTShieldJorrvaskr.GetValue())
	JMap.setObj(jMod, "IAWTMantleSilverHand", IAWTMantleSilverHand.GetValue())
	JMap.setObj(jMod, "IAWTPrimitiveNord", IAWTPrimitiveNord.GetValue())
	JMap.setObj(jMod, "IAWTRedguardKnight", IAWTRedguardKnight.GetValue())
	JMap.setObj(jMod, "IAWTShieldTarget", IAWTShieldTarget.GetValue())
	JMap.setObj(jMod, "IAWTWarchief", IAWTWarchief.GetValue())

	; Robe Type
	JMap.setObj(jMod, "IAWTDragonhideRobe", IAWTDragonhideRobe.GetValue())
	JMap.setObj(jMod, "IAWTDwarvenMageRobe", IAWTDwarvenMageRobe.GetValue())
	JMap.setObj(jMod, "IAWTEbonyMageRobe", IAWTEbonyMageRobe.GetValue())
	JMap.setObj(jMod, "IAWTShamanRobe", IAWTShamanRobe.GetValue())
	JMap.setObj(jMod, "IAWTTribunalRobe", IAWTTribunalRobe.GetValue())
	JMap.setObj(jMod, "IAVTTribunalColor", IAVTTribunalColor.GetValue())
	JMap.setObj(jMod, "IAVTEinherjarBrigandine", IAVTEinherjarBrigandine.GetValue())
	JMap.setObj(jMod, "IAVTEinherjarPlate", IAVTEinherjarPlate.GetValue())
	JMap.setObj(jMod, "IAVTNordMailHauberk", IAVTNordMailHauberk.GetValue())
	JMap.setObj(jMod, "IAVTNordMailShirt", IAVTNordMailShirt.GetValue())
	JMap.setObj(jMod, "IAVTSpellbinder", IAVTSpellbinder.GetValue())
	JMap.setObj(jMod, "IAVTVagabond", IAVTVagabond.GetValue())

	; General Mod Options
	JMap.setObj(jMod, "IAGBreakdown", IAGBreakdown.GetValue())
	JMap.setObj(jMod, "IAGVendors", IAGVendors.GetValue())
	JMap.setObj(jMod, "IAGAlternateStart", IAGAlternateStart.GetValue())
	JMap.setObj(jMod, "IAGNoQuestCrafting", IAGNoQuestCrafting.GetValue())
	JMap.setObj(jMod, "IADTCreatures", IADTCreatures.GetValue())

	; Special Distribution Options
	JMap.setObj(jMod, "IAGNPCArmor", IAGNPCArmor.GetValue())
	JMap.setObj(jMod, "IAGGuardHelms", IAGGuardHelms.GetValue())
	JMap.setObj(jMod, "IADTAfflicted", IADTAfflicted.GetValue())
	JMap.setObj(jMod, "IADTAlikr", IADTAlikr.GetValue())
	JMap.setObj(jMod, "IADTBandit", IADTBandit.GetValue())
	JMap.setObj(jMod, "IADTBattlemage", IADTBattlemage.GetValue())
	JMap.setObj(jMod, "IADTDraugr", IADTDraugr.GetValue())
	JMap.setObj(jMod, "IADTForsworn", IADTForsworn.GetValue())
	JMap.setObj(jMod, "IADTHunter", IADTHunter.GetValue())
	JMap.setObj(jMod, "IADTKhajiit", IADTKhajiit.GetValue())
	JMap.setObj(jMod, "IADTOrc", IADTOrc.GetValue())
	JMap.setObj(jMod, "IADTRobber", IADTRobber.GetValue())
	JMap.setObj(jMod, "IADTSeadog", IADTSeadog.GetValue())
	JMap.setObj(jMod, "IADTSoldier", IADTSoldier.GetValue())
	JMap.setObj(jMod, "IACNGlacialCrystal", IACNGlacialCrystal.GetValue())
	JMap.setObj(jMod, "IACNVvardenfellGlass", IACNVvardenfellGlass.GetValue())
	JMap.setObj(jMod, "IADTThalmor", IADTThalmor.GetValue())
	JMap.setObj(jMod, "IADTVampire", IADTVampire.GetValue())
	JMap.setObj(jMod, "IADTVigilant", IADTVigilant.GetValue())
	JMap.setObj(jMod, "IADTWarlock", IADTWarlock.GetValue())
	
	; Special Variants
	JMap.setObj(jMod, "IAVTArmorFurHood", IAVTArmorFurHood.GetValue())
	JMap.setObj(jMod, "IAVTFurHoodColor", IAVTFurHoodColor.GetValue())
	JMap.setObj(jMod, "IAVTFurHoodScarf", IAVTFurHoodScarf.GetValue())
endfunction


function OnRestoreRequest(int jMod)
    loadPreset("yeolde-settings")
endfunction

;------------------------------------------------------------------------

Event OnOptionSelect(Int Option)

If CurrentPage == "$Armor Options"
	Int i = 1
	While i < 56
	If Option == CraftingArmorOID_B[i]
		If IACraftingToggleArmor[i].GetValue()
			IACraftingToggleArmor[i].SetValue(0)
		Else
			IACraftingToggleArmor[i].SetValue(1)
		EndIf
		SetToggleOptionValue(CraftingArmorOID_B[i], (IACraftingToggleArmor[i].GetValue() as Bool) )
		i = 55
	ElseIf Option == DistributionArmorOID_B[i]
		If IAChanceNoneArmor[i].GetValue()
			IAChanceNoneArmor[i].SetValue(0)
		Else
			IAChanceNoneArmor[i].SetValue(100)
			If IAChanceNoneArmor[i] == IACNRedguardKnight
				IADTAlikr.SetValue(0)
			EndIf
		EndIf
		SetToggleOptionValue(DistributionArmorOID_B[i], !(IAChanceNoneArmor[i].GetValue() as Bool))
		i = 55
	EndIf
	i += 1
	EndWhile
ElseIf CurrentPage == "$Shield Options"
	Int i = 1
	While i < 28
	If Option == CraftingShieldOID_B[i]
		If IACraftingToggleShield[i].GetValue()
			IACraftingToggleShield[i].SetValue(0)
		Else
			IACraftingToggleShield[i].SetValue(1)
		EndIf
		SetToggleOptionValue(CraftingShieldOID_B[i], (IACraftingToggleShield[i].GetValue() as Bool) )
		i = 27
	ElseIf Option == DistributionShieldOID_B[i]
		If IAChanceNoneShield[i].GetValue()
			IAChanceNoneShield[i].SetValue(0)
		Else
			IAChanceNoneShield[i].SetValue(100)
		EndIf
		SetToggleOptionValue(DistributionShieldOID_B[i], !(IAChanceNoneShield[i].GetValue() as Bool))
		i = 27
	EndIf
	i += 1
	EndWhile
ElseIf CurrentPage == "$Extra Options"
	If Option == IAGBreakdownOID_B
		If IAGBreakdown.GetValue()
			IAGBreakdown.SetValue(0)
		Else
			IAGBreakdown.SetValue(1)
		EndIf
		SetToggleOptionValue(IAGBreakdownOID_B, (IAGBreakdown.GetValue() as Bool) )
	ElseIf Option == IAGVendorsOID_B
		If IAGVendors.GetValue()
			IAGVendors.SetValue(0)
		Else
			IAGVendors.SetValue(1)
		EndIf
		SetToggleOptionValue(IAGVendorsOID_B, IAGVendors.GetValue() as Bool)
	ElseIf Option == IAGAlternateStartOID_B
		If IAGAlternateStart.GetValue()
			IAGAlternateStart.SetValue(0)
		Else
			IAGAlternateStart.SetValue(1)
		EndIf
		SetToggleOptionValue(IAGAlternateStartOID_B, IAGAlternateStart.GetValue() as Bool)
	ElseIf Option == IAGNoQuestCraftingOID_B
		If IAGNoQuestCrafting.GetValue()
			IAGNoQuestCrafting.SetValue(0)
		Else
			IAGNoQuestCrafting.SetValue(1)
		EndIf
		SetToggleOptionValue(IAGNoQuestCraftingOID_B, IAGNoQuestCrafting.GetValue() as Bool)
	ElseIf Option == IADTCreaturesOID_B
		If IADTCreatures.GetValue()
			IADTCreatures.SetValue(0)
		Else
			IADTCreatures.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTCreaturesOID_B, IADTCreatures.GetValue() as Bool)
	ElseIf Option == IAWTArmorFurHoodOID_T
		If IAVTArmorFurHood.GetValue() < 6
			IAVTArmorFurHood.SetValue (IAVTArmorFurHood.GetValue() + 6)
			IAVCNArmorFurHoodHeavy.SetValue (0)
			IAVCNArmorFurHoodLight.SetValue (100)
		Else
			IAVTArmorFurHood.SetValue (IAVTArmorFurHood.GetValue() - 6)
			IAVCNArmorFurHoodLight.SetValue (0)
			IAVCNArmorFurHoodHeavy.SetValue (100)
		EndIf
		SetTextOptionValue(IAWTArmorFurHoodOID_T , ArmorWeight[(IAVTArmorFurHood.GetValue() as Int) / 6 ])
	ElseIf Option == IAWTBoiledChitinOID_T
		If IAWTBoiledChitin.GetValue()
			IAWTBoiledChitin.SetValue(0)
			IAVCNBoiledChitinHeavy.SetValue(0)
			IAVCNBoiledChitinLight.SetValue(100)
		Else
			IAWTBoiledChitin.SetValue(1)
			IAVCNBoiledChitinLight.SetValue(0)
			IAVCNBoiledChitinHeavy.SetValue(100)
		EndIf
		SetTextOptionValue(IAWTBoiledChitinOID_T , ArmorWeight[IAWTBoiledChitin.GetValue() as Int])
	ElseIf Option == IAWTBosmerOID_T
		If IAWTBosmer.GetValue()
			IAWTBosmer.SetValue(0)
		Else
			IAWTBosmer.SetValue(1)
		EndIf
		SetTextOptionValue(IAWTBosmerOID_T , ArmorWeight[IAWTBosmer.GetValue() as Int])
	ElseIf Option == IAWTDragonEbonOID_T
		If IAWTDragonEbon.GetValue()
			IAWTDragonEbon.SetValue(0)
		Else
			IAWTDragonEbon.SetValue(1)
		EndIf
		SetTextOptionValue(IAWTDragonEbonOID_T , ArmorWeight[IAWTDragonEbon.GetValue() as Int])
	ElseIf Option == IAWTDragonKnightOID_T
		If IAWTDragonKnight.GetValue()
			IAWTDragonKnight.SetValue(0)
		Else
			IAWTDragonKnight.SetValue(1)
		EndIf
		SetTextOptionValue(IAWTDragonKnightOID_T , ArmorWeight[IAWTDragonKnight.GetValue() as Int])
	ElseIf Option == IAWTGildergreenAegisOID_T
		If IAWTGildergreenAegis.GetValue()
			IAWTGildergreenAegis.SetValue(0)
			IAVCNGildergreenAegisHeavy.SetValue(0)
			IAVCNGildergreenAegisLight.SetValue(100)
		Else
			IAWTGildergreenAegis.SetValue(1)
			IAVCNGildergreenAegisLight.SetValue(0)
			IAVCNGildergreenAegisHeavy.SetValue(100)
		EndIf
		SetTextOptionValue(IAWTGildergreenAegisOID_T , ArmorWeight[IAWTGildergreenAegis.GetValue() as Int])
	ElseIf Option == IAWTGlacialCrystalOID_T
		If IAWTGlacialCrystal.GetValue()
			IAWTGlacialCrystal.SetValue(0)
			IAVCNGlacialCrystalHeavy.SetValue(0)
			IAVCNGlacialCrystalLight.SetValue(100)
		Else
			IAWTGlacialCrystal.SetValue(1)
			IAVCNGlacialCrystalLight.SetValue(0)
			IAVCNGlacialCrystalHeavy.SetValue(100)
		EndIf
		SetTextOptionValue(IAWTGlacialCrystalOID_T , ArmorWeight[IAWTGlacialCrystal.GetValue() as Int])
	ElseIf Option == IAWTShieldJorrvaskrOID_T
		If IAWTShieldJorrvaskr.GetValue()
			IAWTShieldJorrvaskr.SetValue(0)
			IAVCNShieldJorrvaskrHeavy.SetValue(0)
			IAVCNShieldJorrvaskrLight.SetValue(100)
		Else
			IAWTShieldJorrvaskr.SetValue(1)
			IAVCNShieldJorrvaskrLight.SetValue(0)
			IAVCNShieldJorrvaskrHeavy.SetValue(100)
		EndIf
		SetTextOptionValue(IAWTShieldJorrvaskrOID_T , ArmorWeight[IAWTShieldJorrvaskr.GetValue() as Int])
	ElseIf Option == IAWTMantleSilverHandOID_T
		If IAWTMantleSilverHand.GetValue()
			IAWTMantleSilverHand.SetValue(0)
		Else
			IAWTMantleSilverHand.SetValue(1)
		EndIf
		SetTextOptionValue(IAWTMantleSilverHandOID_T , ArmorWeight[IAWTMantleSilverHand.GetValue() as Int])
	ElseIf Option == IAWTPrimitiveNordOID_T
		If IAWTPrimitiveNord.GetValue()
			IAWTPrimitiveNord.SetValue(0)
		Else
			IAWTPrimitiveNord.SetValue(1)
		EndIf
		SetTextOptionValue(IAWTPrimitiveNordOID_T , ArmorWeight[IAWTPrimitiveNord.GetValue() as Int])
	ElseIf Option == IAWTRedguardKnightOID_T
		If IAWTRedguardKnight.GetValue()
			IAWTRedguardKnight.SetValue(0)
		Else
			IAWTRedguardKnight.SetValue(1)
		EndIf
		SetTextOptionValue(IAWTRedguardKnightOID_T , ArmorWeight[IAWTRedguardKnight.GetValue() as Int])
	ElseIf Option == IAWTShieldTargetOID_T
		If IAWTShieldTarget.GetValue()
			IAWTShieldTarget.SetValue(0)
			IAVCNShieldTargetHeavy.SetValue(0)
			IAVCNShieldTargetLight.SetValue(100)
		Else
			IAWTShieldTarget.SetValue(1)
			IAVCNShieldTargetLight.SetValue(0)
			IAVCNShieldTargetHeavy.SetValue(100)
		EndIf
		SetTextOptionValue(IAWTShieldTargetOID_T , ArmorWeight[IAWTShieldTarget.GetValue() as Int])
	ElseIf Option == IAWTWarchiefOID_T
		If IAWTWarchief.GetValue()
			IAWTWarchief.SetValue(0)
		Else
			IAWTWarchief.SetValue(1)
		EndIf
		SetTextOptionValue(IAWTWarchiefOID_T , ArmorWeight[IAWTWarchief.GetValue() as Int])
	ElseIf Option == IAWTDragonhideRobeOID_T
		If IAWTDragonhideRobe.GetValue() > 1
			IAWTDragonhideRobe.SetValue(0)
			IAVCNDragonhideHeavy.SetValue (0)
			IAVCNDragonhideLight.SetValue (100)
			IAVCNDragonhideUnarmored.SetValue (100)
		ElseIf IAWTDragonhideRobe.GetValue() < 1
			IAWTDragonhideRobe.SetValue(1)
			IAVCNDragonhideHeavy.SetValue (100)
			IAVCNDragonhideLight.SetValue (0)
			IAVCNDragonhideUnarmored.SetValue (100)
		Else
			IAWTDragonhideRobe.SetValue(2)
			IAVCNDragonhideHeavy.SetValue (100)
			IAVCNDragonhideLight.SetValue (100)
			IAVCNDragonhideUnarmored.SetValue (0)
		EndIf
		SetTextOptionValue(IAWTDragonhideRobeOID_T, ArmorWeight[IAWTDragonhideRobe.GetValue() as Int])
	ElseIf Option == IAWTDwarvenMageRobeOID_T
		If IAWTDwarvenMageRobe.GetValue() > 1
			IAWTDwarvenMageRobe.SetValue(0)
			IAVCNDwarvenMageHeavy.SetValue (0)
			IAVCNDwarvenMageLight.SetValue (100)
			IAVCNDwarvenMageUnarmored.SetValue (100)
		ElseIf IAWTDwarvenMageRobe.GetValue() < 1
			IAWTDwarvenMageRobe.SetValue(1)
			IAVCNDwarvenMageHeavy.SetValue (100)
			IAVCNDwarvenMageLight.SetValue (0)
			IAVCNDwarvenMageUnarmored.SetValue (100)
		Else
			IAWTDwarvenMageRobe.SetValue(2)
			IAVCNDwarvenMageHeavy.SetValue (100)
			IAVCNDwarvenMageLight.SetValue (100)
			IAVCNDwarvenMageUnarmored.SetValue (0)
		EndIf
		SetTextOptionValue(IAWTDwarvenMageRobeOID_T, ArmorWeight[IAWTDwarvenMageRobe.GetValue() as Int])
	ElseIf Option == IAWTEbonyMageRobeOID_T
		If IAWTEbonyMageRobe.GetValue() > 1
			IAWTEbonyMageRobe.SetValue(0)
			IAVCNEbonyMageHeavy.SetValue (0)
			IAVCNEbonyMageLight.SetValue (100)
			IAVCNEbonyMageUnarmored.SetValue (100)
		ElseIf IAWTEbonyMageRobe.GetValue() < 1
			IAWTEbonyMageRobe.SetValue(1)
			IAVCNEbonyMageHeavy.SetValue (100)
			IAVCNEbonyMageLight.SetValue (0)
			IAVCNEbonyMageUnarmored.SetValue (100)
		Else
			IAWTEbonyMageRobe.SetValue(2)
			IAVCNEbonyMageHeavy.SetValue (100)
			IAVCNEbonyMageLight.SetValue (100)
			IAVCNEbonyMageUnarmored.SetValue (0)
		EndIf
		SetTextOptionValue(IAWTEbonyMageRobeOID_T, ArmorWeight[IAWTEbonyMageRobe.GetValue() as Int])
	ElseIf Option == IAWTShamanRobeOID_T
		If IAWTShamanRobe.GetValue() == 1
			IAWTShamanRobe.SetValue(2)
			IAVCNShamanUnarmored.SetValue (0)
			IAVCNShamanLight.SetValue (100)
		Else
			IAWTShamanRobe.SetValue(1)
			IAVCNShamanLight.SetValue (0)
			IAVCNShamanUnarmored.SetValue (100)
		EndIf
		SetTextOptionValue(IAWTShamanRobeOID_T, ArmorWeight[IAWTShamanRobe.GetValue() as Int])
	ElseIf Option == IAWTTribunalRobeOID_T
		If IAWTTribunalRobe.GetValue() > 1
			IAWTTribunalRobe.SetValue(0)
			IAVCNTribunalHeavy.SetValue (0)
			IAVCNTribunalUnarmored.SetValue (100)
		ElseIf IAWTTribunalRobe.GetValue() == 1
			IAWTTribunalRobe.SetValue(2)
			IAVCNTribunalUnarmored.SetValue (0)
			IAVCNTribunalLight.SetValue (100)
		Else
			IAWTTribunalRobe.SetValue(1)
			IAVCNTribunalLight.SetValue (0)
			IAVCNTribunalHeavy.SetValue (100)
		EndIf
		SetTextOptionValue(IAWTTribunalRobeOID_T, ArmorWeight[IAWTTribunalRobe.GetValue() as Int])
	ElseIf Option == IAVTTribunalColorOID_T
		If IAVTTribunalColor.GetValue() > 3
			IAVTTribunalColor.SetValue(0)
		Else
			IAVTTribunalColor.SetValue(IAVTTribunalColor.GetValue() + 1 )
		EndIf
		SetTextOptionValue(IAVTTribunalColorOID_T, TribunalColor[IAVTTribunalColor.GetValue() as Int])
	ElseIf Option == IAVTEinherjarBrigandineOID_T
		If IAVTEinherjarBrigandine.GetValue()
			IAVTEinherjarBrigandine.SetValue(0)
		Else
			IAVTEinherjarBrigandine.SetValue(1)
		EndIf
		SetTextOptionValue(IAVTEinherjarBrigandineOID_T , DarkLight[IAVTEinherjarBrigandine.GetValue() as Int])
	ElseIf Option == IAVTEinherjarPlateOID_T
		If IAVTEinherjarPlate.GetValue()
			IAVTEinherjarPlate.SetValue(0)
		Else
			IAVTEinherjarPlate.SetValue(1)
		EndIf
		SetTextOptionValue(IAVTEinherjarPlateOID_T , DarkLight[IAVTEinherjarPlate.GetValue() as Int])
	ElseIf Option == IAVTNordMailHauberkOID_T
		If IAVTNordMailHauberk.GetValue()
			IAVTNordMailHauberk.SetValue(0)
		Else
			IAVTNordMailHauberk.SetValue(1)
		EndIf
		SetTextOptionValue(IAVTNordMailHauberkOID_T , HelmetSpectacle[IAVTNordMailHauberk.GetValue() as Int])
	ElseIf Option == IAVTNordMailShirtOID_T
		If IAVTNordMailShirt.GetValue()
			IAVTNordMailShirt.SetValue(0)
		Else
			IAVTNordMailShirt.SetValue(1)
		EndIf
		SetTextOptionValue(IAVTNordMailShirtOID_T , HelmetSpectacle[IAVTNordMailShirt.GetValue() as Int])
	ElseIf Option == IAVTSpellbinderOID_T
		If IAVTSpellbinder.GetValue()
			IAVTSpellbinder.SetValue(0)
		Else
			IAVTSpellbinder.SetValue(1)
		EndIf
		SetTextOptionValue(IAVTSpellbinderOID_T , CrimsonRunic[IAVTSpellbinder.GetValue() as Int])
	ElseIf Option == IAVTVagabondOID_T
		If IAVTVagabond.GetValue()
			IAVTVagabond.SetValue(0)
		Else
			IAVTVagabond.SetValue(1)
		EndIf
		SetTextOptionValue(IAVTVagabondOID_T , CrimsonDusk[IAVTVagabond.GetValue() as Int])
	ElseIf Option == IAVTArmorFurHoodOID_T
		If (IAVTArmorFurHood.GetValue() / 2 ) as Int == 2 || (IAVTArmorFurHood.GetValue() / 2 ) as Int == 5
			IAVTArmorFurHood.SetValue (IAVTArmorFurHood.GetValue() - 4)
		Else
			IAVTArmorFurHood.SetValue (IAVTArmorFurHood.GetValue() + 2)
		EndIf
		If IAVTArmorFurHood.GetValue() < 6
			SetTextOptionValue(IAVTArmorFurHoodOID_T , BlackPlainWhite[((IAVTArmorFurHood.GetValue() as Int) / 2 )])
		Else
			SetTextOptionValue(IAVTArmorFurHoodOID_T , BlackPlainWhite[(((IAVTArmorFurHood.GetValue() as Int) - 6 ) / 2) ])
		EndIf
	ElseIf Option == IAVTArmorFurHoodOID_B
		If (IAVTArmorFurHood.GetValue()/2) as Int == ((IAVTArmorFurHood.GetValue() + 1)/2) as Int
			IAVTArmorFurHood.SetValue (IAVTArmorFurHood.GetValue() + 1)
			SetToggleOptionValue(IAVTArmorFurHoodOID_B, true)
		Else
			IAVTArmorFurHood.SetValue (IAVTArmorFurHood.GetValue() - 1)
			SetToggleOptionValue(IAVTArmorFurHoodOID_B, false )
		EndIf
	ElseIf Option == IAVTFurHoodColorOID_T
		If IAVTFurHoodColor.GetValue() > 1
			IAVTFurHoodColor.SetValue(0)
		Else
			IAVTFurHoodColor.SetValue(IAVTFurHoodColor.GetValue() + 1)
		EndIf
		SetTextOptionValue(IAVTFurHoodColorOID_T , BlackPlainWhite[IAVTFurHoodColor.GetValue() as Int])
	ElseIf Option == IAVTFurHoodScarfOID_B 
		If IAVTFurHoodScarf.GetValue()
			IAVTFurHoodScarf.SetValue(0)
		Else
			IAVTFurHoodScarf.SetValue(1)
		EndIf
		SetToggleOptionValue(IAVTFurHoodScarfOID_B, IAVTFurHoodScarf.GetValue() as Bool)
	ElseIf Option == IAGNPCArmorOID_B
		If IAGNPCArmor.GetValue()
			IAGNPCArmor.SetValue(0)
			DistributionFlag = OPTION_FLAG_DISABLED
		Else
			IAGNPCArmor.SetValue(1)
			DistributionFlag = OPTION_FLAG_NONE
		EndIf
		SetToggleOptionValue(IAGNPCArmorOID_B, IAGNPCArmor.GetValue() as Bool)
		SetOptionFlags(IAGGuardHelmsOID_B, DistributionFlag) 
		SetOptionFlags(IADTAfflictedOID_B, DistributionFlag) 
		SetOptionFlags(IADTAlikrOID_B, DistributionFlag) 
		SetOptionFlags(IADTBanditOID_B, DistributionFlag) 
		SetOptionFlags(IADTBattlemageOID_B, DistributionFlag) 
		SetOptionFlags(IADTDraugrOID_B, DistributionFlag) 
		SetOptionFlags(IADTForswornOID_B, DistributionFlag) 
		SetOptionFlags(IADTHunterOID_B, DistributionFlag) 
		SetOptionFlags(IADTKhajiitOID_B, DistributionFlag) 
		SetOptionFlags(IADTOrcOID_B, DistributionFlag) 
		SetOptionFlags(IADTRobberOID_B, DistributionFlag) 
		SetOptionFlags(IADTSeadogOID_B, DistributionFlag) 
		SetOptionFlags(IADTSoldierOID_B, DistributionFlag) 
	If DistributionFlag || (IACNGlacialCrystal.GetValue() && IACNVvardenfellGlass.GetValue())
		ThalmorDistributionFlag = 1
	Else
		ThalmorDistributionFlag = 0
	EndIf
		SetOptionFlags(IADTThalmorOID_B, ThalmorDistributionFlag) 
		SetOptionFlags(IADTVampireOID_B, DistributionFlag) 
		SetOptionFlags(IADTVigilantOID_B, DistributionFlag) 
		SetOptionFlags(IADTWarlockOID_B, DistributionFlag) 
	ElseIf Option == IAGGuardHelmsOID_B
		If IAGGuardHelms.GetValue()
			IAGGuardHelms.SetValue(0)
		Else
			IAGGuardHelms.SetValue(1)
		EndIf
		SetToggleOptionValue(IAGGuardHelmsOID_B, IAGGuardHelms.GetValue() as Bool)
	ElseIf Option == IADTAfflictedOID_B
		If IADTAfflicted.GetValue()
			IADTAfflicted.SetValue(0)
		Else
			IADTAfflicted.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTAfflictedOID_B, IADTAfflicted.GetValue() as Bool)
	ElseIf Option == IADTAlikrOID_B
		If IADTAlikr.GetValue()
			IADTAlikr.SetValue(0)
		Else
			IADTAlikr.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTAlikrOID_B, IADTAlikr.GetValue() as Bool)
	ElseIf Option == IADTBanditOID_B
		If IADTBandit.GetValue()
			IADTBandit.SetValue(0)
		Else
			IADTBandit.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTBanditOID_B, IADTBandit.GetValue() as Bool)
	ElseIf Option == IADTBattlemageOID_B
		If IADTBattlemage.GetValue()
			IADTBattlemage.SetValue(0)
		Else
			IADTBattlemage.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTBattlemageOID_B, IADTBattlemage.GetValue() as Bool)
	ElseIf Option == IADTDraugrOID_B
		If IADTDraugr.GetValue()
			IADTDraugr.SetValue(0)
		Else
			IADTDraugr.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTDraugrOID_B, IADTDraugr.GetValue() as Bool)
	ElseIf Option == IADTForswornOID_B
		If IADTForsworn.GetValue()
			IADTForsworn.SetValue(0)
		Else
			IADTForsworn.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTForswornOID_B, IADTForsworn.GetValue() as Bool)
	ElseIf Option == IADTHunterOID_B
		If IADTHunter.GetValue()
			IADTHunter.SetValue(0)
		Else
			IADTHunter.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTHunterOID_B, IADTHunter.GetValue() as Bool)
	ElseIf Option == IADTKhajiitOID_B
		If IADTKhajiit.GetValue()
			IADTKhajiit.SetValue(0)
		Else
			IADTKhajiit.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTKhajiitOID_B, IADTKhajiit.GetValue() as Bool)
	ElseIf Option == IADTOrcOID_B
		If IADTOrc.GetValue()
			IADTOrc.SetValue(0)
		Else
			IADTOrc.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTOrcOID_B, IADTOrc.GetValue() as Bool)
	ElseIf Option == IADTRobberOID_B
		If IADTRobber.GetValue()
			IADTRobber.SetValue(0)
		Else
			IADTRobber.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTRobberOID_B, IADTRobber.GetValue() as Bool)
	ElseIf Option == IADTSeadogOID_B
		If IADTSeadog.GetValue()
			IADTSeadog.SetValue(0)
		Else
			IADTSeadog.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTSeadogOID_B, IADTSeadog.GetValue() as Bool)
	ElseIf Option == IADTSoldierOID_B
		If IADTSoldier.GetValue()
			IADTSoldier.SetValue(0)
		Else
			IADTSoldier.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTSoldierOID_B, IADTSoldier.GetValue() as Bool)
	ElseIf Option == IADTThalmorOID_B
		If IADTThalmor.GetValue()
			IADTThalmor.SetValue(0)
		Else
			IADTThalmor.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTThalmorOID_B, IADTThalmor.GetValue() as Bool)
	ElseIf Option == IADTVampireOID_B
		If IADTVampire.GetValue()
			IADTVampire.SetValue(0)
		Else
			IADTVampire.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTVampireOID_B, IADTVampire.GetValue() as Bool)
	ElseIf Option == IADTVigilantOID_B
		If IADTVigilant.GetValue()
			IADTVigilant.SetValue(0)
		Else
			IADTVigilant.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTVigilantOID_B, IADTVigilant.GetValue() as Bool)
	ElseIf Option == IADTWarlockOID_B
		If IADTWarlock.GetValue()
			IADTWarlock.SetValue(0)
		Else
			IADTWarlock.SetValue(1)
		EndIf
		SetToggleOptionValue(IADTWarlockOID_B, IADTWarlock.GetValue() as Bool)
	EndIf
EndIf

EndEvent

;------------------------------------------------------------------------

Event OnOptionHighlight (Int Option)

If CurrentPage == "$Armor Options"
	If Option == (Option/2)*2
		SetInfoText("$ArmorCraftingInfo")
	Else
		SetInfoText("$ArmorDistributionInfo")
	EndIf
ElseIf CurrentPage == "$Shield Options"
	If Option == (Option/2)*2
		SetInfoText("$ShieldCraftingInfo")
	Else
		SetInfoText("$ShieldDistributionInfo")
	EndIf
ElseIf CurrentPage == "$Extra Options"
	If Option == IAGBreakdownOID_B
		SetInfoText("$ArmorBreakdownInfo")
	ElseIf Option == IAGVendorsOID_B
		SetInfoText("$VendorDistributionInfo")
	ElseIf Option == IAGAlternateStartOID_B
		SetInfoText("$AlternateStartInfo")
	ElseIf Option == IAGNoQuestCraftingOID_B
		SetInfoText("$NoQuestCraftingInfo")
	ElseIf Option == IADTCreaturesOID_B
		SetInfoText("$CreaturesDistributionInfo")
	ElseIf Option == IAGNPCArmorOID_B
		SetInfoText("$GeneralDistributionInfo")
	ElseIf Option == IAGGuardHelmsOID_B
		SetInfoText("$GuardHelmetInfo")
	ElseIf Option == IADTAfflictedOID_B
		SetInfoText("$AfflictedDistributionInfo")
	ElseIf Option == IADTAlikrOID_B
		SetInfoText("$AlikrDistributionInfo")
	ElseIf Option == IADTBanditOID_B
		SetInfoText("$BanditDistributionInfo")
	ElseIf Option == IADTBattlemageOID_B
		SetInfoText("$BattlemageDistributionInfo")
	ElseIf Option == IADTDraugrOID_B
		SetInfoText("$DraugrDistributionInfo")
	ElseIf Option == IADTForswornOID_B
		SetInfoText("$ForswornDistributionInfo")
	ElseIf Option == IADTHunterOID_B
		SetInfoText("$HunterDistributionInfo")
	ElseIf Option == IADTKhajiitOID_B
		SetInfoText("$KhajiitDistributionInfo")
	ElseIf Option == IADTOrcOID_B
		SetInfoText("$OrcDistributionInfo")
	ElseIf Option == IADTRobberOID_B
		SetInfoText("$RobberDistributionInfo")
	ElseIf Option == IADTSeadogOID_B
		SetInfoText("$SeadogDistributionInfo")
	ElseIf Option == IADTSoldierOID_B
		SetInfoText("$SoldierDistributionInfo")
	ElseIf Option == IADTThalmorOID_B
		SetInfoText("$ThalmorDistributionInfo")
	ElseIf Option == IADTVampireOID_B
		SetInfoText("$VampireDistributionInfo")
	ElseIf Option == IADTVigilantOID_B
		SetInfoText("$VigilantDistributionInfo")
	ElseIf Option == IADTWarlockOID_B
		SetInfoText("$WarlockDistributionInfo")
	ElseIf Option == IAVTArmorFurHoodOID_B || Option == IAVTFurHoodScarfOID_B
		SetInfoText("$HoodMantleInfo")
	ElseIf Option == IAVTArmorFurHoodOID_T || Option == IAVTFurHoodColorOID_T
		SetInfoText("$HoodColorInfo")
	ElseIf Option == IAVTTribunalColorOID_T
		SetInfoText("$TribunalColorInfo")
	ElseIf Option == (Option/2)*2
		SetInfoText("$ArmorTypeInfo")
	ElseIf Option == IAVTEinherjarBrigandineOID_T || Option == IAVTEinherjarPlateOID_T
		SetInfoText("$FurColorInfo")
	ElseIf Option == IAVTSpellbinderOID_T
		SetInfoText("$ArmorStyleInfo")
	ElseIf Option == IAVTVagabondOID_T
		SetInfoText("$VagabondStyleInfo")
	Else
		SetInfoText("$HeadgearInfo")
	EndIf
EndIf
EndEvent

Event OnConfigClose()
If !IAGConfigBusy.GetValue()
	IAAdminQuest.DistributeArmors ()
EndIf
EndEvent
