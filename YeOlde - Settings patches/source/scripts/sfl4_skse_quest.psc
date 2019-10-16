;/ Decompiled by Champollion V1.0.1
Source   : SFL4_SKSE_Quest.psc
Modified : 2017-01-07 14:28:58
Compiled : 2017-01-07 14:29:00
User     : Maximilian
Computer : MARUNAE
/;
scriptName SFL4_SKSE_Quest extends SKI_ConfigBase

;-- Properties --------------------------------------
String property WCT_DynamicOptions auto
globalvariable property WCT_Ability_Global_InjuryRektOMeter auto
String property WCT_L_Text_To auto
String property WCT_Ability_Desc_FBS auto
String property WCT_Modifier_Desc_DisableMassive auto
String property WCT_Ability_Text_InjuryThreshold_Chance auto
String property WCT_Modifier_Desc_DisableDirectionalDamage auto
String property WCT_StaminaOptions auto
String property WCT_Modifier_Text_DisableAAO auto
String property WCT_Ability_Text_FBS auto
globalvariable property WCT_Ability_Global_InjuryRektOMeter_Threshold auto
globalvariable property WCT_Modifier_Global_DisableDirectionalDamage auto
String property WCT_Ability_Desc_InjuryThreshold_HP2 auto
globalvariable property WCT_Ability_Global_InjuryThreshold_HP2 auto
String property WCT_Quest_Desc_DifficultyWatchdog auto
String property WCT_Ability_Text_InjuryThreshold_HP2 auto
String property WCT_VH_Text_By auto
globalvariable property WCT_VH_Global_By auto
String property WCT_Modifier_Text_DisableDirectionalDamage auto
String property WCT_N_Text_To auto
String property WCT_Ability_Desc_DisableDynamicCombat auto
String property WCT_VE_Text_To auto
String property WCT_Ability_Text_InjuryRektOMeter_Threshold auto
String property WCT_Stagger_Text_DisableStagger auto
String property WCT_Ability_Desc_DisableTimedBlock auto
globalvariable property WCT_VE_Global_To auto
globalvariable property WCT_Ability_Global_Injuries auto
String property WCT_Parse_Stamcost auto
String property WCT_Parse_PercentHealth auto
String property WCT_Ability_Text_Injuries auto
globalvariable property WCT_N_Global_To auto
String property WCT_N_Text_By auto
String property WCT_Ability_Text_DisableBowStaminaDrain auto
String property WCT_Ability_Desc_AttacksCostStamina_Bow auto
String property WCT_Desc_To auto
globalvariable property WCT_E_Global_By auto
String property WCT_TimedBlock_Desc_SquelchTimedBlockMessage auto
String property WCT_Ability_Text_InjuryThreshold_HP1 auto
String property WCT_InjuryOptions auto
globalvariable property WCT_Modifier_Global_DisableAAO auto
String property WCT_Stagger_Desc_DisableStagger auto
String property WCT_Ability_Desc_DisableRegenFlux auto
String property WCT_Ability_Text_DisableRegenFlux auto
globalvariable property WCT_L_Global_By auto
globalvariable property WCT_L_Global_To auto
String property WCT_Modifier_Desc_DisableMelee auto
String property WCT_E_Text_By auto
globalvariable property WCT_Stagger_Global_DisableStagger auto
String property WCT_Modifier_Desc_DisableAAO auto
globalvariable property WCT_VE_Global_By auto
String property WCT_Ability_Desc_InjuryThreshold_HP1 auto
String property WCT_Ability_Desc_InjuryThreshold_Chance auto
String property WCT_Ability_Text_DisableBowInterrupt auto
globalvariable property WCT_Ability_Global_InjuryThreshold_HP1 auto
globalvariable property WCT_E_Global_To auto
String property WCT_Ability_Desc_InjuryRektOMeter_Threshold auto
globalvariable property WCT_Ability_Global_DisableRegenFlux auto
String property WCT_Ability_Text_InjuryRektOMeter_Chance auto
globalvariable property WCT_Ability_Global_DisableTimedBlock auto
String property WCT_H_Text_To auto
String property WCT_Ability_Text_DisableSwimStaminaDrain auto
String property WCT_Ability_Desc_InjuryRektOMeter auto
String property WCT_Parse_ByTo auto
String property WCT_Modifier_Text_DisableMassive auto
globalvariable property WCT_Quest_Global_DifficultyWatchdog auto
globalvariable property WCT_H_Global_To auto
String property WCT_Ability_Desc_DisableSwimStaminaDrain auto
String property WCT_Ability_Desc_DisableSpeedPenaltyAtLowStamina auto
globalvariable property WCT_Ability_Global_AttacksCostStamina_2H auto
String property WCT_Ability_Text_DisableSpeedPenaltyAtLowStamina auto
String property WCT_Ability_Desc_Injuries auto
String property WCT_VH_Text_To auto
String property WCT_DifficultyOptions auto
globalvariable property WCT_Ability_Global_DisableBowInterrupt auto
String property WCT_Parse_Chance auto
globalvariable property WCT_Ability_Global_InjuryThreshold_Chance auto
String property WCT_Ability_Desc_AttacksCostStamina_2H auto
String property WCT_Ability_Text_DisableTimedBlock auto
globalvariable property WCT_Ability_Global_DisableSwimStaminaDrain auto
globalvariable property WCT_Modifier_Global_DisableDynamicDamage auto
String property WCT_Ability_Text_AttacksCostStamina_1H auto
String property WCT_Modifier_Text_DisableMelee auto
String property WCT_L_Text_By auto
globalvariable property WCT_VH_Global_To auto
globalvariable property WCT_Ability_Global_DisableDynamicCombat auto
String property WCT_Ability_Desc_InjuryRektOMeter_Chance auto
String property WCT_H_Text_By auto
globalvariable property WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina auto
String property WCT_Parse_Percent auto
String property WCT_E_Text_To auto
String property WCT_Modifier_Desc_DisableDynamicDamage auto
String property WCT_VE_Text_By auto
String property WCT_Quest_Text_DifficultyWatchdog auto
String property WCT_TimedBlock_Text_SquelchTimedBlockMessage auto
globalvariable property WCT_Ability_Global_DisableBowStaminaDrain auto
sfl4_maintenance_quest property WCT auto
String property WCT_Ability_Text_AttacksCostStamina_Bow auto
globalvariable property WCT_Ability_Global_InjuryRektOMeter_Chance auto
globalvariable property WCT_Modifier_Global_DisableMelee auto
globalvariable property WCT_Ability_Global_AttacksCostStamina_Bow auto
globalvariable property WCT_Modifier_Global_DisableMassive auto
String property WCT_Ability_Text_InjuryRektOMeter auto
String property WCT_Desc_By auto
String property WCT_Ability_Text_DisableDynamicCombat auto
String property WCT_Ability_Desc_DisableBowInterrupt auto
globalvariable property WCT_TimedBlock_Global_SquelchTimedBlockMessage auto
String property WCT_Modifier_Text_DisableDynamicDamage auto
globalvariable property WCT_Ability_Global_FBS auto
globalvariable property WCT_Ability_Global_AttacksCostStamina_1H auto
globalvariable property WCT_H_Global_By auto
String property WCT_Ability_Desc_AttacksCostStamina_1H auto
String property WCT_TimedBlockOptions auto
String property WCT_Ability_Text_AttacksCostStamina_2H auto
String property WCT_ModifierOptions auto
globalvariable property WCT_N_Global_By auto
String property WCT_Ability_Desc_DisableBowStaminaDrain auto

