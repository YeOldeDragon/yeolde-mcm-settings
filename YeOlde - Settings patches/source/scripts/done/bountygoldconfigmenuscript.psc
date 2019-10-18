;/ Decompiled by Champollion V1.0.1
Source   : BountyGoldConfigMenuScript.psc
Modified : 2013-05-29 22:33:37
Compiled : 2013-05-29 22:46:14
User     : Corey
Computer : COREY-PC
/;
scriptName BountyGoldConfigMenuScript extends SKI_ConfigBase

;-- Properties --------------------------------------
globalvariable property ForswornBaseGold auto
globalvariable property DragonLeveledGold auto
globalvariable property DragonBaseGold auto
globalvariable property ForswornLeveledGold auto
globalvariable property BanditBaseGold auto
globalvariable property GiantLeveledGold auto
globalvariable property BanditLeveledGold auto
globalvariable property GiantBaseGold auto

;-- Variables ---------------------------------------
Int DRAGON_LEVELED_ID
Int DRAGON_BASE_ID
Int FORSWORN_LEVELED_ID
Int GIANT_BASE_ID
Int FORSWORN_BASE_ID
Int BANDIT_LEVELED_ID
Int GIANT_LEVELED_ID
Int BANDIT_BASE_ID

;-- Functions ---------------------------------------

function OnOptionHighlight(Int option)

	if option == BANDIT_BASE_ID || option == GIANT_BASE_ID || option == FORSWORN_BASE_ID || option == DRAGON_BASE_ID
		self.SetInfoText("Set the BASE amount of gold you get for killing this type of target")
	elseIf option == BANDIT_LEVELED_ID || option == GIANT_LEVELED_ID || option == FORSWORN_LEVELED_ID || option == DRAGON_LEVELED_ID
		self.SetInfoText("Set the amount of gold PER LEVEL you get in addition to the base gold.")
	endIf
endFunction

; Skipped compiler generated GotoState

function OnOptionSliderOpen(Int option)

	Float MaxBaseGold = 5000.00
	Float BaseGoldStep = 10.0000
	Float MaxLeveledGold = 500.000
	Float LeveledGoldStep = 5.00000
	if option == BANDIT_BASE_ID
		self.SetSliderDialogStartValue(BanditBaseGold.GetValue())
		self.SetSliderDialogDefaultValue(100 as Float)
		self.SetSliderDialogRange(0.000000, MaxBaseGold)
		self.SetSliderDialogInterval(BaseGoldStep)
	elseIf option == BANDIT_LEVELED_ID
		self.SetSliderDialogStartValue(BanditLeveledGold.GetValue())
		self.SetSliderDialogDefaultValue(0 as Float)
		self.SetSliderDialogRange(0.000000, MaxLeveledGold)
		self.SetSliderDialogInterval(LeveledGoldStep)
	elseIf option == GIANT_BASE_ID
		self.SetSliderDialogStartValue(GiantBaseGold.GetValue())
		self.SetSliderDialogDefaultValue(100 as Float)
		self.SetSliderDialogRange(0.000000, MaxBaseGold)
		self.SetSliderDialogInterval(BaseGoldStep)
	elseIf option == GIANT_LEVELED_ID
		self.SetSliderDialogStartValue(GiantLeveledGold.GetValue())
		self.SetSliderDialogDefaultValue(0 as Float)
		self.SetSliderDialogRange(0.000000, MaxLeveledGold)
		self.SetSliderDialogInterval(LeveledGoldStep)
	elseIf option == FORSWORN_BASE_ID
		self.SetSliderDialogStartValue(ForswornBaseGold.GetValue())
		self.SetSliderDialogDefaultValue(100 as Float)
		self.SetSliderDialogRange(0.000000, MaxBaseGold)
		self.SetSliderDialogInterval(BaseGoldStep)
	elseIf option == FORSWORN_LEVELED_ID
		self.SetSliderDialogStartValue(ForswornLeveledGold.GetValue())
		self.SetSliderDialogDefaultValue(0 as Float)
		self.SetSliderDialogRange(0.000000, MaxLeveledGold)
		self.SetSliderDialogInterval(LeveledGoldStep)
	elseIf option == DRAGON_BASE_ID
		self.SetSliderDialogStartValue(DragonBaseGold.GetValue())
		self.SetSliderDialogDefaultValue(100 as Float)
		self.SetSliderDialogRange(0.000000, MaxBaseGold)
		self.SetSliderDialogInterval(BaseGoldStep)
	elseIf option == DRAGON_LEVELED_ID
		self.SetSliderDialogStartValue(DragonLeveledGold.GetValue())
		self.SetSliderDialogDefaultValue(0 as Float)
		self.SetSliderDialogRange(0.000000, MaxLeveledGold)
		self.SetSliderDialogInterval(LeveledGoldStep)
	endIf
endFunction

