Scriptname _3PCOMCMScript extends SKI_ConfigBase

int Property _leftKey = 30 Auto
int Property _rightKey = 32 Auto
int Property _forwardKey = 17 Auto
int Property _backwardKey = 31 Auto
int Property _gamepad = 272 Auto
int Property _sneakKey = 29 Auto

Quest Property SmoothCameraFollowQuest Auto
SmoothCameraFollow Property scf Auto

; Sheathed parameters
float Property _defaultSheathedX Auto
float Property _sheathedY Auto
float Property _sheathedXNeg Auto
float Property _sheathedX Auto
float Property _sheathedZ Auto
float Property _sheathedZNeg Auto
bool Property _autoThirdSheathed Auto
bool Property _autoFirstSheathed Auto
bool Property _crosshairSheathed Auto
float defaultSheathedX = 25.0
float sheathedY = -5.0
float sheathedXNeg = 0.0
float sheathedX = 30.0
float sheathedZ = 0.0
float sheathedZNeg = 0.0
bool autoThirdSheathed = false
bool autoFirstSheathed = false
bool crosshairSheathed = true

; Melee parameters
float Property _defaultMeleeX Auto
float Property _meleeY Auto
float Property _meleeXNeg Auto
float Property _meleeX Auto
float Property _meleeZoom Auto
float Property _meleeZ Auto
float Property _meleeZNeg Auto
bool Property _autoThirdMelee Auto
bool Property _autoFirstMelee Auto
bool Property _crosshairMelee Auto
float defaultMeleeX = 0.0
float meleeY = -5.0
float meleeXNeg = 75.0
float meleeX = 75.0
float meleeZoom = 0.0
float meleeZ = 10.0
float meleeZNeg = 10.0
bool autoThirdMelee = false
bool autoFirstMelee = false
bool crosshairMelee = true

; Ranged parameters
bool Property _enableRanged Auto
bool Property _countMagicAsRanged  Auto
float Property _defaultRangedX Auto
float Property _rangedY Auto
float Property _rangedXNeg Auto
float Property _rangedX Auto
float Property _rangedZoom Auto
float Property _rangedZ Auto
float Property _rangedZNeg Auto
bool Property _autoThirdRanged Auto
bool Property _autoFirstRanged Auto
bool Property _crosshairRanged Auto
float Property _crosshairRangedX Auto
float Property _crosshairRangedY Auto
float Property _crosshairSneakRangedX Auto
float Property _crosshairSneakRangedY Auto
bool enableRanged = false
bool countMagicAsRanged = true
float defaultRangedX = 0.0
float rangedY = -5.0
float rangedXNeg = 75.0
float rangedX = 75.0
float rangedZoom = 0.0
float rangedZ = 10.0
float rangedZNeg = 10.0
bool autoThirdRanged = false
bool autoFirstRanged = false
bool crosshairRanged = true
float crosshairRangedX = 0.0
float crosshairRangedY = 0.0
float crosshairSneakRangedX = 0.0
float crosshairSneakRangedY = 0.0

; Sneak parameters
bool Property _sneakYOnly Auto
bool Property _enableSneak Auto
float Property _defaultSneakX Auto
float Property _sneakY Auto
float Property _sneakXNeg Auto
float Property _sneakX Auto
float Property _sneakZoom Auto
float Property _sneakZ Auto
float Property _sneakZNeg Auto
bool Property _sneakOverridesRanged Auto
bool Property _sneakOverridesMelee Auto
bool sneakYOnly = true
bool enableSneak = false
float defaultSneakX = 0.0
float sneakY = -0.0
float sneakXNeg = 75.0
float sneakX = 75.0
float sneakZoom = 0.0
float sneakZ = 10.0
float sneakZNeg = 10.0
bool sneakOverridesRanged = false
bool sneakOverridesMelee = false

; Other parameters
float Property _defaultFOV Auto
float Property _camHorizontalSpeed Auto
float Property _minZoom Auto
float Property _maxZoom Auto
bool Property _enableGamePad Auto
float defaultFOV = 85.0
float camHorizontalSpeed = 15.0
float minZoom = 100.0
float maxZoom = 280.0
bool enableGamePad = false

; MCM elements --------------------------------
int iDefaultFOV
int iCamSpeed
int iMinZoom
int iMaxZoom
int iEnableGamepad
int iLeftKey
int iRightKey
int iForwardKey
int iBackwardKey

int iDefaultSheathedX
int iSheathedY
int iSheathedXNeg
int iSheathedX
int iAutoThirdSheathed
int iAutoFirstSheathed
int iCrosshairSheathed
int iSheathedZ
int iSheathedZNeg

int iDefaultMeleeX
int iMeleeY
int iMeleeXNeg
int iMeleeX
int iMeleeZoom
int iAutoThirdMelee
int iAutoFirstMelee
int iCrosshairMelee
int iMeleeZ
int iMeleeZNeg

int iEnableRanged
int iCountMagicAsRanged
int iDefaultRangedX
int iRangedY
int iRangedXNeg
int iRangedX
int iRangedZoom
int iAutoThirdRanged
int iAutoFirstRanged
int iCrosshairRangedX
int iCrosshairRangedY
int iCrosshairSneakRangedX
int iCrosshairSneakRangedY
int iRangedZ
int iRangedZNeg
int iCrosshairRanged

int iSneakYOnly
int iEnableSneak
int iDefaultSneakX
int iSneakY
int iSneakXNeg
int iSneakX
int iSNeakZoom
int iSneakZ
int iSneakZNeg
int iSneakOverridesRanged
int iSneakOverridesMelee
int iSneakKey

int iUninstall

float crosshair_defaultX
float crosshair_defaultY
float crosshair_defaultSneakX
float crosshair_defaultSneakY