;-- Variables ---------------------------------------
Int WCT_H_T_By
Int T_DisableMelee
Int T_DisableTimedBlock
Int T_AttacksCostStamina_Bow
Int STit
Int T_DisableDynamicDamage
Int T_DisableBowInterrupt
Int T_Injuries
Int T_DisableSpeedPenaltyAtLowStamina
Int T_InjuryThreshold_Chance
Int T_AttacksCostStamina_2H
Int T_DisableDirectionalDamage
Int SRit
Int WCT_H_T_To
Int WCT_L_T_By
Int T_InjuryRektOMeter
Int T_InjuryThreshold_HP1
Int T_FBS
Int T_DisableBowStaminaDrain
Int T_InjuryThreshold_HP2
Int WCT_E_T_To
Int SDif
Int SBck
Int T_DisableMassive
Int WCT_L_T_To
Int WCT_VH_T_By
Int WCT_N_T_To
Int WCT_N_T_By
Int T_DisableAAO
Int WCT_E_T_By
Int T_DisableSwimStaminaDrain
Int WCT_VE_T_By
Int T_DifficultyWatchdog
Int T_SquelchTimedBlockMessage
Int T_InjuryRektOMeter_Threshold
Int T_DisableStagger
Int T_AttacksCostStamina_1H
Int WCT_VH_T_To
Int T_InjuryRektOMeter_Chance
Int SClo
Int SInj
Int T_DisableRegenFlux
Int T_DisableDynamicCombat
Int WCT_VE_T_To

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnOptionDefault(Int akOp)

	if akOp == T_DisableBowStaminaDrain
		WCT_Ability_Global_DisableBowStaminaDrain.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableBowStaminaDrain, false, false)
	elseIf akOp == T_DisableDynamicCombat
		WCT_Ability_Global_DisableDynamicCombat.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableDynamicCombat, false, false)
	elseIf akOp == T_Injuries
		WCT_Ability_Global_Injuries.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_Injuries, false, false)
	elseIf akOp == T_DisableBowInterrupt
		WCT_Ability_Global_DisableBowInterrupt.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableBowInterrupt, false, false)
	elseIf akOp == T_InjuryRektOMeter
		WCT_Ability_Global_InjuryRektOMeter.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_InjuryRektOMeter, false, false)
	elseIf akOp == T_DisableRegenFlux
		WCT_Ability_Global_DisableRegenFlux.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableRegenFlux, false, false)
	elseIf akOp == T_DisableSpeedPenaltyAtLowStamina
		WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableSpeedPenaltyAtLowStamina, false, false)
	elseIf akOp == T_DisableSwimStaminaDrain
		WCT_Ability_Global_DisableSwimStaminaDrain.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableSwimStaminaDrain, false, false)
	elseIf akOp == T_DisableTimedBlock
		WCT_Ability_Global_DisableTimedBlock.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableTimedBlock, false, false)
	elseIf akOp == T_DisableAAO
		WCT_Modifier_Global_DisableAAO.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableAAO, false, false)
	elseIf akOp == T_DisableDirectionalDamage
		WCT_Modifier_Global_DisableDirectionalDamage.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableDirectionalDamage, false, false)
	elseIf akOp == T_DisableDynamicDamage
		WCT_Modifier_Global_DisableDynamicDamage.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableDynamicDamage, false, false)
	elseIf akOp == T_DisableMassive
		WCT_Modifier_Global_DisableMassive.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableMassive, false, false)
	elseIf akOp == T_DisableMelee
		WCT_Modifier_Global_DisableMelee.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableMelee, false, false)
	elseIf akOp == T_DisableStagger
		WCT_Stagger_Global_DisableStagger.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DisableStagger, false, false)
	elseIf akOp == T_SquelchTimedBlockMessage
		WCT_TimedBlock_Global_SquelchTimedBlockMessage.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_SquelchTimedBlockMessage, false, false)
	elseIf akOp == T_DifficultyWatchdog
		WCT_Quest_Global_DifficultyWatchdog.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_DifficultyWatchdog, false, false)
		WCT.StopPolling()
	elseIf akOp == T_FBS
		WCT_Ability_Global_FBS.SetValue(0 as Float)
		CHid()
		SetToggleOptionValue(T_FBS, false, false)
	endIf
endFunction

