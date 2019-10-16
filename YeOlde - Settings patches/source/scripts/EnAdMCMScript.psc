Scriptname EnAdMCMScript extends SKI_ConfigBase   

GlobalVariable Property EnAdXpMultiplierBackup Auto
GlobalVariable Property EnAdSkillFactorBackup Auto
GlobalVariable Property EnAdClothesMagickPerkBackup Auto
GlobalVariable Property EnAdClothesOtherSkillsPerkBackup Auto
GlobalVariable Property EnAdRechargeMultPerkBackup Auto

Perk Property EnAdXpPerk Auto
Perk Property EnAdClothesMagickPerk Auto
Perk Property EnAdClothesOtherSkillsPerk Auto
Perk Property EnAdRechargeMultPerk Auto

Float fEnAdXpMultiplier
Float fEnAdSkillFactor
Float fEnAdClothesMagickPerk
Float fEnAdClothesOtherSkillsPerk
Float fEnAdRechargeMultPerk

Int iEnAdXpMultiplierOption
Int iEnAdSkillFactorOption
Int iEnAdClothesMagickPerkOption
Int iEnAdClothesOtherSkillsPerkOption
Int iEnAdRechargeMultPerkOption


Event OnConfigInit()
	Pages = new string[1]
	Pages[0] = "Settings"
	fEnAdXpMultiplier = EnAdXpPerk.GetNthEntryValue(0, 0)
	fEnAdSkillFactor = Game.GetGameSettingFloat("fEnchantingSkillFactor")
	fEnAdClothesMagickPerk = EnAdClothesMagickPerk.GetNthEntryValue(0, 0)
	fEnAdClothesOtherSkillsPerk = EnAdClothesOtherSkillsPerk.GetNthEntryValue(0, 0)
	fEnAdRechargeMultPerk = EnAdRechargeMultPerk.GetNthEntryValue(0, 0)
EndEvent


Event OnPageReset(string currentPage)
	If (currentPage == "")
		LoadCustomContent("EnAd/MCMCover.dds", 80, -80)
		return
	Else
		UnloadCustomContent()
	EndIf
	If (currentPage == "Settings")
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("Experience Settings")
		iEnAdXpMultiplierOption = AddSliderOption("Enchanting experience multiplier", fEnAdXpMultiplier, "X{1}")
		AddEmptyOption()
		
		AddHeaderOption("Skill Settings")
		iEnAdSkillFactorOption = AddSliderOption("Skill multiplier at 100 skill", fEnAdSkillFactor, "X{1}")
		AddEmptyOption()
		
		AddHeaderOption("Magnitude Multipliers Settings")
		iEnAdClothesMagickPerkOption = AddSliderOption("Clothes Magic Enchantments", fEnAdClothesMagickPerk, "X{1}")
		iEnAdClothesOtherSkillsPerkOption = AddSliderOption("Clothes Skill Enchantments", fEnAdClothesOtherSkillsPerk, "X{1}")
		AddEmptyOption()
		
		AddHeaderOption("Recharge Settings")
		iEnAdRechargeMultPerkOption = AddSliderOption("Recharge Multiplier", fEnAdRechargeMultPerk, "X{1}")
	EndIf
EndEvent

; OnBackupRequest
; params:
; 	int jMod: a JMap handler initialized and ready to receive your data.	
; return:
; 	string[]: an array containing all your mod's values to backup.
function OnBackupRequest(int jMod)	
	JMap.setFlt(jMod, "fEnAdXpMultiplier", fEnAdXpMultiplier)
	JMap.setFlt(jMod, "fEnAdSkillFactor", fEnAdSkillFactor)
	JMap.setFlt(jMod, "fEnAdClothesMagickPerk", fEnAdClothesMagickPerk)
	JMap.setFlt(jMod, "fEnAdClothesOtherSkillsPerk", fEnAdClothesOtherSkillsPerk)
	JMap.setFlt(jMod, "fEnAdRechargeMultPerk", fEnAdRechargeMultPerk)

	; string[] strData = Utility.CreateStringArray(5, "")
	; strData[0] = fEnAdXpMultiplier
	; strData[1] = fEnAdSkillFactor
	; strData[2] = fEnAdClothesMagickPerk
	; strData[3] = fEnAdClothesOtherSkillsPerk
	; strData[4] = fEnAdRechargeMultPerk

	; return strData
endfunction

; OnRestoreRequest
; params:
; 	int jMod: a JMap handler initialized and containing your data.	
; 	string[]: an array representing your saved values.
function OnRestoreRequest(int jMod)
	; fEnAdXpMultiplier = a_strData[0] as float
	fEnAdXpMultiplier = JMap.getFlt(jMod, "fEnAdXpMultiplier")
	EnAdXpPerk.SetNthEntryValue(0, 0, fEnAdXpMultiplier)
	EnAdXpMultiplierBackup.SetValue(fEnAdXpMultiplier)
	
	; fEnAdSkillFactor = a_strData[1] as float
	fEnAdSkillFactor = JMap.getFlt(jMod, "fEnAdSkillFactor")
	Game.SetGameSettingFloat("fEnchantingSkillFactor", fEnAdSkillFactor)
	EnAdSkillFactorBackup.SetValue(fEnAdSkillFactor)
	
	; fEnAdClothesMagickPerk = a_strData[2] as float
	fEnAdClothesMagickPerk = JMap.getFlt(jMod, "fEnAdClothesMagickPerk")
	EnAdClothesMagickPerk.SetNthEntryValue(0, 0, fEnAdClothesMagickPerk)
	EnAdClothesMagickPerkBackup.SetValue(fEnAdClothesMagickPerk)
	
	; fEnAdClothesOtherSkillsPerk = a_strData[3] as float
	fEnAdClothesOtherSkillsPerk = JMap.getFlt(jMod, "fEnAdClothesOtherSkillsPerk")
	EnAdClothesOtherSkillsPerk.SetNthEntryValue(0, 0, fEnAdClothesOtherSkillsPerk)
	EnAdClothesOtherSkillsPerkBackup.SetValue(fEnAdClothesOtherSkillsPerk)
	
	; fEnAdRechargeMultPerk = a_strData[4] as float
	fEnAdRechargeMultPerk = JMap.getFlt(jMod, "fEnAdRechargeMultPerk")	
	EnAdRechargeMultPerk.SetNthEntryValue(0, 0, fEnAdRechargeMultPerk)
	EnAdRechargeMultPerkBackup.SetValue(fEnAdRechargeMultPerk)