Event OnConfigInit()
	crosshair_defaultX = UI.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x")
	crosshair_defaultY = UI.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y")
	crosshair_defaultSneakX = UI.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x")
	crosshair_defaultSneakY = UI.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y")

	Pages = new string[6]
	Pages[0] = "General Settings"
	Pages[1] = "Sheathed"
	Pages[2] = "Melee"
	Pages[3] = "Ranged"
	Pages[4] = "Sneak"
	Pages[5] = "Uninstall"
	
	_defaultSheathedX = defaultSheathedX
	_sheathedY = sheathedY
	_sheathedXNeg = sheathedXNeg
	_sheathedX = sheathedX
	_autoThirdSheathed = autoThirdSheathed
	_autoFirstSheathed = autoFirstSheathed
	_crosshairSheathed = crosshairSheathed
	_sheathedZ = sheathedZ
	_sheathedZNeg = sheathedZNeg
	
	_defaultMeleeX = defaultMeleeX
	_meleeY = meleeY
	_meleeXNeg = meleeXNeg
	_meleeX = meleeX
	_meleeZoom = meleeZoom
	_autoThirdMelee = autoThirdMelee
	_autoFirstMelee = autoFirstMelee
	_crosshairMelee = crosshairMelee
	_meleeZ = meleeZ
	_meleeZNeg = meleeZNeg
	
	_enableRanged = enableRanged
	_countMagicAsRanged = countMagicAsRanged
	_defaultRangedX = defaultRangedX
	_rangedY = rangedY
	_rangedXNeg = rangedXNeg
	_rangedX = rangedX
	_rangedZoom = rangedZoom
	_autoThirdRanged = autoThirdRanged
	_autoFirstRanged = autoFirstRanged
	_crosshairRanged = crosshairRanged
	_crosshairRangedX = crosshairRangedX
	_crosshairRangedY = crosshairRangedY
	_crosshairSneakRangedX = crosshairSneakRangedX
	_crosshairSneakRangedY = crosshairSneakRangedY
	_rangedZ = rangedZ
	_rangedZNeg = rangedZNeg
	
	_enableSneak = enableSneak
	_sneakYOnly = sneakYOnly
	_defaultSneakX = defaultSneakX
	_sneakY = sneakY
	_sneakXNeg = sneakXNeg
	_sneakX = sneakX
	_sneakZoom = sneakZoom
	_sneakZ = sneakZ
	_sneakZNeg = sneakZNeg
	_sneakOverridesRanged = sneakOverridesRanged
	_sneakOverridesMelee = sneakOverridesMelee
	
	_defaultFOV = defaultFOV
	_camHorizontalSpeed = camHorizontalSpeed
	_minZoom = minZoom
	_maxZoom = maxZoom
	_enableGamePad = enableGamePad
EndEvent

Event OnPageReset(string page)
	If (page == "General Settings")
		SetCursorFillMode(TOP_TO_BOTTOM)		
		iDefaultFOV = AddSliderOption("Default FOV", defaultFOV)
		iCamSpeed = AddSliderOption("Camera speed", camHorizontalSpeed)
		iMinZoom = AddSliderOption("Min zoom", minZoom)
		iMaxZoom = AddSliderOption("Max zoom", maxZoom)
		iEnableGamepad = AddToggleOption("Gamepad", enableGamePad)
		iLeftKey = AddKeyMapOption("Left Key", _leftKey)
		iRightKey = AddKeyMapOption("Right Key", _rightKey)
		iForwardKey = AddKeyMapOption("Forward Key", _forwardKey)
		iBackwardKey = AddKeyMapOption("Backward Key", _backwardKey)
		iSneakKey = AddKeyMapOption("Sneak Key", _sneakKey)
	ElseIf (page == "Sheathed")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Camera Offsets")
		iSheathedY = AddSliderOption("Default Y", sheathedY)
		iDefaultSheathedX = AddSliderOption("Default X", defaultSheathedX)
		iSheathedXNeg = AddSliderOption("Positive X Offset", sheathedXNeg)
		iSheathedX = AddSliderOption("Negative X Offset", sheathedX)
		;iSheathedZNeg = AddSliderOption("Positive Z Offset", sheathedZNeg)
		;iSheathedZ = AddSliderOption("Negative Z Offset", sheathedZ)
		AddHeaderOption("POV Settings")
		iAutoThirdSheathed = AddToggleOption("Auto 3rd Person", autoThirdSheathed)
		iAutoFirstSheathed = AddToggleOption("Auto 1st Person", autoFirstSheathed)
		AddheaderOption("Crosshair Settings")
		iCrosshairSheathed = AddToggleOption("Crosshair", crosshairSheathed)
	ElseIf (page == "Melee")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Camera Offsets")
		iMeleeY = AddSliderOption("Default Y", meleeY)
		iDefaultMeleeX = AddSliderOption("Default X", defaultMeleeX)
		iMeleeXNeg = AddSliderOption("Positive X Offset", meleeXNeg)
		iMeleeX = AddSliderOption("Negative X Offset", meleeX)
		iMeleeZNeg = AddSliderOption("Positive Z Offset", meleeZNeg)
		iMeleeZ = AddSliderOption("Negative Z Offset", meleeZ)
		iMeleeZoom = AddSliderOption("Zoom", meleeZoom)
		AddHeaderOption("POV Settings")
		iAutoThirdMelee = AddToggleOption("Auto 3rd Person", autoThirdMelee)
		iAutoFirstMelee = AddToggleOption("Auto 1st Person", autoFirstMelee)
		AddHeaderOption("Crosshair Settings")
		iCrosshairMelee = AddToggleOption("Crosshair", crosshairMelee)
	ElseIf (page == ("Ranged"))
		SetCursorFillMode(TOP_TO_BOTTOM)
		iEnableRanged = AddToggleOption("Enabled Ranged Cam", enableRanged)
		iCountMagicAsRanged = AddToggleOption("Magic is Ranged", countMagicAsRanged)
		AddHeaderOption("Camera Offsets")
		iRangedY = AddSliderOption("Default Y", rangedY)
		iDefaultRangedX = AddSliderOption("Default X", defaultRangedX)
		iRangedXNeg = AddSliderOption("Positive X Offset", rangedXNeg)
		iRangedX = AddSliderOption("Negative X Offset", rangedX)
		iRangedZNeg = AddSliderOption("Positive Z Offset", rangedZNeg)
		iRangedZ = AddSliderOption("Negative Z Offset", rangedZ)
		iRangedZoom = AddSliderOption("Zoom", rangedZoom)
		AddHeaderOption("POV Settings")
		iAutoThirdRanged = AddToggleOption("Auto 3rd Person", autoThirdRanged)
		iAutoFirstRanged = AddToggleOption("Auto 1st Person", autoFirstRanged)
		AddHeaderOption("Crosshair Settings")
		iCrosshairRanged = AddToggleOption("Enable Crosshair", crosshairRanged)
		iCrosshairRangedX = AddSliderOption("X-offset", crosshairRangedX)
		iCrosshairRangedY = AddSliderOption("Y-offset", crosshairRangedY)
		iCrosshairSneakRangedX = AddSliderOption("Sneak X-offset", crosshairSneakRangedX)
		iCrosshairSneakRangedY = AddSliderOption("Sneak Y-offset", crosshairSneakRangedY)
	ElseIf (page == ("Sneak"))
		SetCursorFillMode(TOP_TO_BOTTOM)
		iSneakYOnly = AddToggleOption("Enable Sneak Y", sneakYOnly)
		iEnableSneak = AddToggleOption("Enable Sneak X", enableSneak)
		iSneakOverridesMelee = AddToggleOption("Sneak Overrides Melee", sneakOverridesMelee)
		iSneakOverridesRanged = AddToggleOption("Sneak Overrides Ranged", sneakOverridesRanged)
		AddHeaderOption("Camera Offsets")
		iSneakY = AddSliderOption("Default Y", sneakY)
		iDefaultSneakX = AddSliderOption("Default X", defaultSneakX)
		iSneakXNeg = AddSliderOption("Positive X Offset", sneakXNeg)
		iSneakX = AddSliderOption("Negative X Offset", sneakX)
		iSneakZNeg = AddSliderOption("Positive Z Offset", sneakZNeg)
		iSneakZ = AddSliderOption("Negative Z Offset", sneakZ)
		iSneakZoom = AddSliderOption("Zoom", sneakZoom)
	ElseIf(page == "Uninstall")
		iUninstall = AddToggleOption("Uninstall mod", false)
	EndIf
