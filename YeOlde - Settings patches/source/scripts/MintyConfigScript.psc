Scriptname MintyConfigScript extends MintyLogging 
{ Helper script to basically provide getters/setters to the global variables } 

import game
import utility

GlobalVariable Property MintyIsForkLightningHostile Auto
GlobalVariable Property MintyIsForkLightningHostileDefault Auto
GlobalVariable Property MintyIsSheetLightningHostile Auto
GlobalVariable Property MintyIsSheetLightningHostileDefault Auto
GlobalVariable Property MintyFaceTarget Auto
GlobalVariable Property MintyIsForkEnabled Auto
GlobalVariable Property MintyIsForkEnabledDefault Auto
GlobalVariable Property MintyForkDistanceMin Auto
GlobalVariable Property MintyForkDistanceMinDefault Auto
GlobalVariable Property MintyForkDistanceMax Auto
GlobalVariable Property MintyForkDistanceMaxDefault Auto
GlobalVariable Property MintyForkFrequency Auto
GlobalVariable Property MintyForkFrequencyDefault Auto
GlobalVariable Property MintyForkBloom Auto
GlobalVariable Property MintyForkBloomDefault Auto
GlobalVariable Property MintyForkWait Auto
GlobalVariable Property MintyForkWaitDefault Auto
GlobalVariable Property MintyIsSheetEnabled Auto
GlobalVariable Property MintyIsSheetEnabledDefault Auto
GlobalVariable Property MintySheetDistanceMin Auto
GlobalVariable Property MintySheetDistanceMinDefault Auto
GlobalVariable Property MintySheetDistanceMax Auto
GlobalVariable Property MintySheetDistanceMaxDefault Auto
GlobalVariable Property MintySheetFrequency Auto
GlobalVariable Property MintySheetFrequencyDefault Auto
GlobalVariable Property MintySheetBloom Auto
GlobalVariable Property MintySheetBloomDefault Auto
GlobalVariable Property MintySheetWait Auto 
GlobalVariable Property MintySheetWaitDefault Auto 
GlobalVariable Property MintyWeatherCheckFrequency Auto
GlobalVariable Property MintyCellSize Auto
GlobalVariable Property MintyCellHeight Auto
GlobalVariable Property MintyStrikeDistance Auto
GlobalVariable Property MintyStrikeHeightByRegion Auto
GlobalVariable Property MintyDisableLegacyMenu Auto

GlobalVariable Property MintySheetSoundDelay Auto
GlobalVariable Property MintyForkSoundDelay Auto
GlobalVariable Property MAGProjectileStormVar Auto

Book Property MintyLightningConfigBook Auto
Spell Property MintyLightningConfigSpell Auto

int YES = 1
int NO = 0

	
Function InitBooks()
	if (!isLegacyMenuDisabled())
		Actor Player = GetPlayer()
		if (Player.GetItemCount(MintyLightningConfigBook) < 1)
			if (!Player.HasSpell(MintyLightningConfigSpell))
				Player.addItem(MintyLightningConfigBook)
			endif
		endif
	endif
EndFunction

Bool Function isLegacyMenuDisabled()
	return MintyDisableLegacyMenu.getValueInt() as Bool
EndFunction

Function disableLegacyMenu()
	MintyDisableLegacyMenu.SetValueInt(YES)
	Actor Player = GetPlayer()
	if (Player.HasSpell(MintyLightningConfigSpell))
		Player.removeSpell(MintyLightningConfigSpell)
	endif	
	Player.RemoveItem(MintyLightningConfigBook)
EndFunction

Function enableLegacyMenu()
	MintyDisableLegacyMenu.SetValueInt(NO)
	Actor Player = GetPlayer()
	if (!Player.HasSpell(MintyLightningConfigSpell))
		Player.addSpell(MintyLightningConfigSpell)
	endif
EndFunction

Bool Function shouldPlaceStrikeHeightsByRegion()
	return MintyStrikeHeightByRegion.getValueInt() as Bool
EndFunction