function OnPageReset(String page)

	if page == ""
		self.LoadCustomContent("BountyGold/BountyGold.dds", 0.000000, 0.000000)
		return 
	else
		self.UnloadCustomContent()
	endIf
	self.SetCursorFillMode(self.TOP_TO_BOTTOM)
	self.AddHeaderOption("Base Gold", 0)
	BANDIT_BASE_ID = self.AddSliderOption("Bandits", BanditBaseGold.GetValue(), "{0} Gold", 0)
	GIANT_BASE_ID = self.AddSliderOption("Giants", GiantBaseGold.GetValue(), "{0} Gold", 0)
	FORSWORN_BASE_ID = self.AddSliderOption("Forsworn", ForswornBaseGold.GetValue(), "{0} Gold", 0)
	DRAGON_BASE_ID = self.AddSliderOption("Dragons", DragonBaseGold.GetValue(), "{0} Gold", 0)
	self.SetCursorPosition(1)
	self.AddHeaderOption("Leveled Gold", 0)
	BANDIT_LEVELED_ID = self.AddSliderOption("Bandits", BanditLeveledGold.GetValue(), "{0} Gold", 0)
	GIANT_LEVELED_ID = self.AddSliderOption("Giants", GiantLeveledGold.GetValue(), "{0} Gold", 0)
	FORSWORN_LEVELED_ID = self.AddSliderOption("Forsworn", ForswornLeveledGold.GetValue(), "{0} Gold", 0)
	DRAGON_LEVELED_ID = self.AddSliderOption("Dragons", DragonLeveledGold.GetValue(), "{0} Gold", 0)
endFunction

function OnBackupRequest(int jMod)
	JMap.setFlt(jMod, "BanditBaseGold", BanditBaseGold.GetValue())
	JMap.setFlt(jMod, "GiantBaseGold", GiantBaseGold.GetValue())
	JMap.setFlt(jMod, "ForswornBaseGold", ForswornBaseGold.GetValue())
	JMap.setFlt(jMod, "BanditBaseGold", DragonBaseGold.GetValue())
	
	JMap.setFlt(jMod, "BanditLeveledGold", BanditLeveledGold.GetValue())
	JMap.setFlt(jMod, "GiantLeveledGold", GiantLeveledGold.GetValue())
	JMap.setFlt(jMod, "ForswornLeveledGold", ForswornLeveledGold.GetValue())
	JMap.setFlt(jMod, "DragonLeveledGold", DragonLeveledGold.GetValue())
endfunction

function OnRestoreRequest(int jMod)
	BanditBaseGold.SetValue(JMap.getFlt(jMod, "BanditBaseGold"))
	GiantBaseGold.SetValue(JMap.getFlt(jMod, "GiantBaseGold"))
	ForswornBaseGold.SetValue(JMap.getFlt(jMod, "ForswornBaseGold"))
	DragonBaseGold.SetValue(JMap.getFlt(jMod, "BanditBaseGold"))
	
	BanditLeveledGold.SetValue(JMap.getFlt(jMod, "BanditLeveledGold"))
	GiantLeveledGold.SetValue(JMap.getFlt(jMod, "GiantLeveledGold"))
	ForswornLeveledGold.SetValue(JMap.getFlt(jMod, "ForswornLeveledGold"))
	DragonLeveledGold.SetValue(JMap.getFlt(jMod, "DragonLeveledGold"))
endfunction

function OnConfigInit()

	Pages = new String[1]
	Pages[0] = "Options"
endFunction

function OnOptionSliderAccept(Int option, Float value)

	if option == BANDIT_BASE_ID
		BanditBaseGold.SetValue(value)
		self.SetSliderOptionValue(BANDIT_BASE_ID, value, "{0} Gold", false)
	elseIf option == BANDIT_LEVELED_ID
		BanditLeveledGold.SetValue(value)
		self.SetSliderOptionValue(BANDIT_LEVELED_ID, value, "{0} Gold", false)
	elseIf option == GIANT_BASE_ID
		GiantBaseGold.SetValue(value)
		self.SetSliderOptionValue(GIANT_BASE_ID, value, "{0} Gold", false)
	elseIf option == GIANT_LEVELED_ID
		GiantLeveledGold.SetValue(value)
		self.SetSliderOptionValue(GIANT_LEVELED_ID, value, "{0} Gold", false)
	elseIf option == FORSWORN_BASE_ID
		ForswornBaseGold.SetValue(value)
		self.SetSliderOptionValue(FORSWORN_BASE_ID, value, "{0} Gold", false)
	elseIf option == FORSWORN_LEVELED_ID
		ForswornLeveledGold.SetValue(value)
		self.SetSliderOptionValue(FORSWORN_LEVELED_ID, value, "{0} Gold", false)
	elseIf option == DRAGON_BASE_ID
		DragonBaseGold.SetValue(value)
		self.SetSliderOptionValue(DRAGON_BASE_ID, value, "{0} Gold", false)
	elseIf option == DRAGON_LEVELED_ID
		DragonLeveledGold.SetValue(value)
		self.SetSliderOptionValue(DRAGON_LEVELED_ID, value, "{0} Gold", false)
	endIf
endFunction

; Skipped compiler generated GetState