EndEvent


function OnBackupRequest(int jMod)
    JMap.setFlt(jMod, "defaultFOV", defaultFOV as int)
	JMap.setFlt(jMod, "camHorizontalSpeed", camHorizontalSpeed as int)
	JMap.setFlt(jMod, "minZoom", minZoom as int)
	JMap.setFlt(jMod, "maxZoom", maxZoom as int)
	JMap.setInt(jMod, "enableGamePad", enableGamePad as int)
	JMap.setInt(jMod, "_leftKey", _leftKey as int)
	JMap.setInt(jMod, "_rightKey", _rightKey as int)
	JMap.setInt(jMod, "_forwardKey", _forwardKey as int)
	JMap.setInt(jMod, "_backwardKey", _backwardKey as int)
	JMap.setInt(jMod, "_sneakKey", _sneakKey as int)
	JMap.setFlt(jMod, "sheathedY", sheathedY as int)
	JMap.setFlt(jMod, "defaultSheathedX", defaultSheathedX as int)
	JMap.setFlt(jMod, "sheathedXNeg", sheathedXNeg as int)
	JMap.setFlt(jMod, "sheathedX", sheathedX as int)
	JMap.setInt(jMod, "autoThirdSheathed", autoThirdSheathed as int)
	JMap.setInt(jMod, "autoFirstSheathed", autoFirstSheathed as int)
	JMap.setInt(jMod, "crosshairSheathed", crosshairSheathed as int)
	JMap.setFlt(jMod, "meleeY", meleeY as int)
	JMap.setFlt(jMod, "defaultMeleeX", defaultMeleeX as int)
	JMap.setFlt(jMod, "meleeXNeg", meleeXNeg as int)
	JMap.setFlt(jMod, "meleeX", meleeX as int)
	JMap.setFlt(jMod, "meleeZNeg", meleeZNeg as int)
	JMap.setFlt(jMod, "meleeZ", meleeZ as int)
	JMap.setFlt(jMod, "meleeZoom", meleeZoom as int)
	JMap.setInt(jMod, "autoThirdMelee", autoThirdMelee as int)
	JMap.setInt(jMod, "autoFirstMelee", autoFirstMelee as int)
	JMap.setInt(jMod, "crosshairMelee", crosshairMelee as int)
	JMap.setInt(jMod, "enableRanged", enableRanged as int)
	JMap.setInt(jMod, "countMagicAsRanged", countMagicAsRanged as int)
	JMap.setFlt(jMod, "rangedY", rangedY as int)
	JMap.setFlt(jMod, "defaultRangedX", defaultRangedX as int)
	JMap.setFlt(jMod, "rangedXNeg", rangedXNeg as int)
	JMap.setFlt(jMod, "rangedX", rangedX as int)
	JMap.setFlt(jMod, "rangedZNeg", rangedZNeg as int)
	JMap.setFlt(jMod, "rangedZ", rangedZ as int)
	JMap.setFlt(jMod, "rangedZoom", rangedZoom as int)
	JMap.setInt(jMod, "autoThirdRanged", autoThirdRanged as int)
	JMap.setInt(jMod, "autoFirstRanged", autoFirstRanged as int)
	JMap.setInt(jMod, "crosshairRanged", crosshairRanged as int)
	JMap.setFlt(jMod, "crosshairRangedX", crosshairRangedX as int)
	JMap.setFlt(jMod, "crosshairRangedY", crosshairRangedY as int)
	JMap.setFlt(jMod, "crosshairSneakRangedX", crosshairSneakRangedX as int)
	JMap.setFlt(jMod, "crosshairSneakRangedY", crosshairSneakRangedY as int)
	JMap.setInt(jMod, "sneakYOnly", sneakYOnly as int)
	JMap.setInt(jMod, "enableSneak", enableSneak as int)
	JMap.setInt(jMod, "sneakOverridesMelee", sneakOverridesMelee as int)
	JMap.setInt(jMod, "sneakOverridesRanged", sneakOverridesRanged as int)
	JMap.setFlt(jMod, "sneakY", sneakY as int)
	JMap.setFlt(jMod, "defaultSneakX", defaultSneakX as int)
	JMap.setFlt(jMod, "sneakXNeg", sneakXNeg as int)
	JMap.setFlt(jMod, "sneakX", sneakX as int)
	JMap.setFlt(jMod, "sneakZNeg", sneakZNeg as int)
	JMap.setFlt(jMod, "sneakZ", sneakZ as int)
	JMap.setFlt(jMod, "sneakZoom", sneakZoom as int)