Bool Function shouldFaceTarget()
	return MintyFaceTarget.getValueInt() as Bool
EndFunction

Float Function getSheetSoundDelay()
	return MintySheetSoundDelay.getValue()
EndFunction

Function setSheetSoundDelay(Float delay)
	MintySheetSoundDelay.setValue(delay)
EndFunction

Function setForkSoundDelay(Float delay)
	MintyForkSoundDelay.setValue(delay)
EndFunction

Float Function getForkSoundDelay()
	return MintyForkSoundDelay.getValue()
EndFunction


Float Function getForkBloom()
	return MintyForkBloom.getValue()
EndFunction

Float Function getForkBloomDefault()
	return MintyForkBloomDefault.getValue()
EndFunction

Float Function getSheetBloom()
	return MintySheetBloom.getValue()
EndFunction

Float Function getSheetBloomDefault()
	return MintySheetBloomDefault.getValue()
EndFunction


Float Function getForkWait()
	return MintyForkWait.getValue()
EndFunction

Float Function getForkWaitDefault()
	return MintyForkWaitDefault.getValue()
EndFunction

Float Function getSheetWait()
	return MintySheetWait.getValue()
EndFunction

Float Function getSheetWaitDefault()
	return MintySheetWaitDefault.getValue()
EndFunction

Function setForkBloom(Float amount)
	MintyForkBloom.setValue(amount)
EndFunction


Function setSheetBloom(Float amount)
	MintySheetBloom.setValue(amount)
EndFunction


Function setForkWait(Float time)
	MintyForkWait.setValue(time)
EndFunction


Function setSheetWait(Float time)
	MintySheetWait.setValue(time)
EndFunction


Function setForkFrequency(Float freq)
	MintyForkFrequency.setValue(freq)
EndFunction


Function setSheetFrequency(Float freq)
	MintySheetFrequency.setValue(freq)
EndFunction


Function setForkMinDistance(int distance)
	MintyForkDistanceMin.setValueInt(distance)
EndFunction


Function setForkMaxDistance(int distance)
	MintyForkDistanceMax.setValueInt(distance)
EndFunction


Function setSheetMinDistance(int distance)
	MintySheetDistanceMin.setValueInt(distance)
EndFunction


Function setSheetMaxDistance(int distance)
	MintySheetDistanceMax.setValueInt(distance)
EndFunction


Function setForkLightningHostile()
	Info("Fork Lightning is now hostile!")
	MintyIsForkLightningHostile.SetValueInt(YES)
EndFunction


Function setForkLightningHarmless()
	Info("Fork Lightning is now harmless")
	MintyIsForkLightningHostile.SetValueInt(NO)
EndFunction

Function setSheetLightningHostile()
	Info("Sheet Lightning is now hostile!")
	MintyIsSheetLightningHostile.SetValueInt(YES)
EndFunction


Function setSheetLightningHarmless()
	Info("Sheet Lightning is now harmless")
	MintyIsSheetLightningHostile.SetValueInt(NO)
EndFunction

Function disableFork()
	MintyIsForkEnabled.setValueInt(NO)
EndFunction


Function enableFork()
	MintyIsForkEnabled.setValueInt(YES)
EndFunction


Function disableSheet()
	MintyIsSheetEnabled.setValueInt(NO)
EndFunction


Function enableSheet()
	MintyIsSheetEnabled.setValueInt(YES)
EndFunction


Float Function getStrikeDistance()
	return MintyStrikeDistance.GetValue() as Float
EndFunction


Float Function getCellSize()
	return MintyCellSize.GetValue() as Float
EndFunction


Float Function GetCellHeight()
	return Utility.RandomFloat(MintyCellHeight.GetValue(), (MintyCellHeight.GetValue() * 2)) as Float
EndFunction
	
	
Int Function getSheetDistanceMin()
	return MintySheetDistanceMin.GetValueInt() as Int
EndFunction

Int Function getSheetDistanceMinDefault()
	return MintySheetDistanceMinDefault.GetValueInt() as Int
EndFunction