function OnPageReset(String akPage)

	SetCursorFillMode(TOP_TO_BOTTOM)
	CHid()
	SetCursorPosition(0)
	AddHeaderOption(WCT_DynamicOptions, 0)
	T_DisableDynamicCombat = AddToggleOption(WCT_Ability_Text_DisableDynamicCombat, WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool, 0)
	AddEmptyOption()
	T_DisableRegenFlux = AddToggleOption(WCT_Ability_Text_DisableRegenFlux, WCT_Ability_Global_DisableRegenFlux.GetValue() as Bool, SClo)
	T_DisableSpeedPenaltyAtLowStamina = AddToggleOption(WCT_Ability_Text_DisableSpeedPenaltyAtLowStamina, WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.GetValue() as Bool, SClo)
	T_DisableSwimStaminaDrain = AddToggleOption(WCT_Ability_Text_DisableSwimStaminaDrain, WCT_Ability_Global_DisableSwimStaminaDrain.GetValue() as Bool, SClo)
	T_DisableBowInterrupt = AddToggleOption(WCT_Ability_Text_DisableBowInterrupt, WCT_Ability_Global_DisableBowInterrupt.GetValue() as Bool, SClo)
	T_FBS = AddToggleOption(WCT_Ability_Text_FBS, WCT_Ability_Global_FBS.GetValue() as Bool, SClo)
	AddEmptyOption()
	AddHeaderOption(WCT_StaminaOptions, 0)
	T_AttacksCostStamina_1H = AddSliderOption(WCT_Ability_Text_AttacksCostStamina_1H, WCT_Ability_Global_AttacksCostStamina_1H.GetValue(), WCT_Parse_Stamcost, SClo)
	T_AttacksCostStamina_2H = AddSliderOption(WCT_Ability_Text_AttacksCostStamina_2H, WCT_Ability_Global_AttacksCostStamina_2H.GetValue(), WCT_Parse_Stamcost, SClo)
	T_AttacksCostStamina_Bow = AddSliderOption(WCT_Ability_Text_AttacksCostStamina_Bow, WCT_Ability_Global_AttacksCostStamina_Bow.GetValue(), WCT_Parse_Stamcost, SClo)
	T_DisableBowStaminaDrain = AddToggleOption(WCT_Ability_Text_DisableBowStaminaDrain, WCT_Ability_Global_DisableBowStaminaDrain.GetValue() as Bool, SClo)
	AddEmptyOption()
	AddHeaderOption(WCT_InjuryOptions, 0)
	T_Injuries = AddToggleOption(WCT_Ability_Text_Injuries, WCT_Ability_Global_Injuries.GetValue() as Bool, SClo)
	AddEmptyOption()
	T_InjuryThreshold_Chance = AddSliderOption(WCT_Ability_Text_InjuryThreshold_Chance, WCT_Ability_Global_InjuryThreshold_Chance.GetValue(), WCT_Parse_Chance, STit)
	T_InjuryThreshold_HP1 = AddSliderOption(WCT_Ability_Text_InjuryThreshold_HP1, WCT_Ability_Global_InjuryThreshold_HP1.GetValue() * 100 as Float, WCT_Parse_PercentHealth, STit)
	T_InjuryThreshold_HP2 = AddSliderOption(WCT_Ability_Text_InjuryThreshold_HP2, WCT_Ability_Global_InjuryThreshold_HP2.GetValue() * 100 as Float, WCT_Parse_PercentHealth, STit)
	AddEmptyOption()
	T_InjuryRektOMeter = AddToggleOption(WCT_Ability_Text_InjuryRektOMeter, WCT_Ability_Global_InjuryRektOMeter.GetValue() as Bool, SInj)
	T_InjuryRektOMeter_Chance = AddSliderOption(WCT_Ability_Text_InjuryRektOMeter_Chance, WCT_Ability_Global_InjuryRektOMeter_Chance.GetValue(), WCT_Parse_Chance, SRit)
	T_InjuryRektOMeter_Threshold = AddSliderOption(WCT_Ability_Text_InjuryRektOMeter_Threshold, WCT_Ability_Global_InjuryRektOMeter_Threshold.GetValue(), WCT_Parse_PercentHealth, SRit)
	AddEmptyOption()
	T_DisableStagger = AddToggleOption(WCT_Stagger_Text_DisableStagger, WCT_Stagger_Global_DisableStagger.GetValue() as Bool, SInj)
	AddEmptyOption()
	AddHeaderOption(WCT_TimedBlockOptions, 0)
	T_DisableTimedBlock = AddToggleOption(WCT_Ability_Text_DisableTimedBlock, WCT_Ability_Global_DisableTimedBlock.GetValue() as Bool, SClo)
	AddEmptyOption()
	T_SquelchTimedBlockMessage = AddToggleOption(WCT_TimedBlock_Text_SquelchTimedBlockMessage, WCT_TimedBlock_Global_SquelchTimedBlockMessage.GetValue() as Bool, SClo)
	SetCursorPosition(1)
	AddHeaderOption(WCT_ModifierOptions, 0)
	T_DisableAAO = AddToggleOption(WCT_Modifier_Text_DisableAAO, WCT_Modifier_Global_DisableAAO.GetValue() as Bool, 0)
	T_DisableDirectionalDamage = AddToggleOption(WCT_Modifier_Text_DisableDirectionalDamage, WCT_Modifier_Global_DisableDirectionalDamage.GetValue() as Bool, 0)
	T_DisableDynamicDamage = AddToggleOption(WCT_Modifier_Text_DisableDynamicDamage, WCT_Modifier_Global_DisableDynamicDamage.GetValue() as Bool, 0)
	T_DisableMelee = AddToggleOption(WCT_Modifier_Text_DisableMelee, WCT_Modifier_Global_DisableMelee.GetValue() as Bool, 0)
	T_DisableMassive = AddToggleOption(WCT_Modifier_Text_DisableMassive, WCT_Modifier_Global_DisableMassive.GetValue() as Bool, 0)
	AddEmptyOption()
	AddHeaderOption(WCT_DifficultyOptions, 0)
	T_DifficultyWatchdog = AddToggleOption(WCT_Quest_Text_DifficultyWatchdog, WCT_Quest_Global_DifficultyWatchdog.GetValue() as Bool, 0)
	WCT_VE_T_By = AddSliderOption(WCT_VE_Text_By, WCT_VE_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_VE_T_To = AddSliderOption(WCT_VE_Text_To, WCT_VE_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_E_T_By = AddSliderOption(WCT_E_Text_By, WCT_E_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_E_T_To = AddSliderOption(WCT_E_Text_To, WCT_E_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_N_T_By = AddSliderOption(WCT_N_Text_By, WCT_N_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_N_T_To = AddSliderOption(WCT_N_Text_To, WCT_N_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_H_T_By = AddSliderOption(WCT_H_Text_By, WCT_H_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_H_T_To = AddSliderOption(WCT_H_Text_To, WCT_H_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_VH_T_By = AddSliderOption(WCT_VH_Text_By, WCT_VH_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_VH_T_To = AddSliderOption(WCT_VH_Text_To, WCT_VH_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_L_T_By = AddSliderOption(WCT_L_Text_By, WCT_L_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_L_T_To = AddSliderOption(WCT_L_Text_To, WCT_L_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	AddEmptyOption()
endFunction

function OnBackupRequest(int jMod)
	JMap.setFlt(jMod, "WCT_Ability_Global_DisableDynamicCombat", WCT_Ability_Global_DisableDynamicCombat.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_DisableRegenFlux", WCT_Ability_Global_DisableRegenFlux.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina", WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_DisableSwimStaminaDrain", WCT_Ability_Global_DisableSwimStaminaDrain.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_DisableBowInterrupt", WCT_Ability_Global_DisableBowInterrupt.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_FBS", WCT_Ability_Global_FBS.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_1H", WCT_Ability_Global_AttacksCostStamina_1H.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_2H", WCT_Ability_Global_AttacksCostStamina_2H.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_Bow", WCT_Ability_Global_AttacksCostStamina_Bow.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_DisableBowStaminaDrain", WCT_Ability_Global_DisableBowStaminaDrain.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_Injuries", WCT_Ability_Global_Injuries.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_InjuryThreshold_Chance", WCT_Ability_Global_InjuryThreshold_Chance.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_InjuryThreshold_HP1", WCT_Ability_Global_InjuryThreshold_HP1.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_InjuryThreshold_HP2", WCT_Ability_Global_InjuryThreshold_HP2.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter", WCT_Ability_Global_InjuryRektOMeter.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter_Chance", WCT_Ability_Global_InjuryRektOMeter_Chance.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter_Threshold", WCT_Ability_Global_InjuryRektOMeter_Threshold.GetValue())
	JMap.setFlt(jMod, "WCT_Stagger_Global_DisableStagger", WCT_Stagger_Global_DisableStagger.GetValue())
	JMap.setFlt(jMod, "WCT_Ability_Global_DisableTimedBlock", WCT_Ability_Global_DisableTimedBlock.GetValue())
	JMap.setFlt(jMod, "WCT_TimedBlock_Global_SquelchTimedBlockMessage", WCT_TimedBlock_Global_SquelchTimedBlockMessage.GetValue())
	JMap.setFlt(jMod, "WCT_Modifier_Global_DisableAAO", WCT_Modifier_Global_DisableAAO.GetValue())
	JMap.setFlt(jMod, "WCT_Modifier_Global_DisableDirectionalDamage", WCT_Modifier_Global_DisableDirectionalDamage.GetValue())
	JMap.setFlt(jMod, "WCT_Modifier_Global_DisableDynamicDamage", WCT_Modifier_Global_DisableDynamicDamage.GetValue())
	JMap.setFlt(jMod, "WCT_Modifier_Global_DisableMelee", WCT_Modifier_Global_DisableMelee.GetValue())
	JMap.setFlt(jMod, "WCT_Modifier_Global_DisableMassive", WCT_Modifier_Global_DisableMassive.GetValue())
	JMap.setFlt(jMod, "WCT_Quest_Global_DifficultyWatchdog", WCT_Quest_Global_DifficultyWatchdog.GetValue())
	JMap.setFlt(jMod, "WCT_VE_Global_By", WCT_VE_Global_By.GetValue())
	JMap.setFlt(jMod, "WCT_VE_Global_To", WCT_VE_Global_To.GetValue())
	JMap.setFlt(jMod, "WCT_E_Global_By", WCT_E_Global_By.GetValue())
	JMap.setFlt(jMod, "WCT_E_Global_To", WCT_E_Global_To.GetValue())
	JMap.setFlt(jMod, "WCT_N_Global_By", WCT_N_Global_By.GetValue())
	JMap.setFlt(jMod, "WCT_N_Global_To", WCT_N_Global_To.GetValue())
	JMap.setFlt(jMod, "WCT_H_Global_By", WCT_H_Global_By.GetValue())
	JMap.setFlt(jMod, "WCT_H_Global_To", WCT_H_Global_To.GetValue())
	JMap.setFlt(jMod, "WCT_VH_Global_By", WCT_VH_Global_By.GetValue())
	JMap.setFlt(jMod, "WCT_VH_Global_To", WCT_VH_Global_To.GetValue())
	JMap.setFlt(jMod, "WCT_L_Global_By", WCT_L_Global_By.GetValue())
	JMap.setFlt(jMod, "WCT_L_Global_To", WCT_L_Global_To.GetValue())
endfunction

function OnRestoreRequest(int jMod)
    WCT_Ability_Global_DisableDynamicCombat.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableDynamicCombat"))
	WCT_Ability_Global_DisableRegenFlux.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableRegenFlux"))
	WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina"))
	WCT_Ability_Global_DisableSwimStaminaDrain.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableSwimStaminaDrain"))
	WCT_Ability_Global_DisableBowInterrupt.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableBowInterrupt"))
	WCT_Ability_Global_FBS.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_FBS"))
	WCT_Ability_Global_AttacksCostStamina_1H.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_1H"))
	WCT_Ability_Global_AttacksCostStamina_2H.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_2H"))
	WCT_Ability_Global_AttacksCostStamina_Bow.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_AttacksCostStamina_Bow"))
	WCT_Ability_Global_DisableBowStaminaDrain.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableBowStaminaDrain"))
	WCT_Ability_Global_Injuries.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_Injuries"))
	WCT_Ability_Global_InjuryThreshold_Chance.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryThreshold_Chance"))
	WCT_Ability_Global_InjuryThreshold_HP1.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryThreshold_HP1"))
	WCT_Ability_Global_InjuryThreshold_HP2.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryThreshold_HP2"))
	WCT_Ability_Global_InjuryRektOMeter.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter"))
	WCT_Ability_Global_InjuryRektOMeter_Chance.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter_Chance"))
	WCT_Ability_Global_InjuryRektOMeter_Threshold.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_InjuryRektOMeter_Threshold"))
	WCT_Stagger_Global_DisableStagger.SetValue(JMap.getFlt(jMod, "WCT_Stagger_Global_DisableStagger"))
	WCT_Ability_Global_DisableTimedBlock.SetValue(JMap.getFlt(jMod, "WCT_Ability_Global_DisableTimedBlock"))
	WCT_TimedBlock_Global_SquelchTimedBlockMessage.SetValue(JMap.getFlt(jMod, "WCT_TimedBlock_Global_SquelchTimedBlockMessage"))
	WCT_Modifier_Global_DisableAAO.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableAAO"))
	WCT_Modifier_Global_DisableDirectionalDamage.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableDirectionalDamage"))
	WCT_Modifier_Global_DisableDynamicDamage.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableDynamicDamage"))
	WCT_Modifier_Global_DisableMelee.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableMelee"))
	WCT_Modifier_Global_DisableMassive.SetValue(JMap.getFlt(jMod, "WCT_Modifier_Global_DisableMassive"))
	WCT_Quest_Global_DifficultyWatchdog.SetValue(JMap.getFlt(jMod, "WCT_Quest_Global_DifficultyWatchdog"))
	WCT_VE_Global_By.SetValue(JMap.getFlt(jMod, "WCT_VE_Global_By"))
	WCT_VE_Global_To.SetValue(JMap.getFlt(jMod, "WCT_VE_Global_To"))
	WCT_E_Global_By.SetValue(JMap.getFlt(jMod, "WCT_E_Global_By"))
	WCT_E_Global_To.SetValue(JMap.getFlt(jMod, "WCT_E_Global_To"))
	WCT_N_Global_By.SetValue(JMap.getFlt(jMod, "WCT_N_Global_By"))
	WCT_N_Global_To.SetValue(JMap.getFlt(jMod, "WCT_N_Global_To"))
	WCT_H_Global_By.SetValue(JMap.getFlt(jMod, "WCT_H_Global_By"))
	WCT_H_Global_To.SetValue(JMap.getFlt(jMod, "WCT_H_Global_To"))
	WCT_VH_Global_By.SetValue(JMap.getFlt(jMod, "WCT_VH_Global_By"))
	WCT_VH_Global_To.SetValue(JMap.getFlt(jMod, "WCT_VH_Global_To"))
	WCT_L_Global_By.SetValue(JMap.getFlt(jMod, "WCT_L_Global_By"))
	WCT_L_Global_To.SetValue(JMap.getFlt(jMod, "WCT_L_Global_To"))
endfunction

function OnOptionHighlight(Int akOp)

	if akOp == T_AttacksCostStamina_1H
		SetInfoText(WCT_Ability_Desc_AttacksCostStamina_1H)
	elseIf akOp == T_AttacksCostStamina_2H
		SetInfoText(WCT_Ability_Desc_AttacksCostStamina_2H)
	elseIf akOp == T_AttacksCostStamina_Bow
		SetInfoText(WCT_Ability_Desc_AttacksCostStamina_Bow)
	elseIf akOp == T_DisableBowStaminaDrain
		SetInfoText(WCT_Ability_Desc_DisableBowStaminaDrain)
	elseIf akOp == T_DisableDynamicCombat
		SetInfoText(WCT_Ability_Desc_DisableDynamicCombat)
	elseIf akOp == T_Injuries
		SetInfoText(WCT_Ability_Desc_Injuries)
	elseIf akOp == T_DisableBowInterrupt
		SetInfoText(WCT_Ability_Desc_DisableBowInterrupt)
	elseIf akOp == T_InjuryRektOMeter
		SetInfoText(WCT_Ability_Desc_InjuryRektOMeter)
	elseIf akOp == T_DisableRegenFlux
		SetInfoText(WCT_Ability_Desc_DisableRegenFlux)
	elseIf akOp == T_DisableSpeedPenaltyAtLowStamina
		SetInfoText(WCT_Ability_Desc_DisableSpeedPenaltyAtLowStamina)
	elseIf akOp == T_DisableSwimStaminaDrain
		SetInfoText(WCT_Ability_Desc_DisableSwimStaminaDrain)
	elseIf akOp == T_DisableTimedBlock
		SetInfoText(WCT_Ability_Desc_DisableTimedBlock)
	elseIf akOp == T_InjuryRektOMeter_Chance
		SetInfoText(WCT_Ability_Desc_InjuryRektOMeter_Chance)
	elseIf akOp == T_InjuryRektOMeter_Threshold
		SetInfoText(WCT_Ability_Desc_InjuryRektOMeter_Threshold)
	elseIf akOp == T_InjuryThreshold_Chance
		SetInfoText(WCT_Ability_Desc_InjuryThreshold_Chance)
	elseIf akOp == T_InjuryThreshold_HP1
		SetInfoText(WCT_Ability_Desc_InjuryThreshold_HP1)
	elseIf akOp == T_InjuryThreshold_HP2
		SetInfoText(WCT_Ability_Desc_InjuryThreshold_HP2)
	elseIf akOp == T_DisableAAO
		SetInfoText(WCT_Modifier_Desc_DisableAAO)
	elseIf akOp == T_DisableDirectionalDamage
		SetInfoText(WCT_Modifier_Desc_DisableDirectionalDamage)
	elseIf akOp == T_DisableDynamicDamage
		SetInfoText(WCT_Modifier_Desc_DisableDynamicDamage)
	elseIf akOp == T_DisableMassive
		SetInfoText(WCT_Modifier_Desc_DisableMassive)
	elseIf akOp == T_DisableMelee
		SetInfoText(WCT_Modifier_Desc_DisableMelee)
	elseIf akOp == T_DisableStagger
		SetInfoText(WCT_Stagger_Desc_DisableStagger)
	elseIf akOp == T_SquelchTimedBlockMessage
		SetInfoText(WCT_TimedBlock_Desc_SquelchTimedBlockMessage)
	elseIf akOp == T_DifficultyWatchdog
		SetInfoText(WCT_Quest_Desc_DifficultyWatchdog)
	elseIf akOp == T_FBS
		SetInfoText(WCT_Ability_Desc_FBS)
	elseIf akOp == WCT_VE_T_By
		SetInfoText(WCT_Desc_By)
	elseIf akOp == WCT_VE_T_To
		SetInfoText(WCT_Desc_To)
	elseIf akOp == WCT_E_T_By
		SetInfoText(WCT_Desc_By)
	elseIf akOp == WCT_E_T_To
		SetInfoText(WCT_Desc_To)
	elseIf akOp == WCT_N_T_By
		SetInfoText(WCT_Desc_By)
	elseIf akOp == WCT_N_T_To
		SetInfoText(WCT_Desc_To)
	elseIf akOp == WCT_H_T_By
		SetInfoText(WCT_Desc_By)
	elseIf akOp == WCT_H_T_To
		SetInfoText(WCT_Desc_To)
	elseIf akOp == WCT_VH_T_By
		SetInfoText(WCT_Desc_By)
	elseIf akOp == WCT_VH_T_To
		SetInfoText(WCT_Desc_To)
	elseIf akOp == WCT_L_T_By
		SetInfoText(WCT_Desc_By)
	elseIf akOp == WCT_L_T_To
		SetInfoText(WCT_Desc_To)
	endIf
endFunction

function OnOptionSliderOpen(Int akOp)

	if akOp == T_AttacksCostStamina_1H
		SetSliderDialogStartValue(WCT_Ability_Global_AttacksCostStamina_1H.GetValue())
		SetSliderDialogDefaultValue(5 as Float)
		SetSliderDialogRange(0 as Float, 40 as Float)
		SetSliderDialogInterval(1 as Float)
	elseIf akOp == T_AttacksCostStamina_2H
		SetSliderDialogStartValue(WCT_Ability_Global_AttacksCostStamina_2H.GetValue())
		SetSliderDialogDefaultValue(10 as Float)
		SetSliderDialogRange(0 as Float, 40 as Float)
		SetSliderDialogInterval(1 as Float)
	elseIf akOp == T_AttacksCostStamina_Bow
		SetSliderDialogStartValue(WCT_Ability_Global_AttacksCostStamina_Bow.GetValue())
		SetSliderDialogDefaultValue(5 as Float)
		SetSliderDialogRange(0 as Float, 40 as Float)
		SetSliderDialogInterval(1 as Float)
	elseIf akOp == T_InjuryRektOMeter_Chance
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryRektOMeter_Chance.GetValue())
		SetSliderDialogDefaultValue(50 as Float)
		SetSliderDialogRange(5 as Float, 100 as Float)
		SetSliderDialogInterval(5 as Float)
	elseIf akOp == T_InjuryRektOMeter_Threshold
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryRektOMeter_Threshold.GetValue())
		SetSliderDialogDefaultValue(30 as Float)
		SetSliderDialogRange(5 as Float, 95 as Float)
		SetSliderDialogInterval(5 as Float)
	elseIf akOp == T_InjuryThreshold_Chance
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryThreshold_Chance.GetValue())
		SetSliderDialogDefaultValue(30 as Float)
		SetSliderDialogRange(5 as Float, 100 as Float)
		SetSliderDialogInterval(5 as Float)
	elseIf akOp == T_InjuryThreshold_HP1
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryThreshold_HP1.GetValue() * 100 as Float)
		SetSliderDialogDefaultValue(30 as Float)
		SetSliderDialogRange(0 as Float, 95 as Float)
		SetSliderDialogInterval(5 as Float)
	elseIf akOp == T_InjuryThreshold_HP2
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryThreshold_HP2.GetValue() * 100 as Float)
		SetSliderDialogDefaultValue(15 as Float)
		SetSliderDialogRange(0 as Float, 95 as Float)
		SetSliderDialogInterval(5 as Float)
	elseIf akOp == WCT_VE_T_By
		SetSliderDialogStartValue(WCT_VE_Global_By.GetValue())
		SetSliderDialogDefaultValue(2.50000)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_VE_T_To
		SetSliderDialogStartValue(WCT_VE_Global_To.GetValue())
		SetSliderDialogDefaultValue(1 as Float)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_E_T_By
		SetSliderDialogStartValue(WCT_E_Global_By.GetValue())
		SetSliderDialogDefaultValue(2 as Float)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_E_T_To
		SetSliderDialogStartValue(WCT_E_Global_To.GetValue())
		SetSliderDialogDefaultValue(1.25000)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_N_T_By
		SetSliderDialogStartValue(WCT_N_Global_By.GetValue())
		SetSliderDialogDefaultValue(1.50000)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_N_T_To
		SetSliderDialogStartValue(WCT_N_Global_To.GetValue())
		SetSliderDialogDefaultValue(1.50000)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_H_T_By
		SetSliderDialogStartValue(WCT_H_Global_By.GetValue())
		SetSliderDialogDefaultValue(1.25000)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_H_T_To
		SetSliderDialogStartValue(WCT_H_Global_To.GetValue())
		SetSliderDialogDefaultValue(2 as Float)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_VH_T_By
		SetSliderDialogStartValue(WCT_VH_Global_By.GetValue())
		SetSliderDialogDefaultValue(1 as Float)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_VH_T_To
		SetSliderDialogStartValue(WCT_VH_Global_To.GetValue())
		SetSliderDialogDefaultValue(2.50000)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_L_T_By
		SetSliderDialogStartValue(WCT_L_Global_By.GetValue())
		SetSliderDialogDefaultValue(0.500000)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	elseIf akOp == WCT_L_T_To
		SetSliderDialogStartValue(WCT_L_Global_To.GetValue())
		SetSliderDialogDefaultValue(3.50000)
		SetSliderDialogRange(0.250000, 8 as Float)
		SetSliderDialogInterval(0.250000)
	endIf
endFunction

; Skipped compiler generated GetState

function OnOptionSliderAccept(Int akOp, Float akValue)

	if akOp == T_AttacksCostStamina_1H
		WCT_Ability_Global_AttacksCostStamina_1H.SetValue(akValue)
		CHid()
		SetSliderOptionValue(T_AttacksCostStamina_1H, akValue, WCT_Parse_Stamcost, false)
	elseIf akOp == T_AttacksCostStamina_2H
		WCT_Ability_Global_AttacksCostStamina_2H.SetValue(akValue)
		CHid()
		SetSliderOptionValue(T_AttacksCostStamina_2H, akValue, WCT_Parse_Stamcost, false)
	elseIf akOp == T_AttacksCostStamina_Bow
		WCT_Ability_Global_AttacksCostStamina_Bow.SetValue(akValue)
		CHid()
		SetSliderOptionValue(T_AttacksCostStamina_Bow, akValue, WCT_Parse_Stamcost, false)
	elseIf akOp == T_InjuryRektOMeter_Chance
		WCT_Ability_Global_InjuryRektOMeter_Chance.SetValue(akValue)
		CHid()
		SetSliderOptionValue(T_InjuryRektOMeter_Chance, akValue, WCT_Parse_Chance, false)
	elseIf akOp == T_InjuryRektOMeter_Threshold
		WCT_Ability_Global_InjuryRektOMeter_Threshold.SetValue(akValue)
		CHid()
		SetSliderOptionValue(T_InjuryRektOMeter_Threshold, akValue, WCT_Parse_PercentHealth, false)
	elseIf akOp == T_InjuryThreshold_Chance
		WCT_Ability_Global_InjuryThreshold_Chance.SetValue(akValue)
		CHid()
		SetSliderOptionValue(T_InjuryThreshold_Chance, akValue, WCT_Parse_Chance, false)
	elseIf akOp == T_InjuryThreshold_HP1
		WCT_Ability_Global_InjuryThreshold_HP1.SetValue(akValue / 100 as Float)
		CHid()
		SetSliderOptionValue(T_InjuryThreshold_HP1, akValue, WCT_Parse_PercentHealth, false)
	elseIf akOp == T_InjuryThreshold_HP2
		WCT_Ability_Global_InjuryThreshold_HP2.SetValue(akValue / 100 as Float)
		CHid()
		SetSliderOptionValue(T_InjuryThreshold_HP2, akValue, WCT_Parse_PercentHealth, false)
	else
		if akOp == WCT_VE_T_By
			WCT_VE_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_VE_T_By, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_VE_T_To
			WCT_VE_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_VE_T_To, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_E_T_By
			WCT_E_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_E_T_By, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_E_T_To
			WCT_E_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_E_T_To, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_N_T_By
			WCT_N_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_N_T_By, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_N_T_To
			WCT_N_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_N_T_To, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_H_T_By
			WCT_H_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_H_T_By, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_H_T_To
			WCT_H_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_H_T_To, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_VH_T_By
			WCT_VH_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_VH_T_By, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_VH_T_To
			WCT_VH_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_VH_T_To, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_L_T_By
			WCT_L_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_L_T_By, akValue, WCT_Parse_ByTo, false)
		elseIf akOp == WCT_L_T_To
			WCT_L_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_L_T_To, akValue, WCT_Parse_ByTo, false)
		endIf
		WCT.UGS()
	endIf
endFunction

function CHid()

	if WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool == false
		SClo = OPTION_FLAG_NONE
	else
		SClo = OPTION_FLAG_DISABLED
	endIf
	if WCT_Ability_Global_Injuries.GetValue() as Bool == false && WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool == false
		SInj = OPTION_FLAG_NONE
	else
		SInj = OPTION_FLAG_DISABLED
	endIf
	if WCT_Ability_Global_InjuryRektOMeter.GetValue() as Bool == true && WCT_Ability_Global_Injuries.GetValue() as Bool == false && WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool == false
		SRit = OPTION_FLAG_NONE
	else
		SRit = OPTION_FLAG_DISABLED
	endIf
	if WCT_Ability_Global_InjuryRektOMeter.GetValue() as Bool == false && WCT_Ability_Global_Injuries.GetValue() as Bool == false && WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool == false
		STit = OPTION_FLAG_NONE
	else
		STit = OPTION_FLAG_DISABLED
	endIf
	if WCT_Ability_Global_DisableTimedBlock.GetValue() as Bool == false && WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool == false
		SBck = OPTION_FLAG_NONE
	else
		SBck = OPTION_FLAG_DISABLED
	endIf
	if WCT_Quest_Global_DifficultyWatchdog.GetValue() as Bool == true
		SDif = OPTION_FLAG_NONE
	else
		SDif = OPTION_FLAG_DISABLED
	endIf
	SetOptionFlags(T_AttacksCostStamina_1H, SClo, false)
	SetOptionFlags(T_AttacksCostStamina_2H, SClo, false)
	SetOptionFlags(T_AttacksCostStamina_Bow, SClo, false)
	SetOptionFlags(T_DisableBowStaminaDrain, SClo, false)
	SetOptionFlags(T_Injuries, SClo, false)
	SetOptionFlags(T_DisableRegenFlux, SClo, false)
	SetOptionFlags(T_DisableSpeedPenaltyAtLowStamina, SClo, false)
	SetOptionFlags(T_DisableSwimStaminaDrain, SClo, false)
	SetOptionFlags(T_DisableTimedBlock, SClo, false)
	SetOptionFlags(T_InjuryRektOMeter, SInj, false)
	SetOptionFlags(T_InjuryRektOMeter_Chance, SRit, false)
	SetOptionFlags(T_InjuryRektOMeter_Threshold, SRit, false)
	SetOptionFlags(T_DisableBowInterrupt, SClo, false)
	SetOptionFlags(T_InjuryThreshold_Chance, STit, false)
	SetOptionFlags(T_InjuryThreshold_HP1, STit, false)
	SetOptionFlags(T_InjuryThreshold_HP2, STit, false)
	SetOptionFlags(T_DisableStagger, SInj, false)
	SetOptionFlags(T_SquelchTimedBlockMessage, SBck, false)
	SetOptionFlags(WCT_VE_T_By, SDif, false)
	SetOptionFlags(WCT_VE_T_To, SDif, false)
	SetOptionFlags(WCT_E_T_By, SDif, false)
	SetOptionFlags(WCT_E_T_To, SDif, false)
	SetOptionFlags(WCT_N_T_By, SDif, false)
	SetOptionFlags(WCT_N_T_To, SDif, false)
	SetOptionFlags(WCT_H_T_By, SDif, false)
	SetOptionFlags(WCT_H_T_To, SDif, false)
	SetOptionFlags(WCT_VH_T_By, SDif, false)
	SetOptionFlags(WCT_VH_T_To, SDif, false)
	SetOptionFlags(WCT_L_T_By, SDif, false)
	SetOptionFlags(WCT_L_T_To, SDif, false)
endFunction

function OnOptionSelect(Int akOp)

	if akOp == T_DisableBowStaminaDrain
		WCT_Ability_Global_DisableBowStaminaDrain.SetValue(1 as Float - WCT_Ability_Global_DisableBowStaminaDrain.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableBowStaminaDrain, WCT_Ability_Global_DisableBowStaminaDrain.GetValue() as Bool, false)
	elseIf akOp == T_DisableDynamicCombat
		WCT_Ability_Global_DisableDynamicCombat.SetValue(1 as Float - WCT_Ability_Global_DisableDynamicCombat.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableDynamicCombat, WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool, false)
	elseIf akOp == T_Injuries
		WCT_Ability_Global_Injuries.SetValue(1 as Float - WCT_Ability_Global_Injuries.GetValue())
		CHid()
		SetToggleOptionValue(T_Injuries, WCT_Ability_Global_Injuries.GetValue() as Bool, false)
	elseIf akOp == T_DisableBowInterrupt
		WCT_Ability_Global_DisableBowInterrupt.SetValue(1 as Float - WCT_Ability_Global_DisableBowInterrupt.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableBowInterrupt, WCT_Ability_Global_DisableBowInterrupt.GetValue() as Bool, false)
	elseIf akOp == T_InjuryRektOMeter
		WCT_Ability_Global_InjuryRektOMeter.SetValue(1 as Float - WCT_Ability_Global_InjuryRektOMeter.GetValue())
		CHid()
		SetToggleOptionValue(T_InjuryRektOMeter, WCT_Ability_Global_InjuryRektOMeter.GetValue() as Bool, false)
	elseIf akOp == T_DisableRegenFlux
		WCT_Ability_Global_DisableRegenFlux.SetValue(1 as Float - WCT_Ability_Global_DisableRegenFlux.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableRegenFlux, WCT_Ability_Global_DisableRegenFlux.GetValue() as Bool, false)
	elseIf akOp == T_DisableSpeedPenaltyAtLowStamina
		WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.SetValue(1 as Float - WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableSpeedPenaltyAtLowStamina, WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.GetValue() as Bool, false)
	elseIf akOp == T_DisableSwimStaminaDrain
		WCT_Ability_Global_DisableSwimStaminaDrain.SetValue(1 as Float - WCT_Ability_Global_DisableSwimStaminaDrain.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableSwimStaminaDrain, WCT_Ability_Global_DisableSwimStaminaDrain.GetValue() as Bool, false)
	elseIf akOp == T_DisableTimedBlock
		WCT_Ability_Global_DisableTimedBlock.SetValue(1 as Float - WCT_Ability_Global_DisableTimedBlock.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableTimedBlock, WCT_Ability_Global_DisableTimedBlock.GetValue() as Bool, false)
	elseIf akOp == T_DisableAAO
		WCT_Modifier_Global_DisableAAO.SetValue(1 as Float - WCT_Modifier_Global_DisableAAO.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableAAO, WCT_Modifier_Global_DisableAAO.GetValue() as Bool, false)
	elseIf akOp == T_DisableDirectionalDamage
		WCT_Modifier_Global_DisableDirectionalDamage.SetValue(1 as Float - WCT_Modifier_Global_DisableDirectionalDamage.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableDirectionalDamage, WCT_Modifier_Global_DisableDirectionalDamage.GetValue() as Bool, false)
	elseIf akOp == T_DisableDynamicDamage
		WCT_Modifier_Global_DisableDynamicDamage.SetValue(1 as Float - WCT_Modifier_Global_DisableDynamicDamage.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableDynamicDamage, WCT_Modifier_Global_DisableDynamicDamage.GetValue() as Bool, false)
	elseIf akOp == T_DisableMassive
		WCT_Modifier_Global_DisableMassive.SetValue(1 as Float - WCT_Modifier_Global_DisableMassive.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableMassive, WCT_Modifier_Global_DisableMassive.GetValue() as Bool, false)
	elseIf akOp == T_DisableMelee
		WCT_Modifier_Global_DisableMelee.SetValue(1 as Float - WCT_Modifier_Global_DisableMelee.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableMelee, WCT_Modifier_Global_DisableMelee.GetValue() as Bool, false)
	elseIf akOp == T_DisableStagger
		WCT_Stagger_Global_DisableStagger.SetValue(1 as Float - WCT_Stagger_Global_DisableStagger.GetValue())
		CHid()
		SetToggleOptionValue(T_DisableStagger, WCT_Stagger_Global_DisableStagger.GetValue() as Bool, false)
	elseIf akOp == T_SquelchTimedBlockMessage
		WCT_TimedBlock_Global_SquelchTimedBlockMessage.SetValue(1 as Float - WCT_TimedBlock_Global_SquelchTimedBlockMessage.GetValue())
		CHid()
		SetToggleOptionValue(T_SquelchTimedBlockMessage, WCT_TimedBlock_Global_SquelchTimedBlockMessage.GetValue() as Bool, false)
	elseIf akOp == T_DifficultyWatchdog
		WCT_Quest_Global_DifficultyWatchdog.SetValue(1 as Float - WCT_Quest_Global_DifficultyWatchdog.GetValue())
		CHid()
		Bool NewWatchdog = WCT_Quest_Global_DifficultyWatchdog.GetValue() as Bool
		SetToggleOptionValue(T_DifficultyWatchdog, NewWatchdog, false)
		if NewWatchdog
			WCT.StartPolling()
		else
			WCT.StopPolling()
		endIf
	elseIf akOp == T_FBS
		WCT_Ability_Global_FBS.SetValue(1 as Float - WCT_Ability_Global_FBS.GetValue())
		CHid()
		SetToggleOptionValue(T_FBS, WCT_Ability_Global_FBS.GetValue() as Bool, false)
	endIf
endFunction