endfunction



function OnRestoreRequest(int jMod)
    defaultFOV = JMap.getFlt(jMod, "defaultFOV")
	camHorizontalSpeed = JMap.getFlt(jMod, "camHorizontalSpeed")
	minZoom = JMap.getFlt(jMod, "minZoom")
	maxZoom = JMap.getFlt(jMod, "maxZoom")
	enableGamePad = JMap.getInt(jMod, "enableGamePad")
	_leftKey = JMap.getInt(jMod, "_leftKey")
	_rightKey = JMap.getInt(jMod, "_rightKey")
	_forwardKey = JMap.getInt(jMod, "_forwardKey")
	_backwardKey = JMap.getInt(jMod, "_backwardKey")
	_sneakKey = JMap.getInt(jMod, "_sneakKey")
	sheathedY = JMap.getFlt(jMod, "sheathedY")
	defaultSheathedX = JMap.getFlt(jMod, "defaultSheathedX")
	sheathedXNeg = JMap.getFlt(jMod, "sheathedXNeg")
	sheathedX = JMap.getFlt(jMod, "sheathedX")
	autoThirdSheathed = JMap.getInt(jMod, "autoThirdSheathed")
	autoFirstSheathed = JMap.getInt(jMod, "autoFirstSheathed")
	crosshairSheathed = JMap.getInt(jMod, "crosshairSheathed")
	meleeY = JMap.getFlt(jMod, "meleeY")
	defaultMeleeX = JMap.getFlt(jMod, "defaultMeleeX")
	meleeXNeg = JMap.getFlt(jMod, "meleeXNeg")
	meleeX = JMap.getFlt(jMod, "meleeX")
	meleeZNeg = JMap.getFlt(jMod, "meleeZNeg")
	meleeZ = JMap.getFlt(jMod, "meleeZ")
	meleeZoom = JMap.getFlt(jMod, "meleeZoom")
	autoThirdMelee = JMap.getInt(jMod, "autoThirdMelee")
	autoFirstMelee = JMap.getInt(jMod, "autoFirstMelee")
	crosshairMelee = JMap.getInt(jMod, "crosshairMelee")
	enableRanged = JMap.getInt(jMod, "enableRanged")
	countMagicAsRanged = JMap.getInt(jMod, "countMagicAsRanged")
	rangedY = JMap.getFlt(jMod, "rangedY")
	defaultRangedX = JMap.getFlt(jMod, "defaultRangedX")
	rangedXNeg = JMap.getFlt(jMod, "rangedXNeg")
	rangedX = JMap.getFlt(jMod, "rangedX")
	rangedZNeg = JMap.getFlt(jMod, "rangedZNeg")
	rangedZ = JMap.getFlt(jMod, "rangedZ")
	rangedZoom = JMap.getFlt(jMod, "rangedZoom")
	autoThirdRanged = JMap.getInt(jMod, "autoThirdRanged")
	autoFirstRanged = JMap.getInt(jMod, "autoFirstRanged")
	crosshairRanged = JMap.getInt(jMod, "crosshairRanged")
	crosshairRangedX = JMap.getFlt(jMod, "crosshairRangedX")
	crosshairRangedY = JMap.getFlt(jMod, "crosshairRangedY")
	crosshairSneakRangedX = JMap.getFlt(jMod, "crosshairSneakRangedX")
	crosshairSneakRangedY = JMap.getFlt(jMod, "crosshairSneakRangedY")
	sneakYOnly = JMap.getInt(jMod, "sneakYOnly")
	enableSneak = JMap.getInt(jMod, "enableSneak")
	sneakOverridesMelee = JMap.getInt(jMod, "sneakOverridesMelee")
	sneakOverridesRanged = JMap.getInt(jMod, "sneakOverridesRanged")
	sneakY = JMap.getFlt(jMod, "sneakY")
	defaultSneakX = JMap.getFlt(jMod, "defaultSneakX")
	sneakXNeg = JMap.getFlt(jMod, "sneakXNeg")
	sneakX = JMap.getFlt(jMod, "sneakX")
	sneakZNeg = JMap.getFlt(jMod, "sneakZNeg")
	sneakZ = JMap.getFlt(jMod, "sneakZ")
	sneakZoom = JMap.getFlt(jMod, "sneakZoom")

	Game.UpdateThirdPerson()
endfunction