Int Function getSheetDistanceMax()
	return MintySheetDistanceMax.GetValueInt() as Int
EndFunction

Int Function getSheetDistanceMaxDefault()
	return MintySheetDistanceMaxDefault.GetValueInt() as Int
EndFunction

Int Function getForkDistanceMin()
	return MintyForkDistanceMin.GetValueInt() as Int
EndFunction

Int Function getForkDistanceMinDefault()
	return MintyForkDistanceMinDefault.GetValueInt() as Int
EndFunction

Int Function getForkDistanceMax()
	return MintyForkDistanceMax.GetValueInt() as Int
EndFunction

Int Function getForkDistanceMaxDefault()
	return MintyForkDistanceMaxDefault.GetValueInt() as Int
EndFunction

Bool Function isForkEnabled()
	return MintyIsForkEnabled.GetValueInt() as Bool
EndFunction

Bool Function isForkEnabledDefault()
	return MintyIsForkEnabledDefault.GetValueInt() as Bool
EndFunction


Bool Function isSheetEnabled()
	return MintyIsSheetEnabled.GetValueInt() as Bool
EndFunction

Bool Function isSheetEnabledDefault()
	return MintyIsSheetEnabledDefault.GetValueInt() as Bool
EndFunction

Bool Function isForkLightningHostile() 
	return MintyIsForkLightningHostile.GetValueInt() as Bool
EndFunction

Bool Function isForkLightningHostileDefault() 
	return MintyIsForkLightningHostileDefault.GetValueInt() as Bool
EndFunction


Bool Function isSheetLightningHostile() 
	return MintyIsSheetLightningHostile.GetValueInt() as Bool
EndFunction

Bool Function isSheetLightningHostileDefault() 
	return MintyIsSheetLightningHostileDefault.GetValueInt() as Bool
EndFunction


Float Function getUpdateFrequencyFork() 
	return MintyForkFrequency.GetValue() as Float
EndFunction

Float Function getUpdateFrequencyForkDefault() 
	return MintyForkFrequencyDefault.GetValue() as Float
EndFunction

Float Function getForkFrequency()
	return MintyForkFrequency.GetValue() as Float
EndFunction

Float Function getForkFrequencyDefault()
	return MintyForkFrequencyDefault.GetValue() as Float
EndFunction

Float Function getUpdateFrequencySheet() 
	return MintySheetFrequency.GetValue() as Float
EndFunction

Float Function getUpdateFrequencySheetDefault() 
	return MintySheetFrequencyDefault.GetValue() as Float
EndFunction

Float Function getSheetFrequency() 
	return MintySheetFrequency.GetValue() as Float
EndFunction

Float Function getSheetFrequencyDefault() 
	return MintySheetFrequencyDefault.GetValue() as Float
EndFunction

Float Function getUpdateFrequencyWeatherCheck() 
	return MintyWeatherCheckFrequency.GetValue() as Float
EndFunction