endfunction


Event OnOptionSliderOpen(int optionSelected)
	If (optionSelected == iEnAdXpMultiplierOption)
		SetSliderDialogStartValue(fEnAdXpMultiplier)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)
	ElseIf (optionSelected == iEnAdSkillFactorOption)
		SetSliderDialogStartValue(fEnAdSkillFactor)
		SetSliderDialogDefaultValue(1.5)
		SetSliderDialogRange(1.0, 5.0)
		SetSliderDialogInterval(0.1)
	ElseIf (optionSelected == iEnAdClothesMagickPerkOption)
		SetSliderDialogStartValue(fEnAdClothesMagickPerk)
		SetSliderDialogDefaultValue(2.4)
		SetSliderDialogRange(1.0, 5)
		SetSliderDialogInterval(0.1)
	ElseIf (optionSelected == iEnAdClothesOtherSkillsPerkOption)
		SetSliderDialogStartValue(fEnAdClothesOtherSkillsPerk)
		SetSliderDialogDefaultValue(1.6)
		SetSliderDialogRange(1.0, 5.0)
		SetSliderDialogInterval(0.1)
	ElseIf (optionSelected == iEnAdRechargeMultPerkOption)
		SetSliderDialogStartValue(fEnAdRechargeMultPerk)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)
	endIf
EndEvent


Event OnOptionSliderAccept(int optionSelected, float newValue)
	If (optionSelected == iEnAdXpMultiplierOption)
		fEnAdXpMultiplier = newValue
		SetSliderOptionValue(iEnAdXpMultiplierOption, fEnAdXpMultiplier, "X{1}")
		EnAdXpPerk.SetNthEntryValue(0, 0, fEnAdXpMultiplier)
		EnAdXpMultiplierBackup.SetValue(fEnAdXpMultiplier)
	ElseIf (optionSelected == iEnAdSkillFactorOption)
		fEnAdSkillFactor = newValue
		SetSliderOptionValue(iEnAdSkillFactorOption, fEnAdSkillFactor, "X{1}")
		Game.SetGameSettingFloat("fEnchantingSkillFactor", fEnAdSkillFactor)
		EnAdSkillFactorBackup.SetValue(fEnAdSkillFactor)
	ElseIf (optionSelected == iEnAdClothesMagickPerkOption)
		fEnAdClothesMagickPerk = newValue
		SetSliderOptionValue(iEnAdClothesMagickPerkOption, fEnAdClothesMagickPerk, "X{1}")
		EnAdClothesMagickPerk.SetNthEntryValue(0, 0, fEnAdClothesMagickPerk)
		EnAdClothesMagickPerkBackup.SetValue(fEnAdClothesMagickPerk)
	ElseIf (optionSelected == iEnAdClothesOtherSkillsPerkOption)
		fEnAdClothesOtherSkillsPerk = newValue
		SetSliderOptionValue(iEnAdClothesOtherSkillsPerkOption, fEnAdClothesOtherSkillsPerk, "X{1}")
		EnAdClothesOtherSkillsPerk.SetNthEntryValue(0, 0, fEnAdClothesOtherSkillsPerk)
		EnAdClothesOtherSkillsPerkBackup.SetValue(fEnAdClothesOtherSkillsPerk)
	ElseIf (optionSelected == iEnAdRechargeMultPerkOption)
		fEnAdRechargeMultPerk = newValue
		SetSliderOptionValue(iEnAdRechargeMultPerkOption, fEnAdRechargeMultPerk, "X{1}")
		EnAdRechargeMultPerk.SetNthEntryValue(0, 0, fEnAdRechargeMultPerk)
		EnAdRechargeMultPerkBackup.SetValue(fEnAdRechargeMultPerk)
	Endif
EndEvent


Event OnOptionHighlight(int optionSelected)
	If (optionSelected == iEnAdXpMultiplierOption)
		SetInfoText("Experience gained when enchanting items is multiplied by this value. Vanilla:1.0 Mod default:1.0")
	ElseIf (optionSelected == iEnAdSkillFactorOption)
		SetInfoText("Magnitude/duration multiplier when Enchanting skill is at 100. (fEnchantingSkillFactor setting) Vanilla:1.25 Mod default:1.5")
	ElseIf (optionSelected == iEnAdClothesMagickPerkOption)
		SetInfoText("Magnitude multiplier when enchanting robes with Magicka related enchantments. Mod default:2.4")
	ElseIf (optionSelected == iEnAdClothesOtherSkillsPerkOption)
		SetInfoText("Magnitude multiplier when enchanting clothes and jewels with non-combat skill enchantments. Mod default:1.6")
	ElseIf (optionSelected == iEnAdRechargeMultPerkOption)
		SetInfoText("Multiplier for how much soul gems recharge your enchanted weapon. Mod default:1.0")
	Endif
EndEvent