Event OnOptionSelect(int option)
	if (CurrentPage == "Sheathed")
		If (option == iAutoThirdSheathed)
			autoThirdSheathed = !autoThirdSheathed
			SetToggleOptionValue(iAutoThirdSheathed, autoThirdSheathed)
			_autoThirdSheathed = autoThirdSheathed
			If (autoThirdSheathed == true)
				autoFirstSheathed = false
				_autoFirstSheathed = false
				SetToggleOptionValue(iAutoFirstSheathed, false)
			EndIf
		ElseIf (option == iAutoFirstSheathed)
			autoFirstSheathed = !autoFirstSheathed
			SetToggleOptionValue(iAutoFirstSheathed, autoFirstSheathed)
			_autoFirstSheathed = autoFirstSheathed
			If (iAutoFirstSheathed == true)
				autoThirdSheathed = false
				_autoThirdSheathed = false
				SetToggleOptionValue(iAutoThirdSheathed, false)
			EndIf
		ElseIf (option == iCrosshairSheathed)
			crosshairSheathed = !crosshairSheathed
			SetToggleOptionValue(iCrosshairSheathed, crosshairSheathed)
			_crosshairSheathed = crosshairSheathed
		EndIf
	ElseIf (CurrentPage == "Melee")
		If (option == iAutoThirdMelee)
			autoThirdMelee = !autoThirdMelee
			SetToggleOptionValue(iAutoThirdMelee, autoThirdMelee)
			_autoThirdMelee = autoThirdMelee
			If (iAutoThirdMelee == true)
				autoFirstMelee = false
				_autoFirstMelee = false
				SetToggleOptionValue(iAutoFirstMelee, false)
			EndIf
		ElseIf (option == iAutoFirstMelee)
			autoFirstMelee = !autoFirstMelee
			SetToggleOptionValue(iAutoFirstMelee, autoFirstMelee)
			_autoFirstMelee = autoFirstMelee
			If (iAutoFirstMelee == true)
				autoThirdMelee = false
				_autoThirdMelee = false
				SetToggleOptionValue(iAutoThirdMelee, false)
			EndIf
		ElseIf (option == iCrosshairMelee)
			crosshairMelee = !crosshairMelee
			SetToggleOptionValue(iCrosshairMelee, crosshairMelee)
			_crosshairMelee = crosshairMelee
		EndIf
	ElseIf (CurrentPage == "Ranged")
		If (option == iEnableRanged)
			enableRanged = !enableRanged
			SetToggleOptionValue(iEnableRanged, enableRanged)
			_enableRanged = enableRanged
		ElseIf (option == iCountMagicAsRanged)
			countMagicAsRanged = !countMagicAsRanged
			SetToggleOptionValue(iCountMagicAsRanged, countMagicAsRanged)
			_countMagicAsRanged = countMagicAsRanged
		ElseIf (option == iAutoThirdRanged)
			autoThirdRanged = !autoThirdRanged
			SetToggleOptionValue(iAutoThirdRanged, autoThirdRanged)
			_autoThirdRanged = autoThirdRanged
			If (autoThirdRanged == true)
				autoFirstRanged = false
				_autoFirstRanged = false
				SetToggleOptionValue(iAutoFirstRanged, false)
			EndIf
		ElseIf (option == iAutoFirstRanged)
			autoFirstRanged = !autoFirstRanged
			SetToggleOptionValue(iAutoFirstRanged, autoFirstRanged)
			_autoFirstRanged = autoFirstRanged
			If (autoFirstRanged == true)
				autoThirdRanged = false
				_autoThirdRanged = false
				SetToggleOptionValue(iAutoThirdRanged, false)
			EndIf
		ElseIf (option == iCrosshairRanged)
			crosshairRanged = !crosshairRanged
			SetToggleOptionValue(iCrosshairRanged, crosshairRanged)
			_crosshairRanged = crosshairRanged
		EndIf
	ElseIf (CurrentPage == "Sneak")
		If (option == iEnableSneak)
			enableSneak = !enableSneak
			SetToggleOptionValue(iEnableSneak, enableSneak)
			_enableSneak = enableSneak
		ElseIf (option == iSneakYOnly)
			sneakYOnly = !sneakYOnly
			SetToggleOptionValue(iSneakYOnly, sneakYOnly)
			_sneakYOnly = sneakYOnly
		ElseIf (option == iSneakOverridesRanged)
			sneakOverridesRanged = !sneakOverridesRanged
			SetToggleOptionValue(iSneakOverridesRanged, sneakOverridesRanged)
			_sneakOverridesRanged = sneakOverridesRanged
		ElseIf (option == iSneakOverridesMelee)
			sneakOverridesMelee = !sneakOverridesMelee
			SetToggleOptionValue(iSneakOverridesMelee, sneakOverridesMelee)
			_sneakOverridesMelee = sneakOverridesMelee
		EndIf
	ElseIf (CurrentPage == "General Settings")
		If (option == iEnableGamepad)
			enableGamePad = !enableGamePad
			SetToggleOptionValue(iEnableGamepad, enableGamePad)
			_enableGamePad = enableGamePad
		EndIf
	ElseIf (CurrentPage == "Uninstall")
		SmoothCameraFollowQuest.Stop()
		UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_defaultSneakX)
		UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_defaultSneakY)
		UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_defaultX)
		UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_defaultY)
		ShowMessage("Uninstalled. Please exit game and disable 3PCO.")
	EndIf
EndEvent
		