function OnBackupRequest(int jMod)
	JMap.setFlt(jMod, "MintyIsForkLightningHostile", MintyIsForkLightningHostile.GetValue())
	JMap.setFlt(jMod, "MintyIsForkLightningHostileDefault", MintyIsForkLightningHostileDefault.GetValue())
	JMap.setFlt(jMod, "MintyIsSheetLightningHostile", MintyIsSheetLightningHostile.GetValue())
	JMap.setFlt(jMod, "MintyIsSheetLightningHostileDefault", MintyIsSheetLightningHostileDefault.GetValue())
	JMap.setFlt(jMod, "MintyFaceTarget", MintyFaceTarget.GetValue())
	JMap.setFlt(jMod, "MintyIsForkEnabled", MintyIsForkEnabled.GetValue())
	JMap.setFlt(jMod, "MintyIsForkEnabledDefault", MintyIsForkEnabledDefault.GetValue())
	JMap.setFlt(jMod, "MintyForkDistanceMin", MintyForkDistanceMin.GetValue())
	JMap.setFlt(jMod, "MintyForkDistanceMinDefault", MintyForkDistanceMinDefault.GetValue())
	JMap.setFlt(jMod, "MintyForkDistanceMax", MintyForkDistanceMax.GetValue())
	JMap.setFlt(jMod, "MintyForkDistanceMaxDefault", MintyForkDistanceMaxDefault.GetValue())
	JMap.setFlt(jMod, "MintyForkFrequency", MintyForkFrequency.GetValue())
	JMap.setFlt(jMod, "MintyForkFrequencyDefault", MintyForkFrequencyDefault.GetValue())
	JMap.setFlt(jMod, "MintyForkBloom", MintyForkBloom.GetValue())
	JMap.setFlt(jMod, "MintyForkBloomDefault", MintyForkBloomDefault.GetValue())
	JMap.setFlt(jMod, "MintyForkWait", MintyForkWait.GetValue())
	JMap.setFlt(jMod, "MintyForkWaitDefault", MintyForkWaitDefault.GetValue())
	JMap.setFlt(jMod, "MintyIsSheetEnabled", MintyIsSheetEnabled.GetValue())
	JMap.setFlt(jMod, "MintyIsSheetEnabledDefault", MintyIsSheetEnabledDefault.GetValue())
	JMap.setFlt(jMod, "MintySheetDistanceMin", MintySheetDistanceMin.GetValue())
	JMap.setFlt(jMod, "MintySheetDistanceMinDefault", MintySheetDistanceMinDefault.GetValue())
	JMap.setFlt(jMod, "MintySheetDistanceMax", MintySheetDistanceMax.GetValue())
	JMap.setFlt(jMod, "MintySheetDistanceMaxDefault", MintySheetDistanceMaxDefault.GetValue())
	JMap.setFlt(jMod, "MintySheetFrequency", MintySheetFrequency.GetValue())
	JMap.setFlt(jMod, "MintySheetFrequencyDefault", MintySheetFrequencyDefault.GetValue())
	JMap.setFlt(jMod, "MintySheetBloom", MintySheetBloom.GetValue())
	JMap.setFlt(jMod, "MintySheetBloomDefault", MintySheetBloomDefault.GetValue())
	JMap.setFlt(jMod, "MintySheetWait", MintySheetWait.GetValue())
	JMap.setFlt(jMod, "MintySheetWaitDefault", MintySheetWaitDefault.GetValue())
	JMap.setFlt(jMod, "MintyWeatherCheckFrequency", MintyWeatherCheckFrequency.GetValue())
	JMap.setFlt(jMod, "MintyCellSize", MintyCellSize.GetValue())
	JMap.setFlt(jMod, "MintyCellHeight", MintyCellHeight.GetValue())
	JMap.setFlt(jMod, "MintyStrikeDistance", MintyStrikeDistance.GetValue())
	JMap.setFlt(jMod, "MintyStrikeHeightByRegion", MintyStrikeHeightByRegion.GetValue())
	JMap.setFlt(jMod, "MintyDisableLegacyMenu", MintyDisableLegacyMenu.GetValue())
	JMap.setFlt(jMod, "MintySheetSoundDelay", MintySheetSoundDelay.GetValue())
	JMap.setFlt(jMod, "MintyForkSoundDelay", MintyForkSoundDelay.GetValue())
	JMap.setFlt(jMod, "MAGProjectileStormVar", MAGProjectileStormVar.GetValue())
	JMap.setFlt(jMod, "MintyLoggingEnabled", MintyLoggingEnabled.GetValue())
	JMap.setFlt(jMod, "MintyFeedBackEnabled", MintyFeedBackEnabled.GetValue())
endfunction


function OnRestoreRequest(int jMod)
	MintyIsForkLightningHostile.SetValue(JMap.getFlt(jMod, "MintyIsForkLightningHostile"))
	MintyIsForkLightningHostileDefault.SetValue(JMap.getFlt(jMod, "MintyIsForkLightningHostileDefault"))
	MintyIsSheetLightningHostile.SetValue(JMap.getFlt(jMod, "MintyIsSheetLightningHostile"))
	MintyIsSheetLightningHostileDefault.SetValue(JMap.getFlt(jMod, "MintyIsSheetLightningHostileDefault"))
	MintyFaceTarget.SetValue(JMap.getFlt(jMod, "MintyFaceTarget"))
	MintyIsForkEnabled.SetValue(JMap.getFlt(jMod, "MintyIsForkEnabled"))
	MintyIsForkEnabledDefault.SetValue(JMap.getFlt(jMod, "MintyIsForkEnabledDefault"))
	MintyForkDistanceMin.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMin"))
	MintyForkDistanceMinDefault.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMinDefault"))
	MintyForkDistanceMax.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMax"))
	MintyForkDistanceMaxDefault.SetValue(JMap.getFlt(jMod, "MintyForkDistanceMaxDefault"))
	MintyForkFrequency.SetValue(JMap.getFlt(jMod, "MintyForkFrequency"))
	MintyForkFrequencyDefault.SetValue(JMap.getFlt(jMod, "MintyForkFrequencyDefault"))
	MintyForkBloom.SetValue(JMap.getFlt(jMod, "MintyForkBloom"))
	MintyForkBloomDefault.SetValue(JMap.getFlt(jMod, "MintyForkBloomDefault"))
	MintyForkWait.SetValue(JMap.getFlt(jMod, "MintyForkWait"))
	MintyForkWaitDefault.SetValue(JMap.getFlt(jMod, "MintyForkWaitDefault"))
	MintyIsSheetEnabled.SetValue(JMap.getFlt(jMod, "MintyIsSheetEnabled"))
	MintyIsSheetEnabledDefault.SetValue(JMap.getFlt(jMod, "MintyIsSheetEnabledDefault"))
	MintySheetDistanceMin.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMin"))
	MintySheetDistanceMinDefault.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMinDefault"))
	MintySheetDistanceMax.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMax"))
	MintySheetDistanceMaxDefault.SetValue(JMap.getFlt(jMod, "MintySheetDistanceMaxDefault"))
	MintySheetFrequency.SetValue(JMap.getFlt(jMod, "MintySheetFrequency"))
	MintySheetFrequencyDefault.SetValue(JMap.getFlt(jMod, "MintySheetFrequencyDefault"))
	MintySheetBloom.SetValue(JMap.getFlt(jMod, "MintySheetBloom"))
	MintySheetBloomDefault.SetValue(JMap.getFlt(jMod, "MintySheetBloomDefault"))
	MintySheetWait.SetValue(JMap.getFlt(jMod, "MintySheetWait"))
	MintySheetWaitDefault.SetValue(JMap.getFlt(jMod, "MintySheetWaitDefault"))
	MintyWeatherCheckFrequency.SetValue(JMap.getFlt(jMod, "MintyWeatherCheckFrequency"))
	MintyCellSize.SetValue(JMap.getFlt(jMod, "MintyCellSize"))
	MintyCellHeight.SetValue(JMap.getFlt(jMod, "MintyCellHeight"))
	MintyStrikeDistance.SetValue(JMap.getFlt(jMod, "MintyStrikeDistance"))
	MintyStrikeHeightByRegion.SetValue(JMap.getFlt(jMod, "MintyStrikeHeightByRegion"))
	MintyDisableLegacyMenu.SetValue(JMap.getFlt(jMod, "MintyDisableLegacyMenu"))
	MintySheetSoundDelay.SetValue(JMap.getFlt(jMod, "MintySheetSoundDelay"))
	MintyForkSoundDelay.SetValue(JMap.getFlt(jMod, "MintyForkSoundDelay"))
	MAGProjectileStormVar.SetValue(JMap.getFlt(jMod, "MAGProjectileStormVar"))
	MintyLoggingEnabled.SetValue(JMap.getFlt(jMod, "MintyLoggingEnabled"))
	MintyFeedBackEnabled.SetValue(JMap.getFlt(jMod, "MintyFeedBackEnabled"))
endfunction