Event OnOptionSliderOpen(int option)
	If (CurrentPage == "General Settings")
		If (option == iDefaultFOV)
			SetSliderDialogStartValue(defaultFOV)
			SetSliderDialogDefaultValue(85)
			SetSliderDialogRange(50, 130)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iCamSpeed)
			SetSliderDialogStartValue(camHorizontalSpeed)
			SetSliderDialogDefaultValue(15)
			SetSliderDialogRange(0.0, 100)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iMinZoom)
			SetSliderDialogStartValue(minZoom)
			SetSliderDialogDefaultValue(200)
			SetSliderDialogRange(1, 600)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iMaxZoom)
			SetSliderDialogStartValue(maxZoom)
			SetSliderDialogDefaultValue(355)
			SetSliderDialogRange(1, 1000)
			SetSliderDialogInterval(1.0)
		EndIf
	ElseIf (CurrentPage == "Sheathed")
		If (option == iSheathedY)
			SetSliderDialogStartValue(sheathedY)
			SetSliderDialogDefaultValue(-10)
			SetSliderDialogRange(-70.0, 70.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iDefaultSheathedX)
			SetSliderDialogStartValue(defaultSheathedX)
			SetSliderDialogDefaultValue(25)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSheathedXNeg)
			SetSliderDialogStartValue(sheathedXNeg)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSheathedX)
			SetSliderDialogStartValue(sheathedX)
			SetSliderDialogDefaultValue(30.0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSheathedZ)
			SetSliderDialogStartValue(sheathedZ)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-150.0, 150.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSheathedZNeg)
			SetSliderDialogStartValue(sheathedZNeg)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-150.0, 150.0)
			SetSliderDialogInterval(1.0)
		EndIf
	ElseIf (CurrentPage == "Melee")
		If (option == iMeleeY)
			SetSliderDialogStartValue(meleeY)
			SetSliderDialogDefaultValue(0)
			SetSliderDialogRange(-70.0, 70.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iDefaultMeleeX)
			SetSliderDialogStartValue(defaultMeleeX)
			SetSliderDialogDefaultValue(0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iMeleeXNeg)
			SetSliderDialogStartValue(meleeXNeg)
			SetSliderDialogDefaultValue(35.0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iMeleeX)
			SetSliderDialogStartValue(meleeX)
			SetSliderDialogDefaultValue(35.0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iMeleeZoom)
			SetSliderDialogStartValue(meleeZoom)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-200.0, 200.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iMeleeZ)
			SetSliderDialogStartValue(meleeZ)
			SetSliderDialogDefaultValue(10.0)
			SetSliderDialogRange(-150.0, 150.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iMeleeZNeg)
			SetSliderDialogStartValue(meleeZNeg)
			SetSliderDialogDefaultValue(10.0)
			SetSliderDialogRange(-150.0, 150.0)
			SetSliderDialogInterval(1.0)
		EndIf
	ElseIf (CurrentPage == "Ranged")
		If (option == iRangedY)
			SetSliderDialogStartValue(RangedY)
			SetSliderDialogDefaultValue(0)
			SetSliderDialogRange(-70.0, 70.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iDefaultRangedX)
			SetSliderDialogStartValue(defaultRangedX)
			SetSliderDialogDefaultValue(0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iRangedXNeg)
			SetSliderDialogStartValue(rangedXNeg)
			SetSliderDialogDefaultValue(35.0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iRangedX)		
			SetSliderDialogStartValue(rangedX)
			SetSliderDialogDefaultValue(35.0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iRangedZoom)
			SetSliderDialogStartValue(rangedZoom)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-200.0, 200.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iRangedZ)
			SetSliderDialogStartValue(rangedZ)
			SetSliderDialogDefaultValue(10.0)
			SetSliderDialogRange(-150.0, 150.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iRangedZNeg)
			SetSliderDialogStartValue(rangedZNeg)
			SetSliderDialogDefaultValue(10.0)
			SetSliderDialogRange(-150.0, 150.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iCrosshairRangedX)
			SetSliderDialogStartValue(crosshairRangedX)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-400.0,400.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iCrosshairRangedY)
			SetSliderDialogStartValue(crosshairRangedY)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-400.0,400.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iCrosshairSneakRangedX)
			SetSliderDialogStartValue(crosshairSneakRangedX)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-400.0,400.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iCrosshairSneakRangedY)
			SetSliderDialogStartValue(crosshairSneakRangedY)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-400.0,400.0)
			SetSliderDialogInterval(1.0)
		EndIf
	ElseIf (CurrentPage == "Sneak")
		If (option == iDefaultSneakX)
			SetSliderDialogStartValue(defaultSneakX)
			SetSliderDialogDefaultValue(0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSneakY)
			SetSliderDialogStartValue(sneakY)
			SetSliderDialogDefaultValue(0)
			SetSliderDialogRange(-70.0, 70.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSneakXNeg)
			SetSliderDialogStartValue(sneakXNeg)
			SetSliderDialogDefaultValue(75.0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSneakX)
			SetSliderDialogStartValue(sneakX)
			SetSliderDialogDefaultValue(75.0)
			SetSliderDialogRange(-100.0, 100.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSneakZoom)
			SetSliderDialogStartValue(sneakZoom)
			SetSliderDialogDefaultValue(0)
			SetSliderDialogRange(-200.0, 200.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSneakZ)
			SetSliderDialogStartValue(sneakZ)
			SetSliderDialogDefaultValue(10.0)
			SetSliderDialogRange(-150.0, 150.0)
			SetSliderDialogInterval(1.0)
		ElseIf (option == iSneakZNeg)
			SetSliderDialogStartValue(sneakZNeg)
			SetSliderDialogDefaultValue(10.0)
			SetSliderDialogRange(-150.0, 150.0)
			SetSliderDialogInterval(1.0)
		EndIf
	EndIf
EndEvent

Event OnOptionSliderAccept(int option, float value)
	If (CurrentPage == "General Settings")
		If (option == iDefaultFOV)
			defaultFOV = value
			_defaultFOV = defaultFOV
			SetSliderOptionValue(iDefaultFOV,defaultFOV)
			Utility.SetINIFloat("fDefaultWorldFOV:Display", defaultFOV)
			Game.UpdateThirdPerson()
		ElseIf (option == iCamSpeed)
			camHorizontalSpeed = value
			_camHorizontalSpeed = camHorizontalSpeed
			SetSliderOptionValue(iCamSpeed,camHorizontalSpeed)
			Utility.SetINIFloat("fShoulderDollySpeed:Camera", camHorizontalSpeed/10)
			Game.UpdateThirdPerson()
		ElseIf (option == iMinZoom)
			minZoom = value
			_minZoom = minZoom
			SetSliderOptionValue(iMinZoom,minZoom)
			Utility.SetINIFloat("fVanityModeMinDist:Camera", minZoom)
			Game.UpdateThirdPerson()
		ElseIf (option == iMaxZoom)
			maxZoom = value
			_maxZoom = maxZoom
			SetSliderOptionValue(iMaxZoom,maxZoom)
			Utility.SetINIFloat("fVanityModeMaxDist:Camera", maxZoom)
			Game.UpdateThirdPerson()
		EndIf
	ElseIf (CurrentPage == "Sheathed")
		If (option == iSheathedY)
			sheathedY = value
			_sheathedY = sheathedY
			SetSliderOptionValue(iSheathedY,sheathedY)
			UpdateVerticalCam(sheathedY, meleeY, rangedY)
			Game.UpdateThirdPerson()
		ElseIf (option == iDefaultSheathedX)
			defaultSheathedX = value
			_defaultSheathedX = defaultSheathedX
			SetSliderOptionValue(iDefaultSheathedX, defaultSheathedX)
			UpdateHorizontalCam(defaultSheathedX,defaultMeleeX,defaultRangedX)
			Game.UpdateThirdPerson()
		ElseIf (option == iSheathedXNeg)
			sheathedXNeg = value
			_sheathedXNeg = sheathedXNeg
			SetSliderOptionValue(iSheathedXNeg, sheathedXNeg)
		ElseIf (option == iSheathedX)
			sheathedX = value
			_sheathedX = sheathedX
			SetSliderOptionValue(iSheathedX, sheathedX)
		ElseIf (option == iSheathedZ)
			sheathedZ = value
			_sheathedZ = sheathedZ
			SetSliderOptionValue(iSheathedZ, sheathedZ)
		ElseIf (option == iSheathedZNeg)
			sheathedZNeg = value
			_sheathedZNeg = sheathedZNeg
			SetSliderOptionValue(iSheathedZNeg, sheathedZNeg)
		EndIf
	ElseIf (CurrentPage == "Melee")
		If (option == iMeleeY)
			meleeY = value
			_meleeY = meleeY
			SetSliderOptionValue(iMeleeY,meleeY)
			UpdateVerticalCam(sheathedY, meleeY, rangedY)
			Game.UpdateThirdPerson()
		ElseIf (option == iDefaultMeleeX)
			defaultMeleeX = value
			_defaultMeleeX = defaultMeleeX
			SetSliderOptionValue(iDefaultMeleeX, defaultMeleeX)
			UpdateHorizontalCam(defaultSheathedX,defaultMeleeX,defaultRangedX)
			Game.UpdateThirdPerson()
		ElseIf (option == iMeleeXNeg)
			meleeXNeg = value
			_meleeXNeg = meleeXNeg
			SetSliderOptionValue(iMeleeXNeg, meleeXNeg)
		ElseIf (option == iMeleeX)
			meleeX = value
			_meleeX = meleeX
			SetSliderOptionValue(iMeleeX, meleeX)
		ElseIf (option == iMeleeZoom)
			meleeZoom = value
			_meleeZoom = meleeZoom
			SetSliderOptionValue(iMeleeZoom, meleeZoom)
			If (IsRanged())
				Utility.SetINIFloat("fOverShoulderCombatAddY:Camera", meleeZoom)
				Game.UpdateThirdPerson()
			EndIf
		ElseIf (option == iMeleeZ)
			meleeZ = value
			_meleeZ = meleeZ
			SetSliderOptionValue(iMeleeZ, meleeZ)
		ElseIf (option == iMeleeZNeg)
			meleeZNeg = value
			_meleeZNeg = meleeZNeg
			SetSliderOptionValue(iMeleeZNeg, meleeZNeg)
		EndIf
	ElseIf (CurrentPage == "Ranged")
		If (option == iRangedY)
			rangedY = value
			_rangedY = rangedY
			SetSliderOptionValue(iRangedY,rangedY)
			UpdateVerticalCam(sheathedY, meleeY, rangedY)
			Game.UpdateThirdPerson()
		ElseIf (option == iDefaultRangedX)
			defaultRangedX = value
			_defaultRangedX = defaultRangedX
			SetSliderOptionValue(iDefaultRangedX, defaultRangedX)
			UpdateHorizontalCam(defaultSheathedX,defaultMeleeX,defaultRangedX)
			Game.UpdateThirdPerson()
		ElseIf (option == iRangedXNeg)
			rangedXNeg = value
			_rangedXNeg = rangedXNeg
			SetSliderOptionValue(iRangedXNeg, rangedXNeg)
		ElseIf (option == iRangedX)
			rangedX = value
			_rangedX = rangedX
			SetSliderOptionValue(iRangedX, rangedX)
		ElseIf (option == iRangedZoom)
			rangedZoom = value
			_rangedZoom = rangedZoom
			SetSliderOptionValue(iRangedZoom, rangedZoom)
			If (IsRanged())
				Utility.SetINIFloat("fOverShoulderCombatAddY:Camera", rangedZoom)
				Game.UpdateThirdPerson()
			EndIf
		ElseIf (option == iRangedZ)
			rangedZ = value
			_rangedZ = rangedZ
			SetSliderOptionValue(iRangedZ, rangedZ)
		ElseIf (option == iRangedZNeg)
			rangedZNeg = value
			_rangedZNeg = rangedZNeg
			SetSliderOptionValue(iRangedZNeg, rangedZNeg)
		ElseIf (option == iCrosshairRangedX)
			crosshairRangedX = value
			_crosshairRangedX = crosshairRangedX
			SetSliderOptionValue(iCrosshairRangedX, crosshairRangedX)
		ElseIf (option == iCrosshairRangedY)
			crosshairRangedY = value
			_crosshairRangedY = crosshairRangedY
			SetSliderOptionValue(iCrosshairRangedY, crosshairRangedY)
		ElseIf (option == iCrosshairSneakRangedX)
			crosshairSneakRangedX = value
			_crosshairSneakRangedX = crosshairSneakRangedX
			SetSliderOptionValue(iCrosshairSneakRangedX, crosshairSneakRangedX)
		ElseIf (option == iCrosshairSneakRangedY)
			crosshairSneakRangedY = value
			_crosshairSneakRangedY = crosshairSneakRangedY
			SetSliderOptionValue(iCrosshairSneakRangedY, crosshairSneakRangedY)
		EndIf
	ElseIf (CurrentPage == "Sneak")
		If (option == iDefaultSneakX)
			defaultSneakX = value
			_defaultSneakX = defaultSneakX
			SetSliderOptionValue(iDefaultSneakX,defaultSneakX)
		ElseIf (option == iSneakY)
			sneakY = value
			_sneakY = sneakY
			SetSliderOptionValue(iSneakY,sneakY)
		ElseIf (option == iSneakXNeg)
			sneakXNeg = value
			_sneakXNeg = sneakXNeg
			SetSliderOptionValue(iSneakXNeg, sneakXNeg)
		ElseIf (option == iSneakX)
			sneakX = value
			_sneakX = sneakX
			SetSliderOptionValue(iSneakX, sneakX)
		ElseIf (option == iSneakZoom)
			sneakZoom = value
			_sneakZoom = sneakZoom
			SetSliderOptionValue(iSneakZoom, sneakZoom)
		ElseIf (option == iSneakZ)
			sneakZ = value
			_sneakZ = sneakZ
			SetSliderOptionValue(iSneakZ, sneakZ)
		ElseIf (option == iSneakZNeg)
			sneakZNeg = value
			_sneakZNeg = sneakZNeg
			SetSliderOptionValue(iSneakZNeg, sneakZNeg)
		EndIf
	EndIf
EndEvent

Event OnOptionKeymapChange(int option, int keyCode, string conflictControl, string conflictName)
	If (option == iLeftKey)
		_leftKey = keyCode
		SetKeymapOptionValue(iLeftKey, keyCode)
	ElseIf (option == iRightKey)
		_rightKey = keyCode
		SetKeymapOptionValue(iRightKey, keyCode)
	ElseIf (option == iForwardKey)
		_forwardKey = keyCode
		SetKeymapOptionValue(iForwardKey, keyCode)
	ElseIf (option == iBackwardKey)
		_backwardKey = keyCode
		SetKeymapOptionValue(iBackwardKey, keyCode)
	ElseIf (option == iSneakKey)
		_sneakKey = keyCode
		SetKeymapOptionValue(iSneakKey, keyCode)
	EndIf
EndEvent

Event OnOptionHighlight(int option)
	if (option == iDefaultFOV)
		SetInfoText("Change the Field of View")
	ElseIf (option == iCamSpeed)
		SetInfoText("This is how quickly the camera will move")
	ElseIf (option == iMinZoom)
		SetInfoText("Minimum zoom. The lower the value, the closer your camera will be to your character")
	ElseIf (option == iMaxZoom)
		SetInfoText("Maximum zoom. The higher the value, the further your camera can go from your character")
	ElseIf (option == iEnableGamepad)
		SetInfoText("WARNING: This does not work perfectly. There will be a delay before your camera actually starts moving. If you want more reactive behavior for gamepad, check the mod page and disable this setting. If you insist on using this setting, I recommend setting a lower camera speed.")
	ElseIf (option == iDefaultSheathedX || option == iDefaultMeleeX || option == iDefaultRangedX || option == iDefaultSneakX)
		SetInfoText("The default X position of the camera when player is not moving. Offset this to a negative number and set bounds equal to this number to enable shoulder view with no camera movement.")
	ElseIf (option == iSheathedY || option == iMeleeY || option == iRangedY || option == iSneakY)
		SetInfoText("The Y position of the camera.")
	ElseIf (option == iSheathedXNeg || option == iMeleeXNeg || option == iRangedXNeg || option == iSneakXNeg)
		SetInfoText("The rightmost distance from the center that your character will move to.")
	ElseIf (option == iSheathedX || option == iMeleeX || option == iRangedX || option == iSneakX)
		SetInfoText("The leftmost distance from the center that your character will move to")
	ElseIf (option == iMeleeZoom || option == iRangedZoom || option == iSneakZoom)
		SetInfoText("Distance to zoom in or out.")
	ElseIf (option == iEnableRanged)
		SetInfoText("Enable ranged camera settings. Disable this if using Archery Gameplay Overhaul to disregard all X-Y settings on this page.")
	ElseIf (option == iCountMagicAsRanged)
		SetInfoText("Magic and staves will be counted as ranged weapons")
	ElseIf (option == iSheathedZ || option == iMeleeZ || option == iRangedZ || option == iSneakZ)
		SetInfoText("Distance the player will move toward the camera when moving backward")
	ElseIf (option == iSheathedZNeg || option == iMeleeZNeg || option == iRangedZNeg || option == iSneakZNeg)
		SetInfoText("Distance the player will move away from camera when moving forward")
	ElseIf (option == iSneakOverridesRanged)
		SetInfoText("Allow sneak camera settings to override ranged camera settings when sneaking with a ranged weapon. Enable Sneak X or Enable Sneak Y should be enabled.")
	ElseIf (option == iSneakOverridesMelee)
		SetInfoText("Allow sneak camera settings to override melee camera settings when sneaking with a melee weapon. Enable Sneak X or Enable Sneak Y should be enabled.")
	ElseIf (option == iUninstall)
		SetInfoText("PLEASE READ!! BEFORE TICKING THIS: Set all your crosshairs to visible before ticking. Set all your default camera states to what you prefer. If updating, uninstall mod completely, then make a save with it uninstalled, then download the new version.")
	EndIf
EndEvent

; ------------------------------------------------------Update camera functions-----------------------------------------
Function UpdateHorizontalCam(float asheathedX, float ameleeX, float arangedX)
	Utility.SetINIFloat("fOverShoulderPosX:Camera", asheathedX)
	If (IsRanged() == false)
		Utility.SetINIFloat("fOverShoulderCombatPosX:Camera", ameleeX)
	ElseIf (enableRanged == true)
		Utility.SetINIFloat("fOverShoulderCombatPosX:Camera", arangedX)
	EndIf
EndFunction


Function UpdateVerticalCam(float asheathedY, float ameleeY, float arangedY)
	Utility.SetINIFloat("fOverShoulderPosZ:Camera", asheathedY)
	If (IsRanged() == false)
		Utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", ameleeY)
	ElseIf (enableRanged == true)
		Utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", arangedY)
	EndIf
EndFunction

; --------------------------------------------------------Misc functions-------------------------------------------------
Bool Function IsRanged()
	int leftArm = Game.GetPlayer().GetEquippedItemType(0)
	int rightArm = Game.GetPlayer().GetEquippedItemType(1)
	If (LeftArm == 7 || RightArm == 7 || LeftArm == 12 || RightArm == 12)
		Return True
	EndIf
	If ((LeftArm == 8 || RightArm == 8 || LeftArm == 9 || RightArm == 9) && (countMagicAsRanged))
		Return True
	EndIf
	Return False
EndFunction