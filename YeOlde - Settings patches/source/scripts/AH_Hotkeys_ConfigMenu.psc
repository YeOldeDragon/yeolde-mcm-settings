ScriptName AH_Hotkeys_ConfigMenu extends SKI_ConfigBase
{AH Hotkeys SkyUI MCM configuration menu script.}

Actor property playerREF auto
AH_Hotkeys property AHMain auto
AH_Hotkeys_Manager property AHMgr auto
AH_Hotkeys_Spells property AHSpells auto
; AH_Hotkeys_ConfigMenu property AHConfig auto
AH_Hotkeys_Utils property AHUtils auto
AH_Hotkeys_MiscScripts property AHMisc auto
; Common constants
int property kLeftHand = 0 AutoReadOnly
int property kRightHand = 1 AutoReadOnly
int property kBothHands = 4 AutoReadOnly
int property kEitherHand = 5 AutoReadOnly

float property kLoopWaitTime auto hidden

string property kMCMTitle auto hidden
string property JCTempLocalPool = "AHHKTempPool1" autoreadonly
string property JCTempPoolClearOnKeyDown = "AHHKTempPool2" autoreadonly
string property JCTempPoolClearOnCloseMCM = "AHHKTempPool3" autoreadonly

bool property enableQuickExitMCM auto hidden ;v3.0
float property quickExitMCMCooldownTime = 0.5 autoreadonly ;v3.0
float property quickExitMCMStartCooldownTime auto hidden ;v3.0

int property kEquipSetPageIndex auto hidden ;4.0
int property kMacroPageIndex auto hidden ;4.0
int property kConfigPageIndex auto hidden ;4.0
int property kConfig2PageIndex auto hidden ;4.0
int property kWizardsPageIndex auto hidden ;4.0
int property kInformationPageIndex auto hidden ;4.0
int property kDevPageIndex auto hidden ;4.0

string property kEquipSetPageTitle auto hidden ;v3.0
string property kMacroPageTitle auto hidden ;v3.0
string property kConfigPageTitle auto hidden ;v3.0
string property kConfig2PageTitle auto hidden ;v3.0
string property kSettings2PageTitle auto hidden ;v3.0
string property kWizardsPageTitle auto hidden ;v3.0
string property kInformationPageTitle auto hidden ;v3.0
string property kDevPageTitle auto hidden ;v3.0

int property kDeviceType_AutoDetect = 255 autoreadonly ; v3.0
int property kDeviceType_Keyboard = 0 autoreadonly ; v3.0
int property kDeviceType_Mouse = 1 autoreadonly ; v3.0
int property kDeviceType_Gamepad = 2 autoreadonly ; v3.0

string property kColour_Normal auto hidden ; v4.0
string property kColour_Disabled auto hidden ; v4.0
string property kColour_AutoAddedItem auto hidden ; v4.0
string property kColour_MenuButton auto hidden ; v4.0

string property currentHotkeySetFileName auto hidden
int property maxMenuValueStringLength = 32 autoreadonly

bool property OnPageResetInProgress auto hidden ; added in 1.3
int property objCurrentEquipSet auto hidden
int property objPreviousEquipSet auto hidden ; v3.0

; string[] inventoryMenuItemsList
; int noneInventoryMenuItem
; int cancelInventoryMenuItem
; int addAllInventoryMenuItem
; int swapInventoryMenuItem
; int moveUpInventoryMenuItem
; int moveDownInventoryMenuItem
; int gotoEquipsetInventoryMenuItem
; int inventoryMenuItemOffset
; int equipSetMenuItemOffSet

string[] filterByMagicEffectMenuList
int property kAllMagicEffects auto hidden
int property kHealthEffect auto hidden
int property kMagickaEffect auto hidden
int property kStaminaEffect auto hidden
int property kHungerEffect auto hidden
int property kOtherEffect auto hidden
int property kCustomEffect auto hidden

string[] filterByItemTypeMenuList
int property kFilterByAllTypes auto hidden
int property kFilterByPotions auto hidden
int property kFilterByPoisons auto hidden
int property kFilterByFood auto hidden
int property kFilterByIngredients auto hidden
int property kFilterByScrolls auto hidden
int property kFilterByWeapons auto hidden
int property kFilterByArmor auto hidden
int property kFilterBySpells auto hidden
int property kFilterByAmmo auto hidden
int property kFilterByOther auto hidden
int property kFilterByEquipSets auto hidden

string healthEffectString
string magickaEffectString
string staminaEffectString
string hungerEffectString

string kDeviceType_AutoDetectString
string kDeviceType_KeyboardString
string kDeviceType_MouseString
string kDeviceType_GamepadString

string[] optionsMenuList
int kOptionsMenuItem_Cancel
int kOptionsMenuItem_GoBackToPreviousEquipset
int kOptionsMenuItem_RemoveAllItems
int kOptionsMenuItem_RemoveInvalidItems
int kOptionsMenuItem_RemoveAllAutoAddItems
int kOptionsMenuItem_GetAllEquippedItems
int kOptionsMenuItem_NewAutoAddItem
int kOptionsMenuItem_ConvertAllItemsToGeneric
int kOptionsMenuItem_ConvertAllItemsToSpecific

string[] cycleEquipModeMenuList
int property kCycleEquipMode_NoReset auto hidden
int property kCycleEquipMode_ResetToPrevItemIfDifferent auto hidden
int property kCycleEquipMode_ResetToFirstItemIfDifferent auto hidden
int property kCycleEquipMode_ResetToFirstItemOnTimeOut auto hidden
int property kCycleEquipMode_cycleEquipModeResetTimeout auto hidden
float property kCycleEquipMode_defaultTimeout auto hidden

string[] sortMenuList
int property kSortMenuItem_Cancel auto hidden
int property kSortMenuItem_HighestToLowestMagicEffect auto hidden
int property kSortMenuItem_LowestToHighestMagicEffect auto hidden

string[] numShoutWordsDisplayStrings
int property kNumShoutWords_Default = 3 AutoReadOnly

string[] equipModeMenuList
string[] equipModeDisplayStrings
string[] property equipModeStrings auto hidden
int Property kEquipMode_None auto hidden ; v2: no equipMode (default for EquipSet() function - equipMode comes from equipSet variable)
int Property kEquipMode_AllAtOnce auto hidden ; equip all items
int Property kEquipMode_OneAtATime auto hidden ; step through the EquipSet items, one per hotkey press
int Property kEquipMode_AllWithToggle auto hidden ; equip all items, but on next keypress, equips the previously equipped items (if changed)
int Property kEquipMode_AllToggleEquipUnequip auto hidden ; equip all items, but toggle between equipped and unequipped state
int Property kEquipMode_DropAll auto hidden ; drop all items
float property kDropAllEquipMode_maxThrowMagnitude auto hidden
float property kDropAllEquipMode_defaultThrowMagnitudePercent auto hidden

string[] debugLevelMenuList
int property debugLevels_kAlert auto hidden
int property debugLevels_kError auto hidden
int property debugLevels_kNotice auto hidden
int property debugLevels_kDebug auto hidden
int property kDefaultDebugLevel auto hidden

int currentConfigHotKeyGroupIndex
int currentEquipSetHotKeyGroupFilterIndex
bool bAddGenericItem

; int objInventoryMenuStringsArray
int objIngredientItemsUpdatedArray

int property objCurrentMacro auto hidden ; v3.0
int property objPreviousMacro auto hidden ; v3.0

int property objBackupMacro
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "backupMacro")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "backupMacro", objObject)
	EndFunction
endProperty

int menuListDefaultIndex
int property objMenuListStringsArray
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "menuListStringsArray")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "menuListStringsArray", objObject)
	EndFunction
endProperty

int property objEquipSetMenuListArray
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "equipSetMenuListArray")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "equipSetMenuListArray", objObject)
	EndFunction
endProperty

int property objInventoryMenuItemObjectsArray
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "inventoryMenuItemObjects")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "inventoryMenuItemObjects", objObject)
	EndFunction
endProperty

int property objInventoryListMenuOptionIDArray
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "inventoryListMenuOptionIDArray")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "inventoryListMenuOptionIDArray", objObject)
	EndFunction
endProperty

int property objAutoAddListMenuOptionIDArray
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "autoAddListMenuOptionIDArray")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "autoAddListMenuOptionIDArray", objObject)
	EndFunction
endProperty

int property objBackupEquipSet
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "backupEquipSet")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "backupEquipSet", objObject)
	EndFunction
endProperty

int property objFileList
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "fileList")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "fileList", objObject)
	EndFunction
endProperty

int property objAutoAddEquipSetsUpdatedArray
	int Function get()
		return JMap.getObj(AHMain.objAHHotKeysData, "autoAddEquipSetsUpdatedArray")
	EndFunction
	Function set(int objObject)
		JMap.setObj(AHMain.objAHHotKeysData, "autoAddEquipSetsUpdatedArray", objObject)
	EndFunction
endProperty

string property modFolderPath
	string Function get()
		return JMap.getStr(AHMain.objAHHotkeysData, "modFolderPath")
	EndFunction
	Function set(string theString)
		JMap.setStr(AHMain.objAHHotkeysData, "modFolderPath", theString)
	EndFunction
endProperty

string property hotKeySetExtension = ".AHHotkeySet" autoreadonly
string property userSettingsExtension = ".AHHSettings" autoreadonly
string property userSettingsFileName = "AHHotkeys User Settings" autoreadonly
int property kModFolderPath_UserDirectory = 0 autoreadonly
int property kModFolderPath_SkyrimDataDirectory = 1 autoreadonly

int property modFolderPathType
	int Function get()
		return JMap.getInt(AHMain.objUserSettings, "modFolderPathType")
	EndFunction
	Function set(int aiValue)
		JMap.setInt(AHMain.objUserSettings, "modFolderPathType", aiValue)
		if aiValue == kModFolderPath_UserDirectory
			modFolderPath = JContainers.userDirectory() + "AH Hotkeys Data/"
			modFolderPath = AHUtils.ReplaceBackslashesInString(modFolderPath)
		elseif aiValue == kModFolderPath_SkyrimDataDirectory
			modFolderPath = "Data/AH Hotkeys Data/"
		endIf
		; JLua.evalLuaInt("AH_Hotkeys.SetVar_modFolderPath(\"" + modFolderPath + "\")", 0)
	EndFunction
endProperty

function DebugMessage(string theText, int messageLevel = 0, bool showNotification = false, bool showMessageBox = false, bool printInUserLog = true, bool useLuaLog = false)
	if useLuaLog
		JLua.evalLuaInt("AH_Hotkeys.LogMessage(\"" + theText + "\", " + messageLevel + ")", 0)
	else
		if !AHMain.bDebugScript || (messageLevel > AHMain.debugLevel)
			return
		endIf
		if printInUserLog
			Debug.TraceUser(AHMain.debugLogFileName, theText)
		endIf
		if showNotification
			Debug.Notification(theText)
		endif
		if showMessageBox
			debug.MessageBox(theText)
		endif
	endif
endfunction

function InitialisePlayer()
	playerREF = AHMain.playerREF
endfunction

string function SetFontColour(string mcmText, string hexColourString)
	; Doesn't work at the moment? Disable for now.
	; return "<font color='"+hexColourString+"'>"+mcmText+"</font>"
	return mcmText
endFunction

;---------------------EQUIPSET FUNCTIONS ---------------------
function SetEquipSetMenuValueToDefault()
	int currentSetIndex = -1
		currentSetIndex = AHMgr.GetEquipSetIndex(objCurrentEquipSet)
		if currentSetIndex < 0
			SetMenuOptionValueST("", false, "EquipSetMenu")
		else
			SetMenuOptionValueST(JMap.getStr(objCurrentEquipSet, "name"), false, "EquipSetMenu")
		endIf
endFunction

function EquipSetHotkeyGroupFilterMenu()
endFunction
state EquipSetHotkeyGroupFilterMenu
	event OnMenuOpenST()
		DebugMessage("EquipSetHotkeyGroupFilterMenu()")
		int objHotKeyGroupMenuList = GetHotKeyGroupMenuList(true)
		string[] hotKeyGroupMenuList = JArray.asStringArray(objHotKeyGroupMenuList)
		; string[] hotKeyGroupMenuList = GetHotKeyGroupMenuList(true) ; return hotkey groups with number of EquipSets
		SetMenuDialogStartIndex(currentEquipSetHotKeyGroupFilterIndex)
		SetMenuDialogDefaultIndex(currentEquipSetHotKeyGroupFilterIndex)
		SetMenuDialogOptions(hotKeyGroupMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		currentEquipSetHotKeyGroupFilterIndex = menuIndex
		string hotkeyGroupText = AHMgr.GetHotkeyGroupText(currentEquipSetHotKeyGroupFilterIndex)
		SetMenuOptionValueST(hotkeyGroupText)
		int hotkeyGroupID = AHMgr.GetHotkeyGroupID(currentEquipSetHotKeyGroupFilterIndex)
		if hotKeyGroupID != 0
			int currentEquipSetIndex = AHMgr.GetEquipSetIndex(objCurrentEquipSet)
			int objEquipSet = AHMgr.FindEquipSetByHotkeyGroupID(hotkeyGroupID, currentEquipSetIndex, true)
			ShowEquipSet(objEquipSet)
			DebugMessage("EquipSetHotkeyGroupFilterMenu(): objCurrentEquipSet = " + JMap.getStr(objCurrentEquipSet, "name") + "; last used hotkeyGroupID = " + hotKeyGroupID)
		else
			DebugMessage("EquipSetHotkeyGroupFilterMenu(): All Groups selected. No change to current EquipSet required.")
		endIf
		ForcePageReset()
	endEvent

	event OnDefaultST()
		string hotkeyGroupText = AHMgr.GetHotkeyGroupText(currentEquipSetHotKeyGroupFilterIndex)
		SetMenuOptionValueST(hotkeyGroupText)
	endEvent

	event OnHighlightST()
		SetInfoText("Filter EquipSet menu list by Hotkey Group.")
	endEvent
endState

function SetHotkeyGroupLastUsedEquipSet(int objEquipSet)
	if objEquipSet
		int hotKeyGroupID = JMap.getInt(objEquipSet, "hotKeyGroupID")
		JMap.setObj(AHMain.objHotkeyGroupLastUsedEquipSets, hotKeyGroupID, objEquipSet)
		DebugMessage("SetHotkeyGroupLastUsedEquipSet(): " + AHMgr.GetHotkeyGroupTextFromID(hotkeyGroupID) + " --> " + JMap.getStr(JMap.getObj(AHMain.objHotkeyGroupLastUsedEquipSets, hotkeyGroupID), "name"))
	endIf
endFunction

function EquipSetMenu()
endFunction
string EquipSetMenu_kCancel = "(Cancel)"
int EquipSetMenu_listOffset
state EquipSetMenu
	event OnSelectST()
		DebugMessage("EquipSetMenu()")
		int objHotkeyGroupIDArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupIDArray")
		int currentEquipSetHotKeyGroupFilterID = AHMgr.GetHotkeyGroupID(currentEquipSetHotKeyGroupFilterIndex)
		int objFilteredEquipSetArray = AHMgr.GetEquipSetArrayByHotkeyGroup(currentEquipSetHotKeyGroupFilterID)
		JValue.addToPool(objFilteredEquipSetArray, JCTempPoolClearOnKeyDown)
		int objMenuItem = AHMain.GetEquipSetFromList("Open EquipSet:", 0, objFilteredEquipSetArray, includeCancel = true, includeBack = false, includeHotkeyGroups = true, includeFindEquipSet = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		; elseif menuItemString == AHMain.kBackMenuItemString
		; 	objMenuItem = AHMain.GetEquipSetFromList("Open EquipSet:", 0, objFilteredEquipSetArray, includeCancel = true, includeBack = false, includeHotkeyGroups = true, includeFindEquipSet = true)
		else
			int objEquipSet = JMap.getObj(objMenuItem, "equipSet")
			DebugMessage("EquipSetMenu(): GetEquipSetFromList() = " + objEquipSet + "(" + JMap.getStr(objEquipSet, "name") + ")")
			if objEquipSet
				ShowEquipSet(objEquipSet)
			endIf
		endIf
	endEvent
	; event OnMenuOpenST()
	; 	DebugMessage("EquipSetMenu()")
	; 	int objEquipSet
	; 	int theKeyCode
	; 	string theEquipSetName
	; 	string menuItemString
	; 	string menuItemSuffixString
	; 	string keyString
	; 	bool isAlt
	; 	bool isControl
	; 	bool isShift
	; 	int arraySize
	; 	int i
	; 	int listIndex
	; 	int defaultIndex
	; 	int hotkeyGroupID
	; 	int objHotkeyGroupIDArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupIDArray")
	; 	int currentEquipSetHotKeyGroupFilterID = AHMgr.GetHotkeyGroupID(currentEquipSetHotKeyGroupFilterIndex)
	; 	if !objMenuListStringsArray
	; 		objMenuListStringsArray = JValue.addToPool(JArray.object(), JCTempPoolClearOnCloseMCM)
	; 	else
	; 		JArray.clear(objMenuListStringsArray)
	; 	endIf
	; 	if !objEquipSetMenuListArray
	; 		objEquipSetMenuListArray = JValue.addToPool(JArray.object(), JCTempPoolClearOnCloseMCM)
	; 	else
	; 		JArray.clear(objEquipSetMenuListArray)
	; 	endIf
	; 	JArray.addStr(objMenuListStringsArray, EquipSetMenu_kCancel)
	; 	EquipSetMenu_listOffset = JArray.count(objMenuListStringsArray)
	; 	arraySize = JArray.count(AHMain.objEquipSetArray)
	; 	i = 0
	; 	listIndex = 0
	; 	while i < arraySize
	; 		objEquipSet = AHMain.GetEquipSetFromIndex(i)
	; 		hotkeyGroupID = JMap.getInt(objEquipSet, "hotkeyGroupID")
	; 		if (currentEquipSetHotKeyGroupFilterID == 0) || (hotkeyGroupID == currentEquipSetHotKeyGroupFilterID)
	; 			theEquipSetName = JMap.getStr(objEquipSet, "name")
	; 			theKeyCode = JMap.getInt(objEquipSet, "hotKey")
	; 			keyString = AHUtils.GetKeyCodeString(theKeyCode, false)
	; 			isAlt = JMap.getInt(objEquipSet, "altKey") as bool
	; 			isControl = JMap.getInt(objEquipSet, "controlKey") as bool
	; 			isShift = JMap.getInt(objEquipSet, "shiftKey") as bool
	; 			menuItemString = ((listIndex + 1) + ") " + theEquipSetName)
	; 			menuItemSuffixString = ""
	; 			if isAlt
	; 				menuItemSuffixString = menuItemSuffixString + " Alt"
	; 			endIf
	; 			if isControl
	; 				menuItemSuffixString = menuItemSuffixString + " Control"
	; 			endIf
	; 			if isShift
	; 				menuItemSuffixString = menuItemSuffixString + " Shift"
	; 			endIf
	; 			if keyString
	; 				menuItemSuffixString = menuItemSuffixString + " " + keyString
	; 			else
	; 				menuItemSuffixString = menuItemSuffixString
	; 			endIf
	; 			if menuItemSuffixString
	; 				menuItemString = menuItemString + " -" + menuItemSuffixString
	; 			endIf
	; 			JArray.addStr(objMenuListStringsArray, menuItemString)
	; 			JArray.addObj(objEquipSetMenuListArray, objEquipSet)
	; 			if objEquipSet == objCurrentEquipSet
	; 				defaultIndex = listIndex
	; 			endIf
	; 			listIndex += 1
	; 		endIf
	; 		i += 1
	; 	EndWhile
	; 	string[] equipSetMenuArray = JArray.asStringArray(objMenuListStringsArray)
	; 	if listIndex == 0
	; 		SetMenuDialogStartIndex(0)
	; 		SetMenuDialogDefaultIndex(0)
	; 	else
	; 		SetMenuDialogStartIndex(defaultIndex + EquipSetMenu_listOffset)
	; 		SetMenuDialogDefaultIndex(defaultIndex + EquipSetMenu_listOffset)
	; 	endIf
	; 	SetMenuDialogOptions(equipSetMenuArray)
	; endEvent

	; event OnMenuAcceptST(int menuIndex)
	; 	string menuItemString = JArray.getStr(objMenuListStringsArray, menuIndex)
	; 	if menuItemString == EquipSetMenu_kCancel
	; 		return
	; 	else
	; 		int index = menuIndex - EquipSetMenu_listOffset
	; 		int objEquipSet = JArray.getObj(objEquipSetMenuListArray, index)
	; 		DebugMessage("EquipSetMenu(): menuIndex = " + menuIndex + "; EquipSet = " + objEquipSet + "; " + JMap.getStr(objEquipSet, "name"))
	; 		if objEquipSet != 0
	; 			ShowEquipSet(objEquipSet)
	; 		endIf
	; 	endIf
	; endEvent

	; event OnDefaultST()
	; 	SetEquipSetMenuValueToDefault()
	; endEvent

	event OnHighlightST()
		SetInfoText("Select and edit saved EquipSet.")
	endEvent
endState

function EquipSetGroupMenu()
endFunction
state EquipSetGroupMenu
	event OnMenuOpenST()
		DebugMessage("EquipSetGroupMenu()")
		string hotKeyGroupMenuListText
		int objHotKeyGroupMenuList = GetHotKeyGroupMenuList(true)
		string[] hotKeyGroupMenuList = JArray.asStringArray(objHotKeyGroupMenuList)
		; string[] hotKeyGroupMenuList = GetHotKeyGroupMenuList(true)
		int equipSetHotKeyGroupID = JMap.getInt(objCurrentEquipSet, "hotkeyGroupID")
		int equipSetHotKeyGroupIndex = AHMgr.GetHotkeyGroupIndexFromID(equipSetHotKeyGroupID)
		SetMenuDialogStartIndex(equipSetHotKeyGroupIndex)
		SetMenuDialogDefaultIndex(equipSetHotKeyGroupIndex)
		SetMenuDialogOptions(hotKeyGroupMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		int hotkeyGroupIndex = menuIndex
		string hotkeyGroupText = AHMgr.GetHotkeyGroupText(hotkeyGroupIndex)
		int hotkeyGroupID = AHMgr.GetHotkeyGroupID(hotkeyGroupIndex)
		JMap.setInt(objCurrentEquipSet, "hotkeyGroupID", hotkeyGroupID)
		SetMenuOptionValueST(hotkeyGroupText)
		if currentEquipSetHotKeyGroupFilterIndex > 0 ; only switch hotkey groups if the current group is not the Default Set
			currentEquipSetHotKeyGroupFilterIndex = hotkeyGroupIndex
		endIf
		DebugMessage("EquipSetGroupMenu() = " + hotkeyGroupText)
		ForcePageReset()
	endEvent

	event OnDefaultST()
		int equipSetHotKeyGroupID = JMap.getInt(objCurrentEquipSet, "hotkeyGroupID")
		string hotkeyGroupText = AHMgr.GetHotkeyGroupTextFromID(equipSetHotKeyGroupID)
		SetMenuOptionValueST(hotkeyGroupText)
	endEvent

	event OnHighlightST()
		SetInfoText("Change hotkey group.")
	endEvent
endState

bool function CheckConflictingKeyCombo(int theKeyCodeCombo); return false if user chooses to cancel
	int theKeyCode = AHMain.GetKeyFromKeyCombo(theKeyCodeCombo)
	DebugMessage("CheckConflictingKeyCombo(): keyCode = " + theKeyCode)
	if (theKeyCode <= 0) ; after removing the modifier keys from keyCombo, keyCode = -1, therefore exit (no conflict).
		return true
	endIf
	int objConflictingEquipSetArray = AHMain.GetAllEquipSetsFromHotkeyCombo(theKeyCodeCombo)
	if JValue.empty(objConflictingEquipSetArray) ; no conflict with any EquipSet
		return true
	endIf
	int foundIndex = JArray.findObj(objConflictingEquipSetArray, objCurrentEquipSet)
	if foundIndex >= 0
		JArray.eraseIndex(objConflictingEquipSetArray, foundIndex)
		if JValue.empty(objConflictingEquipSetArray) ; no further EquipSets to check
			return true
		endIf
	endIf
	string equipSetNames
	int objEquipSet
	int i = 0
	while i < JArray.count(objConflictingEquipSetArray)
		objEquipSet = JArray.getObj(objConflictingEquipSetArray, i)
		equipSetNames = equipSetNames + JMap.getStr(objEquipSet, "name") + "\n"
		i += 1
	EndWhile 
	if !ShowMessage("This hot key including modifiers are used by the following EquipSets:\n" + equipSetNames + "Continue or Cancel?", true, "Continue", "Cancel")
		return false
	endIf
	return true
endFunction

; function ExitMCMButton()
; endFunction
; state ExitMCMButton
; 	event OnSelectST()
; 		DebugMessage("ExitMCMButton(): escaping out of MCM menu.")
; 		; int n = 3
; 		; int i = 0
; 		; while i < n
; 		; 	DebugMessage("Tapping Key...")
; 		; 	Input.TapKey(KEY_ESCAPE)
; 		; 	Utility.WaitMenuMode(0.3)
; 		; 	i += 1
; 		; EndWhile
; 		ExitMCM()
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("Exits the MCM menu back to the game (this presses the Escape Key 3 times in quick succession).")
; 	endEvent
; endState

; function ExitMCM()
; 	; float timeout = 2.0
; 	; float startTime = Utility.GetCurrentRealTime()
; 	; float endTime
; 	; float elapsedTime = 0
; 	; int n
; 	; int keyCode = Input.GetMappedKey("Journal", AHMain.kDeviceType_AutoDetect)
; 	; while (elapsedTime < timeout) && UI.IsMenuOpen("Journal Menu")
; 	; 	Input.TapKey(keyCode)
; 	; 	Utility.WaitMenuMode(0.1)
; 	; 	n += 1
; 	; 	endTime = Utility.GetCurrentRealTime()
; 	; 	elapsedTime = endTime - startTime
; 	; EndWhile
; 	; DebugMessage("Tapped Key " + n + " times.")
; 	; AHMain.WaitForMenuToClose("Journal Menu")
; endFunction

function EquipSetKeyMap()
endFunction
state EquipSetKeyMap ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("EquipSetKeyMap(" + theKeyCode + ")")
    	int oldHotKey = JMap.getInt(objCurrentEquipSet, "hotKey")
		bool acceptKey = true
    	if (conflictControl != "") && (theKeyCode != -1)
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
        bool isAltKey = JMap.getInt(objCurrentEquipSet, "altKey") as bool
		bool isControlKey = JMap.getInt(objCurrentEquipSet, "controlKey") as bool
		bool isShiftKey = JMap.getInt(objCurrentEquipSet, "shiftKey") as bool
		bool isModifierKey4 = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if (theKeyCode != -1)
			if !CheckConflictingKeyCombo(theKeyCodeCombo)
				acceptKey = false
			endIf
		endIf
		if theKeyCode == oldHotKey
			DebugMessage("EquipSetKeyMap(" + theKeyCode + "): keyCode same as previous. Exiting.")
			acceptKey = false
			return
		endIf
		if acceptKey
	        if oldHotKey
	        	AHMgr.UnregisterEquipSetHotKey(objCurrentEquipSet)
	        endIf
			JMap.setInt(objCurrentEquipSet, "hotKey", theKeyCode)
	        JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
	        SetKeyMapOptionValueST(theKeyCode)
	        AHMgr.RegisterEquipSetHotKey(objCurrentEquipSet)
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
        SetKeyMapOptionValueST(theKeyCode)
    endEvent

    event OnHighlightST()
        SetInfoText("Set hot key for this EquipSet.")
    endEvent
endState

; function AltToggle()
; endFunction
; state AltToggle ; TOGGLE
; 	event OnSelectST()
; 		int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
; 		bool isAltKey = !JMap.getInt(objCurrentEquipSet, "altKey")
; 		bool isControlKey = JMap.getInt(objCurrentEquipSet, "controlKey") as bool
; 		bool isShiftKey = JMap.getInt(objCurrentEquipSet, "shiftKey") as bool
; 		bool isModifierKey4 = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
; 		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
; 		if theKeyCode > -1
; 			if !CheckConflictingKeyCombo(theKeyCodeCombo)
; 				return
; 			endIf
; 		endIf
; 		JMap.setInt(objCurrentEquipSet, "altKey", isAltKey as int)
; 		JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
; 		SetToggleOptionValueST(isAltKey)
; 		DebugMessage("AltToggle() = " + isAltKey)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "altKey") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("Toggle Alt key modifier for hotkey.")
; 	endEvent
; endState

; function ControlToggle()
; endFunction
; state ControlToggle ; TOGGLE
; 	event OnSelectST()
; 		int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
; 		bool isAltKey = JMap.getInt(objCurrentEquipSet, "altKey") as bool
; 		bool isControlKey = !JMap.getInt(objCurrentEquipSet, "controlKey")
; 		bool isShiftKey = JMap.getInt(objCurrentEquipSet, "shiftKey") as bool
; 		bool isModifierKey4 = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
; 		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
; 		if theKeyCode > -1
; 			if !CheckConflictingKeyCombo(theKeyCodeCombo)
; 				return
; 			endIf
; 		endIf
; 		JMap.setInt(objCurrentEquipSet, "controlKey", isControlKey as int)
; 		JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
; 		SetToggleOptionValueST(isControlKey)
; 		DebugMessage("ControlToggle() = " + isControlKey)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "controlKey") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("Toggle Control key modifier for hotkey.")
; 	endEvent
; endState

; function ShiftToggle()
; endFunction
; state ShiftToggle ; TOGGLE
; 	event OnSelectST()
; 		int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
; 		bool isAltKey = JMap.getInt(objCurrentEquipSet, "altKey")
; 		bool isControlKey = JMap.getInt(objCurrentEquipSet, "controlKey")
; 		bool isShiftKey = !JMap.getInt(objCurrentEquipSet, "shiftKey")
; 		bool isModifierKey4 = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
; 		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
; 		if theKeyCode > -1
; 			if !CheckConflictingKeyCombo(theKeyCodeCombo)
; 				return
; 			endIf
; 		endIf
; 		JMap.setInt(objCurrentEquipSet, "shiftKey", isShiftKey as int)
; 		JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
; 		SetToggleOptionValueST(isShiftKey)
; 		DebugMessage("ShiftToggle() = " + isShiftKey)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "shiftKey") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("Toggle Shift key modifier for hotkey.")
; 	endEvent
; endState

; function ModifierKey4Toggle()
; endFunction
; state ModifierKey4Toggle ; TOGGLE
; 	event OnSelectST()
; 		int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
; 		bool isAltKey = JMap.getInt(objCurrentEquipSet, "altKey")
; 		bool isControlKey = JMap.getInt(objCurrentEquipSet, "controlKey")
; 		bool isShiftKey = JMap.getInt(objCurrentEquipSet, "shiftKey")
; 		bool isModifierKey4 = !JMap.getInt(objCurrentEquipSet, "modifierKey4")
; 		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
; 		if theKeyCode > -1
; 			if !CheckConflictingKeyCombo(theKeyCodeCombo)
; 				return
; 			endIf
; 		endIf
; 		JMap.setInt(objCurrentEquipSet, "modifierKey4", isModifierKey4 as int)
; 		JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
; 		SetToggleOptionValueST(isModifierKey4)
; 		DebugMessage("ModifierKey4Toggle() = " + isModifierKey4)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("Toggle 4th modifier key.")
; 	endEvent
; endState

; function UnequipLeftHandToggle()
; endFunction
; state UnequipLeftHandToggle ; TOGGLE
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipLeftHand") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "unequipLeftHand", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("UnequipLeftHandToggle() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipLeftHand") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, unequips the left hand item when switching to this EquipSet.")
; 	endEvent
; endState

; function UnequipRightHandToggle()
; endFunction
; state UnequipRightHandToggle ; TOGGLE
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipRightHand") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "unequipRightHand", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("UnequipRightHandToggle() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipRightHand") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, unequips the right hand item when switching to this EquipSet.")
; 	endEvent
; endState

; function UnequipAllItemsToggle()
; endFunction
; state UnequipAllItemsToggle ; TOGGLE
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipAllItems") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "unequipAllItems", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("UnequipAllItemsToggle() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipAllItems") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, unequips all apparel items when switching to this EquipSet.")
; 	endEvent
; endState

; function ReEquipItemsToggle()
; endFunction
; state ReEquipItemsToggle ; TOGGLE
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "reEquipItems") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "reEquipItems", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("ReEquipItemsToggle() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "reEquipItems") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, re-equips items when switching EquipSets (rather than doing nothing if same item is already equipped). Also allows an item to be un-equipped when toggle items is checked but there is no item to be equipped in its place.")
; 	endEvent
; endState

; function SheatheHandsOnUnequipToggle()
; endFunction
; state SheatheHandsOnUnequipToggle ; TOGGLE
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "sheatheHandsOnUnequip") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "sheatheHandsOnUnequip", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("SheatheHandsOnUnequipToggle() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "sheatheHandsOnUnequip") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, sheathes and redraws weapons and spells when unequipping. This can be checked to fix bugs that may occur when equipping without sheathing first (e.g. crossbow bolts may be stuck to the player's hands when equipping another weapon or spell).")
; 	endEvent
; endState

; function OverrideUnequipItemExclusionToggle()
; endFunction
; state OverrideUnequipItemExclusionToggle
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "overrideUnequipItemExclusion") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "overrideUnequipItemExclusion", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("OverrideUnequipItemExclusionToggle() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "overrideUnequipItemExclusion") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, the Unequip Left Hand, Unequip Right Hand and Unequip All Other Items options will unequip items that are included in the Unequip Item Exclusion list. Otherwise, these items will not be unequipped.")
; 	endEvent
; endState


; function NotifyWhenSetEquippedToggle()
; endFunction
; state NotifyWhenSetEquippedToggle ; TOGGLE
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "notifyWhenSetEquipped") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "notifyWhenSetEquipped", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("NotifyWhenSetEquippedToggle() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "notifyWhenSetEquipped") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, prints name of EquipSet when equipped.")
; 	endEvent
; endState

; function NotifyWhenItemEquippedToggle()
; endFunction
; state NotifyWhenItemEquippedToggle ; TOGGLE
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "notifyWhenItemEquipped") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "notifyWhenItemEquipped", toggleVal as int)
; 		JMap.setInt(objCurrentEquipSet, "notifyItemsRemaining", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("NotifyWhenItemEquippedToggle() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "notifyWhenItemEquipped") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, prints name of each item that is equipped.")
; 	endEvent
; endState

; function PropogateEquipMode()
; endFunction
; state PropogateEquipMode ; TOGGLE
; 	event OnSelectST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "propogateEquipMode") as bool
; 		toggleVal = !toggleVal
; 		JMap.setInt(objCurrentEquipSet, "propogateEquipMode", toggleVal as int)
; 		SetToggleOptionValueST(toggleVal)
; 		DebugMessage("PropogateEquipMode() = " + toggleVal)
; 	endEvent

; 	event OnDefaultST()
; 		bool toggleVal = JMap.getInt(objCurrentEquipSet, "propogateEquipMode") as bool
; 		SetToggleOptionValueST(toggleVal)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, carries forward the equip mode to (and overrides) other equipsets that are added to this one and combines all apparel items together to determine equipping behaviour. Check this to ensure that all equipsets linked to this equipset are considered one equipset (except for hand items and autocasting - these are still actioned separately).")
; 	endEvent
; endState

Function BackupEquipSet(int objEquipSet) ; backs up the EquipSet to the objBackupEquipSet variable
	DebugMessage("BackupEquipSet()")
	if objEquipSet == 0
		objBackupEquipSet = AHMgr.DeleteEquipSet(objBackupEquipSet)
	else
		objBackupEquipSet = AHMgr.DeleteEquipSet(objBackupEquipSet)
		objBackupEquipSet = AHMgr.NewEquipSetObject()
		AHMgr.CopyEquipSet(objEquipSet, objBackupEquipSet) ; backup EquipSet for revert button.
	endIf
EndFunction

int Function RestoreEquipSetFromBackup(int objEquipSet) ; backs up the EquipSet to the objBackupEquipSet variable
	if objBackupEquipSet != 0
		AHMgr.CopyEquipSet(objBackupEquipSet, objEquipSet) ; backup EquipSet for revert button.
	endIf
EndFunction

Function ShowEquipSet(int objEquipSet)
	objPreviousEquipSet = objCurrentEquipSet
	objCurrentEquipSet = objEquipSet
	if objCurrentEquipSet
		BackupEquipSet(objEquipSet) ; backup EquipSet
		int hotkeyGroupID = JMap.getInt(objEquipSet, "hotKeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
	endIf
	ForcePageReset()
EndFunction

string Function GetNewEquipSetName()
	int nextEquipSetIndex = JArray.count(AHMain.objEquipSetArray)
	return ("EquipSet-" + (nextEquipSetIndex))
endFunction

int Function AddNewEquipSet()
	int objNewEquipSet = AHMgr.NewEquipSetObject()
	int currentEquipSetHotKeyGroupFilterID = AHMgr.GetHotkeyGroupID(currentEquipSetHotKeyGroupFilterIndex)
	AHMgr.SaveEquipSet(objNewEquipSet)
	JMap.setStr(objNewEquipSet, "name", GetNewEquipSetName())
	JMap.setInt(objNewEquipSet, "hotkeyGroupID", currentEquipSetHotKeyGroupFilterID)
	return objNewEquipSet
EndFunction

function FileMenu()
endFunction
state FileMenu
	event OnMenuOpenST()
		DebugMessage("FileMenu()")
		string[] fileMenuStringArray = new string[6]
		fileMenuStringArray[0] = "(Cancel)"
		fileMenuStringArray[1] = "New EquipSet"
		if objCurrentEquipSet != 0
			fileMenuStringArray[2] = "Revert EquipSet"
			fileMenuStringArray[3] = "Duplicate EquipSet"
			fileMenuStringArray[4] = "Delete EquipSet"
			fileMenuStringArray[5] = "Rename EquipSet"
		endIf
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(1)
		SetMenuDialogOptions(fileMenuStringArray)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("FileMenu(): menuIndex = " + menuIndex)
		string theText
		if menuIndex == 0
			return
		elseif menuIndex == 1 ; New
			int objNewEquipSet = AddNewEquipSet()
			ShowEquipSet(objNewEquipSet)
			theText = AHUtils.ShowUILibTextInput("EquipSet Name", JMap.getStr(objNewEquipSet, "name"))
			if theText
				JMap.setStr(objNewEquipSet, "name", theText)
				SetMenuOptionValueST(theText, false, "EquipSetMenu")
			endIf
		elseif menuIndex == 2 ; Revert
			if ShowMessage("Revert this EquipSet back to last saved?", true, "Revert", "Cancel")
				RestoreEquipSetFromBackup(objCurrentEquipSet)
				ShowEquipSet(objCurrentEquipSet)
			endIf
		elseif menuIndex == 3 ; Duplicate
			int objNewEquipSet = AHMgr.SaveAsEquipSet(objCurrentEquipSet)
			string equipSetName = GetNewEquipSetName()
			JMap.setStr(objNewEquipSet, "name", equipSetName)
			ShowEquipSet(objNewEquipSet)
			theText = AHUtils.ShowUILibTextInput("Rename Duplicated EquipSet", JMap.getStr(objNewEquipSet, "name"))
			if theText
				JMap.setStr(objNewEquipSet, "name", theText)
				SetMenuOptionValueST(theText, false, "EquipSetMenu")
			endIf
		elseif menuIndex == 4 ; Delete
			DeleteEquipSetMenuItem()
		elseif menuIndex == 5 ; Rename
			theText = AHUtils.ShowUILibTextInput("Rename EquipSet", JMap.getStr(objCurrentEquipSet, "name"))
			if theText
				JMap.setStr(objCurrentEquipSet, "name", theText)
				SetMenuOptionValueST(theText, false, "EquipSetMenu")
				ForcePageReset()
			endIf
		endIf
	endEvent

	event OnDefaultST()
		
	endEvent

	event OnHighlightST()
		SetInfoText("File Menu: New, Duplicate, Revert, Delete, Rename EquipSets")
	endEvent
endState

Function DeleteEquipSetMenuItem()
	DebugMessage("DeleteEquipSetMenuItem()")
	int objEquipSet
	int foundIndex
	int hotkeyGroupID
	string equipSetsContainingCurrentSet
	int currentEquipSetHotKeyGroupFilterID = AHMgr.GetHotkeyGroupID(currentEquipSetHotKeyGroupFilterIndex)
	int newEquipSetIndex
	int i
	int foundCount
	int objEquipSetItem
	int objFormArray
	int objItemTypeArray
	int arraySize = JArray.count(AHMain.objEquipSetArray)
	if ShowMessage("Delete EquipSet \"" + JMap.getStr(objCurrentEquipSet, "name") + "\"?", true, "Delete", "Cancel")
		while i < arraySize
			objEquipSet = JArray.getObj(AHMain.objEquipSetArray, i)
			if objEquipSet != objCurrentEquipSet
				if EquipSetContainsEquipSetItem(objEquipSet, objCurrentEquipSet, false)
					equipSetsContainingCurrentSet = equipSetsContainingCurrentSet + JMap.getStr(objEquipSet, "name") + "; "
					foundCount += 1
				endIf
			endIf
			i += 1
		EndWhile
		if foundCount > 0
			if ShowMessage("The following EquipSets contain this EquipSet: \n" + AHUtils.TruncateString(equipSetsContainingCurrentSet, 2, false, true) + "\nContinue with Delete?", true, "Delete", "Cancel")
				i = 0
				while i < arraySize
					objEquipSet = JArray.getObj(AHMain.objEquipSetArray, i)
					objFormArray = JMap.getObj(objEquipSet, "formArray")
					objItemTypeArray = JMap.getObj(objEquipSet, "itemTypeArray")
					foundIndex = JArray.findObj(objFormArray, objCurrentEquipSet)
					if foundIndex != -1
						AHMain.SetEquipSetWornItem(objEquipSet, 0, foundIndex)
					endIf
					i += 1
				EndWhile
			else
				return
			endIf
		endIf
		int equipSetIndex = AHMgr.GetEquipSetIndex(objCurrentEquipSet)
		AHMgr.DeleteEquipSetFromIndex(equipSetIndex)
		int numEquipSets = JArray.count(AHMain.objEquipSetArray)
		objCurrentEquipSet = AHMgr.FindEquipSetByHotkeyGroupID(currentEquipSetHotKeyGroupFilterID, equipSetIndex)
		ShowEquipSet(objCurrentEquipSet)
	endIf
EndFunction

function equipSetSlotHeaderToggle()
endFunction
state equipSetSlotHeaderToggle
	event OnSelectST()
		DebugMessage("EquipSetSlotHeaderToggle()")
		int useHandAndShoutSlots = JMap.getInt(objCurrentEquipSet, "useHandAndShoutSlots")
		if useHandAndShoutSlots
			JMap.setInt(objCurrentEquipSet, "useHandAndShoutSlots", 0)
			SetToggleOptionValueST(false)
		else
			JMap.setInt(objCurrentEquipSet, "useHandAndShoutSlots", 1)
			SetToggleOptionValueST(true)
		endIf
		ForcePageReset()
	endEvent

	event OnDefaultST()
		int useHandAndShoutSlots = JMap.getInt(objCurrentEquipSet, "useHandAndShoutSlots")
		SetToggleOptionValueST(useHandAndShoutSlots)
	endEvent

	event OnHighlightST()
		SetInfoText("Show or hide the lefthand, righthand and shout/power slots.")
	endEvent
endState

; For BuildInventoryListEvent threads
; int objFilteredItemArray
; int buildInventoryListThreadNumber
; int maxBuildInventoryListThreads
; int remainingBuildInventoryListThreads
; int runningBuildInventoryListThreadCount
; float buildInventoryListThreadStartTime
; bool buildInventoryListThreadsStarted
; bool buildInventoryListThreadsFinished

; event BuildInventoryListEvent(string itemNameFilter, int itemTypeFilterBits, int itemMagicEffectFilter, string itemMagicEffectFilterText, int startIndex, int endIndex)
	; runningBuildInventoryListThreadCount += 1
	; buildInventoryListThreadNumber += 1
	; int threadNumber = buildInventoryListThreadNumber
	; float startTime = Utility.GetCurrentRealTime()
	; if threadNumber == 1
	; 	buildInventoryListThreadStartTime = startTime
	; endIf
	; int n
	; int totalNum
	; form itemForm
	; int numMagicEffects
	; int objItemObject
	; int itemObjectType
	; int objInventoryItem
	; int objMagicEffectNameArray
	; int actualItemType
	; string magicEffectName
	; string itemName
	; bool nameFilterPassed
	; bool typeFilterPassed
	; bool magicEffectFilterPassed
	; string filterString
	; bool doContainsStringSearch
	; string[] itemNameFilterArray = StringUtil.split(itemNameFilter, ",")
	; int itemNameFilterArraySize = itemNameFilterArray.Length
	; DebugMessage("BuildInventoryListEvent() thread #" + threadNumber + ". Processing inventory list: startIndex = " + startIndex + "; endIndex = " + endIndex + "; total items = " + (endIndex - startIndex + 1))
	; int i = startIndex
	; ; DebugMessage("Test math.pi JValue.evalLuaInt(0, 'return math.pi'): " + JValue.evalLuaInt(0, "return math.pi"))
	; ; DebugMessage("Test bitwise JValue.evalLuaInt(0, 'return bit32.bxor(8, 2, 10)'): " + JValue.evalLuaInt(0, "return bit32.bxor(8, 2, 10)"))
	; ; DebugMessage("Test bitwise JValue.evalLuaInt(0, 'return AH_Hotkeys.bitand(22, 2365)'): " + JValue.evalLuaInt(0, "return AH_Hotkeys.bitand(22, 2365)"))
	; ; DebugMessage("Test bitwise JValue.evalLuaInt(0, 'return AH_Hotkeys.bitand2(22, 2365)'): " + JValue.evalLuaInt(0, "return AH_Hotkeys.bitand2(22, 2365)"))
	; ; objFilteredItemArray = JValue.evalLuaObj(AHMain.objInventoryItemArray, "return jc.filter(jobject, function(x) return AH_Hotkeys.bitand(x.actualItemType, " + itemTypeFilterBits + ") > 0 end)")
	; ; objFilteredItemArray = JValue.evalLuaObj(AHMain.objInventoryItemArray, "return AH_Hotkeys.BuildInventory(" + AHMain.objInventoryItemArray + ", " + itemTypeFilterBits + ", " + itemNameFilter + ", " + itemMagicEffectFilter + ")")

	; DebugMessage("BuildInventoryListEvent(): objFilteredItemArray count = " + JArray.count(objFilteredItemArray))
	; while i <= endIndex
	; 	objItemObject = JArray.getObj(AHMain.objInventoryItemArray, i)
	; 	if objItemObject
	; 		itemObjectType = JMap.getInt(objItemObject, "objectType")
	; 		if itemObjectType == AHMain.kInventoryItemObject
	; 			objInventoryItem = objItemObject
	; 			itemForm = JMap.getForm(objInventoryItem, "itemForm")
	; 			itemName = JMap.getStr(objInventoryItem, "itemDisplayName")
	; 			; DebugMessage("Debug: BuildInventoryListEvent(): objInventoryItem = " + objInventoryItem + "; itemForm = " + itemForm + "; itemName = " + itemName)
	; 			if itemName != ""
	; 				actualItemType = JMap.getInt(objInventoryItem, "actualItemType")
	; 				; if actual item type is not included in item filter, then don't continue filtering
	; 				if math.LogicalAnd(itemTypeFilterBits, actualItemType)
	; 					typeFilterPassed = true
	; 				else
	; 					typeFilterPassed = false
	; 				endIf
	; 				if typeFilterPassed
	; 					if itemNameFilterArraySize > 0
	; 						nameFilterPassed = AHUtils.MatchFromStringArray(itemName, itemNameFilterArray, false, true)
	; 						; nameFilterPassed = AHUtils.MatchString(itemName, itemNameFilter, false, true)
	; 					else
	; 						nameFilterPassed = true
	; 					endIf
	; 					objMagicEffectNameArray = JMap.getObj(objInventoryItem, "itemMagicEffectNameArray")
	; 					if objMagicEffectNameArray != 0
	; 						numMagicEffects = JArray.count(objMagicEffectNameArray)
	; 						if itemMagicEffectFilterText != ""
	; 							magicEffectFilterPassed = false
	; 							n = 0
	; 							magicEffectName = ""
	; 							while (n < numMagicEffects) ; put all names together then do text search on all of them.
	; 								magicEffectName = magicEffectName + JArray.getStr(objMagicEffectNameArray, n) + "; "
	; 								n += 1
	; 							EndWhile
	; 							magicEffectFilterPassed = AHUtils.MatchString(magicEffectName, itemMagicEffectFilterText, false, true)
	; 						elseif itemMagicEffectFilter == kOtherEffect
	; 							magicEffectFilterPassed = false
	; 							n = 0
	; 							magicEffectName = ""
	; 							while n < numMagicEffects
	; 								magicEffectName = magicEffectName + JArray.getStr(objMagicEffectNameArray, n) + "; "
	; 								n += 1
	; 							EndWhile
	; 							if (StringUtil.Find(magicEffectName, healthEffectString) == -1) && (StringUtil.Find(magicEffectName, magickaEffectString) == -1) && (StringUtil.Find(magicEffectName, staminaEffectString) == -1)
	; 								magicEffectFilterPassed = true
	; 							endIf
	; 						else
	; 							magicEffectFilterPassed = true
	; 						endIf
	; 					elseif (itemMagicEffectFilter == kAllMagicEffects)
	; 						magicEffectFilterPassed = true
	; 					else
	; 						magicEffectFilterPassed = false
	; 					endIf
	; 				endIf
	; 				if nameFilterPassed && typeFilterPassed && magicEffectFilterPassed
	; 					; DebugMessage("BuildInventoryItemsArray(): item added = " + itemName)
	; 					if actualItemType == AHMain.kWeaponType
	; 						bool filterWeaponFavorites = JMap.getInt(AHMain.objUserSettings, "filterWeaponFavorites")
	; 						if (filterWeaponFavorites && game.IsObjectFavorited(itemForm)) || !filterWeaponFavorites
	; 							; JArray.addForm(objWeaponArray, itemForm)
	; 							JArray.addObj(objWeaponArray, objInventoryItem)
	; 						endIf
	; 					elseif actualItemType == AHMain.kShieldType
	; 						bool filterWeaponFavorites = JMap.getInt(AHMain.objUserSettings, "filterWeaponFavorites")
	; 						if (filterWeaponFavorites && game.IsObjectFavorited(itemForm)) || !filterWeaponFavorites
	; 							; JArray.addForm(objShieldArray, itemForm)
	; 							JArray.addObj(objShieldArray, objInventoryItem)
	; 						endIf
	; 					elseif actualItemType == AHMain.kScrollType
	; 						JArray.addForm(objScrollArray, itemForm)
	; 					elseif actualItemType == AHMain.kSpellType
	; 						bool filterSpellFavorites = JMap.getInt(AHMain.objUserSettings, "filterSpellFavorites")
	; 						if (filterSpellFavorites && game.IsObjectFavorited(itemForm)) || !filterSpellFavorites
	; 							; JArray.addForm(objSpellArray, itemForm)
	; 							JArray.addObj(objSpellArray, objInventoryItem)
	; 						endIf
	; 					elseif actualItemType == AHMain.kShoutType
	; 						; JArray.addForm(objShoutArray, itemForm)
	; 						JArray.addObj(objShoutArray, objInventoryItem)
	; 					elseif actualItemType == AHMain.kArmorType
	; 						bool filterArmorFavorites = JMap.getInt(AHMain.objUserSettings, "filterArmorFavorites")
	; 						if (filterArmorFavorites && game.IsObjectFavorited(itemForm)) || !filterArmorFavorites
	; 							; JArray.addForm(objArmorArray, itemForm)
	; 							JArray.addObj(objArmorArray, objInventoryItem)
	; 						endIf
	; 					elseif actualItemType == AHMain.kAmmoType
	; 						; JArray.addForm(objAmmoArray, itemForm)
	; 						JArray.addObj(objAmmoArray, objInventoryItem)
	; 					elseif actualItemType == AHMain.kPotionType
	; 						; JArray.addForm(objPotionArray, itemForm)
	; 						JArray.addObj(objPotionArray, objInventoryItem)
	; 					elseif actualItemType == AHMain.kFoodType
	; 						; JArray.addForm(objFoodArray, itemForm)
	; 						JArray.addObj(objFoodArray, objInventoryItem)
	; 					elseif actualItemType == AHMain.kIngredientType
	; 						JArray.addForm(objIngredientArray, itemForm)
	; 						JArray.addObj(objIngredientArray, objInventoryItem)
	; 					elseif actualItemType == AHMain.kPoisonType
	; 						; JArray.addForm(objPoisonArray, itemForm)
	; 						JArray.addObj(objPoisonArray, objInventoryItem)
	; 					else ; other
	; 						; JArray.addForm(objOtherArray, itemForm)
	; 						JArray.addObj(objOtherArray, objInventoryItem)
	; 					endIf
	; 					; DebugMessage("BuildInventoryListEvent(): added " + itemName + "; itemType = " + JMap.getInt(objInventoryItem, "itemType") + "; actualItemType = " + actualItemType)
	; 					totalNum += 1
	; 				endIf
	; 			endIf
	; 		endIf
	; 	endIf
	; 	; DebugMessage("Item(" + i + "): inventory item= " + itemName + "; actualItemType= " + actualItemType + "; name=" + nameFilterPassed + "; type=" + typeFilterPassed + "; magic=" + magicEffectFilterPassed + "; itemMagicEffectFilter= " + itemMagicEffectFilter + "; itemMagicEffectFilterText= " + itemMagicEffectFilterText)
	; 	i += 1
	; EndWhile
	; DebugMessage("BuildInventoryListEvent(): num items added = " + totalNum)
	; runningBuildInventoryListThreadCount -= 1
	; remainingBuildInventoryListThreads -= 1
	; float endTime = Utility.GetCurrentRealTime()
	; float elapsedTime = endTime - startTime
	; DebugMessage("BuildInventoryListEvent() thread #" + threadNumber + ": finished. Elapsed time = " + elapsedTime)
	; if remainingBuildInventoryListThreads == 0
	; 	elapsedTime = endTime - buildInventoryListThreadStartTime
	; 	DebugMessage("BuildInventoryListEvent(): all threads finished. Total elapsed time = " + elapsedTime)
	; 	buildInventoryListThreadsStarted = false
	; 	buildInventoryListThreadsFinished = true
	; endIf
; endEvent

; function WaitUntilBuildInventoryListThreadsFinish()
; 	bool continueWait = true
; 	; int previousCount
; 	while continueWait
; 		; previousCount = runningBuildInventoryListThreadCount
; 		if buildInventoryListThreadsStarted && !buildInventoryListThreadsFinished
; 			Utility.WaitMenuMode(0.1)
; 		else
; 			continueWait = false
; 			; DebugMessage("WaitUntilGetInventoryThreadsFinish(): exiting wait as runningInventoryThreadCount = " + runningInventoryThreadCount)
; 		endIf
; 	EndWhile
; endFunction

; Returns array of Forms
int Function BuildInventoryItemsArray(string itemNameFilter, int itemTypeFilterBits, int itemMagicEffectFilter, string itemMagicEffectFilterText, int objEquipSetItems, int objInventoryItemToKeep)
	float startTime = Utility.GetCurrentRealTime()
	DebugMessage("BuildInventoryItemsArray(); itemNameFilter = " + itemNameFilter + "; itemTypeFilterBits = " + itemTypeFilterBits + "; itemMagicEffectFilter = " + itemMagicEffectFilter + "; itemMagicEffectFilterText = " + itemMagicEffectFilterText)

	if !itemMagicEffectFilterText
		if itemMagicEffectFilter == kHealthEffect
			itemMagicEffectFilterText = healthEffectString
		elseif itemMagicEffectFilter == kStaminaEffect
			itemMagicEffectFilterText = staminaEffectString
		elseif itemMagicEffectFilter == kMagickaEffect
			itemMagicEffectFilterText = magickaEffectString
		elseif itemMagicEffectFilter == kHungerEffect
			itemMagicEffectFilterText = hungerEffectString
		elseif itemMagicEffectFilter == kOtherEffect
			itemMagicEffectFilterText = "!" + healthEffectString + ",!" + staminaEffectString + ",!" + magickaEffectString + ",!" + hungerEffectString
		endIf
	endIf

	; objFilteredItemArray = JValue.evalLuaObj(AHMain.objInventoryItemArray, "return jc.filter(jobject, function(x) return AH_Hotkeys.BitAnd(x.actualItemType, " + itemTypeFilterBits + ") > 0 end)")
	; DebugMessage("objFilteredItemArray, filter by itemType, count = " + JArray.count(objFilteredItemArray))

	; objFilteredItemArray = JValue.evalLuaObj(objFilteredItemArray, "return jc.filter(jobject, function(x) return AH_Hotkeys.MatchTextFromArray(x.itemDisplayName, AH_Hotkeys.SplitStringToTable(" + itemNameFilter + ")) == true end)")
	; ; string testStr = JValue.evalLuaStr(AHMain.objInventoryItemArray, "return AH_Hotkeys.SplitStringToTable(" + "itemNameFilter" + ")")
	; ; DebugMessage("Debug: testStr = " + testStr)
	; DebugMessage("objFilteredItemArray, filter by name, count = " + JArray.count(objFilteredItemArray))

	; objFilteredItemArray = JValue.evalLuaObj(objFilteredItemArray, "return jc.filter(jobject, function(x) return AH_Hotkeys.MatchTextFromArray(AH_Hotkeys.ConcatTableToString(x.itemMagicEffectNameArray), AH_Hotkeys.SplitStringToTable(" + itemMagicEffectFilterText + ")) == true end)")
	; DebugMessage("objFilteredItemArray, filter by magicEffect, count = " + JArray.count(objFilteredItemArray))

	; ADD IN EQUIPPED OBJECTS AS WELL
	; DebugMessage("BuildInventoryItemsArray(): objCurrentlyEquippedInventoryItems.rightHandItemObject = " + JMap.getStr(JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "rightHandItemObject"), "itemDisplayName"))
	; DebugMessage("BuildInventoryItemsArray(): objCurrentlyEquippedInventoryItems.leftHandItemObject = " + JMap.getStr(JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "leftHandItemObject"), "itemDisplayName"))
	int objCurrentlyWornItemsArray = JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "currentlyWornItemsArray")
	DebugMessage("BuildInventoryItemsArray(): currentlyWornItemsArray, count = " + JArray.count(objCurrentlyWornItemsArray))
	; AHMain.PrintInventoryItemArray(objCurrentlyWornItemsArray)

	int jLuaArgs = 0
	jLuaArgs = JLua.setObj("objCurrentlyEquippedInventoryItems", AHMain.objCurrentlyEquippedInventoryItems, jLuaArgs)
	jLuaArgs = JLua.setObj("objInventoryItemArray", AHMain.objInventoryItemArray, jLuaArgs)
	jLuaArgs = JLua.setInt("itemTypeFilterBits", itemTypeFilterBits, jLuaArgs)
	jLuaArgs = JLua.setStr("itemNameFilter", itemNameFilter, jLuaArgs)
	jLuaArgs = JLua.setStr("itemMagicEffectFilterText", itemMagicEffectFilterText, jLuaArgs)
	jLuaArgs = JLua.setInt("filterWeaponFavorites", JMap.getInt(AHMain.objUserSettings, "filterWeaponFavorites"), jLuaArgs)
	jLuaArgs = JLua.setInt("filterArmorFavorites", JMap.getInt(AHMain.objUserSettings, "filterArmorFavorites"), jLuaArgs)
	jLuaArgs = JLua.setInt("filterSpellFavorites", JMap.getInt(AHMain.objUserSettings, "filterSpellFavorites"), jLuaArgs)
	jLuaArgs = JLua.setObj("objEquipSetItems", objEquipSetItems, jLuaArgs)
	jLuaArgs = JLua.setObj("objInventoryItemToKeep", objInventoryItemToKeep, jLuaArgs)
	int objFilteredItemArray = JLua.evalLuaObj("return AH_Hotkeys.BuildInventory(args.objCurrentlyEquippedInventoryItems, args.objInventoryItemArray, args.itemTypeFilterBits, args.itemNameFilter, args.itemMagicEffectFilterText, args.filterWeaponFavorites, args.filterArmorFavorites, args.filterSpellFavorites, args.objEquipSetItems, args.objInventoryItemToKeep)", jLuaArgs)
	; objFilteredItemArray = JValue.evalLuaObj(AHMain.objInventoryItemArray, "return AH_Hotkeys.BuildInventory(jobject," + itemTypeFilterBits + ",'" + itemNameFilter + "','" + itemMagicEffectFilterText + "')")
	objFilteredItemArray = JValue.addToPool(objFilteredItemArray, JCTempPoolClearOnCloseMCM)
	; objFilteredItemArray = JValue.evalLuaObj(AHMain.objInventoryItemArray, "return AH_Hotkeys.BuildInventory(jobject," + itemTypeFilterBits + "," + itemNameFilter + "," + itemMagicEffectFilterText + ")")

	DebugMessage("objFilteredItemArray, BuildInventory via Lua, count = " + JArray.count(objFilteredItemArray))
	; AHMain.PrintInventoryItemArray(objFilteredItemArray)
	
	; int i

	; ; int objWeaponArray
	; ; int objShieldArray
	; ; int objScrollArray
	; ; int objSpellArray
	; ; int objShoutArray
	; ; int objArmorArray
	; ; int objAmmoArray
	; ; int objPotionArray
	; ; int objFoodArray
	; ; int objIngredientArray
	; ; int objPoisonArray
	; ; int objOtherArray

	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kWeaponType)
	; 	objWeaponArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objWeaponArray created = " + objWeaponArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kShieldType)
	; 	objShieldArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objShieldArray created = " + objShieldArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kScrollType)
	; 	objScrollArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objScrollArray created = " + objScrollArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kSpellType)
	; 	objSpellArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objSpellArray created = " + objSpellArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kShoutType)
	; 	objShoutArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objShoutArray created = " + objShoutArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kArmorType)
	; 	objArmorArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objArmorArray created = " + objArmorArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kAmmoType)
	; 	; DebugMessage("BuildInventoryItemsArray(): objAmmoArray created.")
	; 	objAmmoArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objAmmoArray created = " + objAmmoArray)
	; else
	; 	; DebugMessage("BuildInventoryItemsArray(): objAmmoArray NOT created.")
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kPotionType)
	; 	objPotionArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objPotionArray created = " + objPotionArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kFoodType)
	; 	objFoodArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objFoodArray created = " + objFoodArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kIngredientType)
	; 	objIngredientArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objIngredientArray created = " + objIngredientArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kPoisonType)
	; 	objPoisonArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objPoisonArray created = " + objPoisonArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kOtherType)
	; 	objOtherArray = JValue.addToPool(JArray.object(), JCTempLocalPool) 
	; 	; DebugMessage("objOtherArray created = " + objOtherArray)
	; endIf

	; int numItems = JArray.count(AHMain.objInventoryItemArray)
	; buildInventoryListThreadsStarted = false
	; buildInventoryListThreadsFinished = false
	; buildInventoryListThreadNumber = 0
	; remainingBuildInventoryListThreads = 0
	; runningBuildInventoryListThreadCount = 0
	; RegisterForModEvent("AHHotkeys_BuildInventoryListEvent", "BuildInventoryListEvent")
	; int buildInventoryListEventHandle
	; int threadArraySize
	; int numThreads = 1
	; maxBuildInventoryListThreads = numThreads
	; remainingBuildInventoryListThreads = maxBuildInventoryListThreads
	; int threadStartIndex
	; int threadEndIndex
	; DebugMessage("BuildInventoryItemsArray(): numItems = " + numItems + " (" + numThreads + " threads)")
	; if numItems > 0
	; 	buildInventoryListThreadsStarted = true
	; 	threadArraySize = numItems / numThreads
	; 	i = 1
	; 	while i <= numThreads
	; 		DebugMessage("Build Inventory List: Thread # " + i + " / " + numThreads)
	; 		buildInventoryListEventHandle = ModEvent.Create("AHHotkeys_BuildInventoryListEvent")
	; 		threadStartIndex = ((i - 1) * threadArraySize)
	; 		if i == numThreads
	; 			threadEndIndex = numItems - 1
	; 		else
	; 			threadEndIndex = (i * threadArraySize) - 1
	; 		endIf
	; 		ModEvent.PushString(buildInventoryListEventHandle, itemNameFilter)
	; 		ModEvent.PushInt(buildInventoryListEventHandle, itemTypeFilterBits)
	; 		ModEvent.PushInt(buildInventoryListEventHandle, itemMagicEffectFilter)
	; 		ModEvent.PushString(buildInventoryListEventHandle, itemMagicEffectFilterText)
	; 		ModEvent.PushInt(buildInventoryListEventHandle, threadStartIndex)
	; 		ModEvent.PushInt(buildInventoryListEventHandle, threadEndIndex)
	; 		ModEvent.Send(buildInventoryListEventHandle)
	; 		i += 1
	; 	EndWhile
	; 	WaitUntilBuildInventoryListThreadsFinish()
	; endIf

	; int objInventoryItemsToEquip = JValue.addToPool(JArray.object(), JCTempPoolClearOnCloseMCM)
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kWeaponType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objWeaponArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kShieldType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objShieldArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kScrollType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objScrollArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kSpellType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objSpellArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kShoutType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objShoutArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kArmorType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objArmorArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kAmmoType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objAmmoArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kPotionType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objPotionArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kFoodType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objFoodArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kIngredientType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objIngredientArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kPoisonType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objPoisonArray)
	; endIf
	; if math.LogicalAnd(itemTypeFilterBits, AHMain.kOtherType)
	; 	JArray.addFromArray(objInventoryItemsToEquip, objOtherArray)
	; endIf
	; DebugMessage("buildInventoryItemsArray: count = " + JArray.count(objInventoryItemsToEquip))
	; JValue.cleanPool(JCTempLocalPool)
	float endTime = Utility.GetCurrentRealTime()
	float elapsedTime = endTime - startTime
	DebugMessage("BuildInventoryItemsArray(): count = " + JArray.count(objFilteredItemArray) + "; elapsedTime = " + elapsedTime)
	return objFilteredItemArray
EndFunction

int function GetItemEffectMagnitude(int objInventoryItem, int magicEffectFilter, string customSearchString = "")
	; DebugMessage("GetItemEffectMagnitude(): objInventoryItem = " + objInventoryItem + "; magicEffectFilter = " + magicEffectFilter + "; customSearchString = '" + customSearchString + "'")
	; int jLuaArgs = 0
	; JLua.setObj("objInventoryItem", objInventoryItem, jLuaArgs)	
	; JLua.setInt("magicEffectFilter", magicEffectFilter, jLuaArgs)	
	; JLua.setStr("customMagicEffectFilter", customSearchString, jLuaArgs)	
	; int effectMagnitude = JLua.evalLuaInt("return AH_Hotkeys.GetItemEffectMagnitude(args.objInventoryItem, args.magicEffectFilter, args.customMagicEffectFilter)", jLuaArgs)
	int effectMagnitude = JValue.evalLuaInt(objInventoryItem, "return AH_Hotkeys.GetItemEffectMagnitude(jobject,"+magicEffectFilter+",'"+customSearchString+"')")
	return effectMagnitude
	; int itemType = JMap.getInt(objInventoryItem, "itemType")
	; int actualItemType = JMap.getInt(objInventoryItem, "actualItemType")
	; form itemForm = JMap.getForm(objInventoryItem, "itemForm")
	; string itemName = JMap.getStr(objInventoryItem, "itemName")
	; int objItemMagicEffectNameArray = JMap.getObj(objInventoryItem, "itemMagicEffectNameArray")
	; int objItemMagicEffectMagnitudeArray = JMap.getObj(objInventoryItem, "itemMagicEffectMagnitudeArray")
	; if (objItemMagicEffectNameArray == 0) || (objItemMagicEffectMagnitudeArray == 0)
	; 	return 0
	; endIf
	; int numEffects = JArray.count(objItemMagicEffectMagnitudeArray)
	; int objKnownMagicEffectArray = JValue.addToPool(JArray.object(), JCTempPoolClearOnCloseMCM)
	
	; float effectMagnitude
	; MagicEffect theMagicEffect
	; string magicEffectName
	; string searchString
	; int effectIndex
	; int theFoundIndex
	; bool continueFindingMagnitude

	; if magicEffectFilter == kHealthEffect
	; 	searchString = healthEffectString
	; elseif magicEffectFilter == kMagickaEffect
	; 	searchString = magickaEffectString
	; elseif magicEffectFilter == kStaminaEffect
	; 	searchString = staminaEffectString
	; elseif magicEffectFilter == kCustomEffect
	; 	searchString = customSearchString
	; endIf
	; effectMagnitude = -1

	; ; All items
	; if magicEffectFilter == kAllMagicEffects; if all magic effects, just return the magnitude of the first effect (or greatest effect??)
	; 	effectIndex = 0
	; 	while (effectIndex < numEffects) ; get largest magnitude.
	; 		if itemType == kIngredient
	; 			magicEffectName = JArray.getStr(objItemMagicEffectNameArray, effectIndex)
	; 			if JArray.findStr(objKnownMagicEffectArray, magicEffectName) >= 0
	; 				effectMagnitude = AHUtils.maxFlt(JArray.getFlt(objItemMagicEffectMagnitudeArray, effectIndex), effectMagnitude)
	; 			elseif (itemForm as ingredient).GetIsNthEffectKnown(effectIndex)
	; 				effectMagnitude = AHUtils.maxFlt(JArray.getFlt(objItemMagicEffectMagnitudeArray, effectIndex), effectMagnitude)
	; 				JArray.addStr(objKnownMagicEffectArray, magicEffectName)
	; 			endIf
	; 		else
	; 			effectMagnitude = AHUtils.maxFlt(JArray.getFlt(objItemMagicEffectMagnitudeArray, effectIndex), effectMagnitude)
	; 		endIf
	; 		effectIndex += 1
	; 	EndWhile
	; else ; if there is a magic effect filter
	; 	effectIndex = 0
	; 	theFoundIndex = -1
	; 	; DebugMessage("GetItemEffectMagnitude(): itemName = " + itemName + "; magicEffectFilter = " + magicEffectFilter + "; numEffects = " + numEffects + "; Effects = " + JArray.getStr(objItemMagicEffectNameArray, 0) + "; " + JArray.getStr(objItemMagicEffectNameArray, 1) + "; " + JArray.getStr(objItemMagicEffectNameArray, 2) + "; " + JArray.getStr(objItemMagicEffectNameArray, 3) + "; ")
	; 	while (effectIndex < numEffects) && (theFoundIndex == -1)
	; 		continueFindingMagnitude = true
	; 		magicEffectName = JArray.getStr(objItemMagicEffectNameArray, effectIndex)
	; 		if itemType == kIngredient
	; 			if JArray.findStr(objKnownMagicEffectArray, magicEffectName) == -1
	; 				if !(itemForm as ingredient).GetIsNthEffectKnown(effectIndex)
	; 					continueFindingMagnitude = false
	; 				else
	; 					JArray.addStr(objKnownMagicEffectArray, magicEffectName)
	; 				endIf
	; 			endIf
	; 		endIf
	; 		if continueFindingMagnitude
	; 			if magicEffectFilter == kOtherEffect
	; 				searchString = healthEffectString + "," + magickaEffectString + "," + staminaEffectString
	; 			endIf
	; 			if JValue.evalLuaInt(0, "return AH_Hotkeys.MatchTextFromDelimitedString('"+magicEffectName+"','"+searchString+"', ',') == true")
	; 				theFoundIndex = effectIndex
	; 			endIf					; DebugMessage("")
	; 				; if AHUtils.MatchString(magicEffectName, searchString, false, true)
	; 				; 	theFoundIndex = effectIndex
	; 				; endIf
	; 			; else; if magicEffectFilter is kOtherEffect, then return true
	; 			; 	; if (StringUtil.find(magicEffectName, healthEffectString) == -1) && (StringUtil.find(magicEffectName, magickaEffectString) == -1) && (StringUtil.find(magicEffectName, staminaEffectString) == -1)
	; 			; 		theFoundIndex = effectIndex
	; 			; 	endIf
	; 				; DebugMessage("kOtherEffect: magicEffectName = " + magicEffectName + "; theFoundIndex = " + theFoundIndex)
	; 			; endIf
	; 		endIf
	; 		effectIndex += 1
	; 	EndWhile
	; 	if theFoundIndex >= 0
	; 		effectMagnitude = JArray.getFlt(objItemMagicEffectMagnitudeArray, theFoundIndex)
	; 	else
	; 		effectMagnitude = -1
	; 	endIf
	; endIf
	; return (effectMagnitude as int)
endFunction

function UpdateIngredientMagicEffectKnownStatus(int objInventoryItemArrayToUpdate)
	; int objIngredientArray = JValue.evalLuaObj(objInventoryItemArrayToUpdate, "return jc.filter(jobject, function(x) return x.itemType == "+AHMain.kIngredient+" end)")
	; DebugMessage("UpdateIngredientMagicEffectKnownStatus(): filter for ingredients; count = " + JArray.count(objIngredientArray))
	if !objIngredientItemsUpdatedArray
		objIngredientItemsUpdatedArray = JValue.addToPool(JArray.object(), JCTempPoolClearOnCloseMCM)
		DebugMessage("objIngredientItemsUpdatedArray created.")
	endIf
	int tempJMap = JMap.object()
	JMap.setObj(tempJMap, "inventoryItemArrayToUpdate", objInventoryItemArrayToUpdate)
	JMap.setInt(tempJMap, "itemTypeFilter", AHMain.kIngredient)
	JMap.setObj(tempJMap, "ingredientItemsUpdatedArray", objIngredientItemsUpdatedArray)
	int objIngredientArray = JValue.evalLuaObj(tempJMap, "return AH_Hotkeys.BuildItemListWithUnknownMagicEffectStatus(jobject)")
	DebugMessage("UpdateIngredientMagicEffectKnownStatus(): filter for ingredients with potentially unknown effects; count = " + JArray.count(objIngredientArray) + "; tempJMap = " + tempJMap + "; objInventoryItemArrayToUpdate = " + objInventoryItemArrayToUpdate + "; count = " + JArray.count(objInventoryItemArrayToUpdate) + "; AHMain.kIngredient = " + AHMain.kIngredient + "; objIngredientItemsUpdatedArray = " + objIngredientItemsUpdatedArray + "; count = " + JArray.count(objIngredientItemsUpdatedArray))
	if !JArray.count(objIngredientArray)
		return
	endIf
	int arraySize = JArray.count(objIngredientArray)
	int i = 0
	int objInventoryItem
	int objItemMagicEffectIsKnownArray
	int numEffects
	int isKnown
	int itemMagicEffectIsKnownArraySize
	form itemForm
	while i < arraySize
		objInventoryItem = JArray.getObj(objIngredientArray, i)
		; Don't re-run the GetIsNthEffectKnown function if already checked in this MCM session. Shaves off about 200 milliseconds from the menu generation time.
		if JArray.findObj(objIngredientItemsUpdatedArray, objInventoryItem) == -1
			objItemMagicEffectIsKnownArray = JMap.getObj(objInventoryItem, "itemMagicEffectIsKnownArray")
			if !objItemMagicEffectIsKnownArray
				objItemMagicEffectIsKnownArray = JArray.object()
				JMap.setObj(objInventoryItem, "itemMagicEffectIsKnownArray", objItemMagicEffectIsKnownArray)
			endIf
			itemMagicEffectIsKnownArraySize = JArray.count(objItemMagicEffectIsKnownArray)
			itemForm = JMap.getForm(objInventoryItem, "itemForm")
			numEffects = (itemForm as ingredient).GetNumEffects()
			; DebugMessage("Debug: itemName = " + JMap.getStr(objInventoryItem, "itemDisplayName") + "; numEffects = " + numEffects)
			int n = 0
			if itemMagicEffectIsKnownArraySize < numEffects
				JArray.clear(objItemMagicEffectIsKnownArray)
			endIf
			while n < numEffects
				isKnown = (itemForm as ingredient).GetIsNthEffectKnown(n) as int
				if itemMagicEffectIsKnownArraySize < numEffects
					JArray.addInt(objItemMagicEffectIsKnownArray, isKnown)
					; DebugMessage("    Retrieve from JArray. Added effect no. " + n + " = " + JArray.getInt(objItemMagicEffectIsKnownArray, n))
				else
					JArray.setInt(objItemMagicEffectIsKnownArray, n, isKnown)
					; DebugMessage("    Retrieve from JArray. Set effect no. " + n + " = " + JArray.getInt(objItemMagicEffectIsKnownArray, n))
				endIf
				n += 1
			EndWhile
			; DebugMessage("    String: " + JValue.evalLuaStr(objItemMagicEffectIsKnownArray, "return AH_Hotkeys.ConcatJArrayToString(jobject, ',')"))
			JArray.addObj(objIngredientItemsUpdatedArray, objInventoryItem)
		endIf
		i += 1
	EndWhile
	DebugMessage("UpdateIngredientMagicEffectKnownStatus(): after update, objIngredientItemsUpdatedArray count = " + JArray.count(objIngredientItemsUpdatedArray))
endFunction

;-------------------------------------EQUIPSET PAGE FUNCTIONS-------------------------------------

; Function updated in version 2.1 to display list of all currently equipped items. These items are referred to by their ItemID (hash of formID and name) and when equipped, only the specifically named item (that may have been renamed by the player) will be equipped.
function GetAllEquippedItems(int objEquipSet)
	int equippedItemType
	form itemForm
	int objInventoryItem
	int objLeftHandInventoryItem
	int objRightHandInventoryItem
	int objShoutInventoryItem
	form shoutForm
	int itemType
	string leftHandItemName
	string rightHandItemName
	string shoutItemName
	string menuString
	int theSlotMask
	int i = 0
	int arrayIndex = -1
	int useHandAndShoutSlots = JMap.getInt(objEquipSet, "useHandAndShoutSlots")
	int itemID
	string itemDisplayName
	int arraySize
	int menuIndex

	DebugMessage("GetAllEquippedItems()")

	int objFormArray = JMap.getObj(objEquipSet, "formArray")
	int objCurrentlyWornItemsArray = JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "currentlyWornItemsArray")
	AHMain.UpdateEquippedAndWornItems(leftHand = true, rightHand = true, apparel = true, clearApparelArray = true, objEquipSetItemsArray = 0, apparelItemSlotMask = 0)

	string[] equippedItemMenuList = new string[128]
	equippedItemMenuList[0] = "(Cancel)"
	int cancelMenuItem = 0
	int itemListStartIndex = 1

	equippedItemMenuList[1] = "(Add All Equipped Apparel Items)"
	int addAllEquippedItemsMenuItem = 1
	itemListStartIndex += 1

	; Get left hand item
	objLeftHandInventoryItem = JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "leftHandItemObject")
	if objLeftHandInventoryItem
		leftHandItemName = JMap.getStr(objLeftHandInventoryItem, "itemDisplayName")
		menuString = "Left Hand: " + leftHandItemName
	else
		menuString = "Left Hand: [Empty]"
	endIf
	itemListStartIndex += 1
	equippedItemMenuList[2] = menuString
	int leftHandMenuItem = 2
	; Get right hand item
	objRightHandInventoryItem = JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "rightHandItemObject")
	if objRightHandInventoryItem
		rightHandItemName = JMap.getStr(objRightHandInventoryItem, "itemDisplayName")
		menuString = "Right Hand: " + rightHandItemName
	else
		menuString = "Right Hand: [Empty]"
	endIf
	itemListStartIndex += 1
	equippedItemMenuList[3] = menuString
	int rightHandMenuItem = 3
	; Get shout or power in array item 2
	shoutForm = AHMain.GetEquippedShoutOrPower()
	; objShoutInventoryItem = JFormMap.getObj(AHMain.objItemFormCache, shoutForm)
	objShoutInventoryItem = AHMain.AddItemToCache(shoutForm, 0)
	if objShoutInventoryItem
		shoutItemName = JMap.getStr(objShoutInventoryItem, "itemName")
		menuString = "Shout/Power: " + shoutItemName
	else
		menuString = "Shout/Power: [Empty]"
	endIf
	itemListStartIndex += 1
	equippedItemMenuList[4] = menuString
	int shoutMenuItem = 4

	arraySize = JArray.count(objCurrentlyWornItemsArray)
	DebugMessage("GetAllEquippedItems(): objCurrentlyWornItemsArray size = " + arraySize + "; leftHand = " + leftHandItemName + "; rightHand = " + rightHandItemName + "; shout = " + shoutItemName)

	; Get worn items
	i = 0
	while i < JArray.count(objCurrentlyWornItemsArray)
		objInventoryItem = JArray.getObj(objCurrentlyWornItemsArray, i)
		itemType = JMap.getInt(objInventoryItem, "itemType")
		menuString = JMap.getStr(objInventoryItem, "itemDisplayName")
		equippedItemMenuList[i + itemListStartIndex] = menuString
		DebugMessage("Add to menu list: " + menuString)
		i += 1
	EndWhile

	menuIndex = AHUtils.ShowUILibListMenu("Add Equipped Items", equippedItemMenuList, 0, 0)
	DebugMessage("Menu index = " + menuIndex)
	if menuIndex == cancelMenuItem
		return
	elseif menuIndex == leftHandMenuItem
		AHMain.SetEquipSetHandInventoryItem(objEquipSet, objLeftHandInventoryItem, kLeftHand)
	elseif menuIndex == rightHandMenuItem
		AHMain.SetEquipSetHandInventoryItem(objEquipSet, objRightHandInventoryItem, kRightHand)
	elseif menuIndex == shoutMenuItem
		AHMain.SetEquipSetShoutItem(objEquipSet, shoutForm)
	else ; apparel
		if menuIndex == addAllEquippedItemsMenuItem
			i = 0
			arraySize = JArray.count(objCurrentlyWornItemsArray)
		else
			i = menuIndex - itemListStartIndex
			arraySize = i + 1
		endIf
		while i < arraySize
			objInventoryItem = JArray.getObj(objCurrentlyWornItemsArray, i)
			itemDisplayName = JMap.getStr(objInventoryItem, "itemDisplayName")
			itemID = JMap.getInt(objInventoryItem, "itemID")
			AHMain.AddEquipSetWornItem(objEquipSet, objInventoryItem)
			DebugMessage("	Added worn item: " + itemDisplayName + "; itemID = " + itemID)
			i += 1
		EndWhile
	endIf
endfunction

function EquipSetNewAutoAddItem()
	DebugMessage("EquipSetNewAutoAddItem()")
	int objMenuItem = GetAutoAddItemTypeFromList(GetAutoAddItemTypeFromList_kAllItems, "Select type of auto add item:", includeCancel = true,  includeBack = false)
	string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
	if menuItemString == AHMain.kCancelMenuItemString
		return
	endIf
	int autoAddItemType = JMap.getInt(objMenuItem, "autoAddItemType")
	string itemTypeText = AHMain.GetItemTypeText(autoAddItemType)
	DebugMessage("EquipSetNewAutoAddItem(): GetAutoAddItemTypeFromList menuItemString = " + menuItemString + "; autoAddItemType = " + autoAddItemType + " (" + itemTypeText + ")", AHMain.debugLevels_kNotice)
	string newText = AHUtils.ShowUILibTextInput(itemTypeText + " magic effects (excl='!',delimiter=',')", "")
	DebugMessage("EquipSetNewAutoAddItem(): new auto add item = " + newText, debugLevels_kDebug)
	bool successful = AHMgr.AddNewAutoAddItemToEquipSet(objCurrentEquipSet, 0, autoAddItemType, newText)
	int objAutoAddItemArray = JMap.getObj(objCurrentEquipSet, "autoAddItemArray")
	; AHMain.PrintJObject(objAutoAddItemArray, "EquipSetNewAutoAddItem(): objAutoAddItemArray", AHMain.debugLevels_kDebug)
	if !successful
		Debug.MessageBox("Auto Add Item could not be added. Check AH Hotkeys log.")
		return
	endIf
	; int curNumItems = AHMain.CountItemsInEquipSet(objCurrentEquipSet)
	; int numItemsToBeAdded = JLua.evalLuaInt("return AH_Hotkeys.CheckAndAutoAddAllItemsToEquipSet(args.objEquipSet, args.objInventoryArray, args.simulate)", JLua.setObj("objEquipSet", objCurrentEquipSet, JLua.setObj("objInventoryArray", AHMain.objInventoryItemArray, JLua.setInt("simulate", 1))))
	; DebugMessage("EquipSetNewAutoAddItem(): numItemsToBeAdded = " + numItemsToBeAdded, AHMain.debugLevels_kNotice)
	; if AHUtils.ShowMessageWithWithOptionsMenu("Add " + numItemsToBeAdded + " items?", "This action will auto add " + numItemsToBeAdded + " items to this EquipSet.")
		bool itemAdded = JLua.evalLuaInt("return AH_Hotkeys.CheckAndAutoAddAllItemsToEquipSet(args.objEquipSet, args.objInventoryArray)", JLua.setObj("objEquipSet", objCurrentEquipSet, JLua.setObj("objInventoryArray", AHMain.objInventoryItemArray)))
		JLua.evalLuaInt("return AH_Hotkeys.AddIfNotInArray(args.objItemArray, args.item)", JLua.setObj("objItemArray", objAutoAddEquipSetsUpdatedArray, JLua.setObj("item", objCurrentEquipSet)))
		; DebugMessage("EquipSetNewAutoAddItem(): " + numItemsToBeAdded + " items added to EquipSet. Items added = " + itemAdded, AHMain.debugLevels_kNotice)
	; endIf
endFunction

Function EquipSetRemoveAllItems()
	DebugMessage("EquipSetRemoveAllItems()")
	int useHandAndShoutSlots = JMap.getInt(objCurrentEquipSet, "useHandAndShoutSlots")
	if useHandAndShoutSlots
		AHMain.SetEquipSetHandInventoryItem(objCurrentEquipSet, 0, kLeftHand)
		AHMain.SetEquipSetHandInventoryItem(objCurrentEquipSet, 0, kRightHand)
		AHMain.SetEquipSetShoutItem(objCurrentEquipSet, none)
	endIf
	int objFormArray = JMap.getObj(objCurrentEquipSet, "formArray")
	JArray.clear(objFormArray)
EndFunction

Function EquipSetRemoveAllAutoAddItems()
	DebugMessage("EquipSetRemoveAllAutoAddItems()")
	int objAutoAddItemArray = JMap.getObj(objCurrentEquipSet, "autoAddItemArray")
	JArray.clear(objAutoAddItemArray)
EndFunction

function EquipSetRemoveInvalidItems()
	DebugMessage("EquipSetRemoveInvalidItems()")
	form itemForm
	int objInventoryItem
	int dataType
	int objectType
	int objItem
	int objFormArray = JMap.getObj(objCurrentEquipSet, "formArray")
	int arraySize = JArray.count(objFormArray)
	int i = arraySize - 1
	while i >= 0
		dataType = JArray.valueType(objFormArray, i)
		if dataType == AHMain.kFormDataType
			itemForm = JArray.getForm(objFormArray, i)
			if !itemForm
				JArray.eraseIndex(objFormArray, i)
			endIf
		elseif dataType == AHMain.kJObjectDataType
			objItem = JArray.getObj(objFormArray, i)
			objectType = JMap.getInt(objItem, "objectType")
			if objectType == AHMain.kInventoryItemObject
				objInventoryItem = objItem
				itemForm = JMap.getForm(objInventoryItem, "itemForm")
				string itemName = JMap.getStr(objInventoryItem, "itemDisplayName")
				DebugMessage("EquipSetRemoveInvalidItems(); "+itemName+"; itemForm = "+itemForm+"; invalid="+!itemForm)
				if !itemForm
					JArray.eraseIndex(objFormArray, i)
				endIf
			endIf
		endIf
		; DebugMessage("EquipSetRemoveInvalidItems(): checking validity of item " + i, debugLevels_kDebug)
		; dataType = JArray.valueType(objFormArray, i)
		; if dataType == AHMain.kFormDataType
		; 	DebugMessage("EquipSetRemoveInvalidItems(): getForm.", debugLevels_kDebug)
		; 	itemForm = JArray.getForm(objFormArray, i)
		; 	DebugMessage("EquipSetRemoveInvalidItems(): getForm = " + itemForm + "; do IsValidInventoryForm().", debugLevels_kDebug)
		; 	if !IsValidInventoryForm(itemForm)
		; 		DebugMessage("EquipSetRemoveInvalidItems(): erase index " + i, debugLevels_kDebug)
		; 		JArray.eraseIndex(objFormArray, i)
		; 	endIf
		; elseif dataType == AHMain.kInventoryItemObject
		; 	DebugMessage("EquipSetRemoveInvalidItems(): getObj.", debugLevels_kDebug)
		; 	objInventoryItem = JArray.getObj(objFormArray, i)
		; 	DebugMessage("EquipSetRemoveInvalidItems(): getForm.", debugLevels_kDebug)
		; 	itemForm = JMap.getForm(objInventoryItem, "itemForm")
		; 	DebugMessage("EquipSetRemoveInvalidItems(): getForm = " + itemForm + "; do IsValidInventoryForm().", debugLevels_kDebug)
		; 	if !IsValidInventoryForm(itemForm)
		; 		DebugMessage("EquipSetRemoveInvalidItems(): erase index " + i, debugLevels_kDebug)
		; 		JArray.eraseIndex(objFormArray, i)
		; 	endIf
		; endIf
		i -= 1
	EndWhile
endFunction

function EquipSetOptionsMenu()
endFunction
state EquipSetOptionsMenu
	event OnMenuOpenST()
		DebugMessage("EquipSetOptionsMenu()")
		SetMenuDialogStartIndex(kOptionsMenuItem_Cancel)
		SetMenuDialogDefaultIndex(kOptionsMenuItem_Cancel)
		SetMenuDialogOptions(optionsMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("EquipSetOptionsMenu(): menuIndex = " + menuIndex)
		if menuIndex == kOptionsMenuItem_Cancel
			return;
		elseif menuIndex == kOptionsMenuItem_GoBackToPreviousEquipset
			ShowEquipSet(objPreviousEquipSet)
		elseif menuIndex == kOptionsMenuItem_RemoveAllItems
			EquipSetRemoveAllItems()
			JLua.evalLuaInt("return AH_Hotkeys.CheckAndAutoAddAllItemsToEquipSet(args.objEquipSet, args.objInventoryArray)", JLua.setObj("objEquipSet", objCurrentEquipSet, JLua.setObj("objInventoryArray", AHMain.objInventoryItemArray)))
			JLua.evalLuaInt("return AH_Hotkeys.AddIfNotInArray(args.objItemArray, args.item)", JLua.setObj("objItemArray", objAutoAddEquipSetsUpdatedArray, JLua.setObj("item", objCurrentEquipSet)))
		elseif menuIndex == kOptionsMenuItem_RemoveAllAutoAddItems
			EquipSetRemoveAllAutoAddItems()
		elseif menuIndex == kOptionsMenuItem_NewAutoAddItem
			EquipSetNewAutoAddItem()
		elseif menuIndex == kOptionsMenuItem_RemoveInvalidItems
			EquipSetRemoveInvalidItems()
		elseif menuIndex == kOptionsMenuItem_GetAllEquippedItems
			GetAllEquippedItems(objCurrentEquipSet)
		elseif menuIndex == kOptionsMenuItem_ConvertAllItemsToGeneric
			AHMain.ConvertEquipSetItemsToGeneric(objCurrentEquipSet)
		elseif menuIndex == kOptionsMenuItem_ConvertAllItemsToSpecific
			AHMain.ConvertEquipSetItemsToSpecific(objCurrentEquipSet)
		endIf
		ForcePageReset()
	endEvent

	event OnDefaultST()
		;
	endEvent

	event OnHighlightST()
		SetInfoText("Options Menu...")
	endEvent
endState

function ShowAutoAddItemsToggle_OnSelect(int optionID)
	bool value = JMap.getInt(objCurrentEquipSet, "showAutoAddItems") as bool
	value = !value
	JMap.setInt(objCurrentEquipSet, "showAutoAddItems", value as int)
	SetToggleOptionValue(optionID, value)
	DebugMessage("ShowAutoAddItemsToggle_OnSelect() = " + value)
	ForcePageReset()
endFunction
string function ShowAutoAddItemsToggle_OnHighlight()
	return "Show Auto Add Items."
endFunction
function ShowAutoAddItemsToggle_OnDefault(int optionID)
	bool value = JMap.getInt(objCurrentEquipSet, "showAutoAddItems") as bool
	SetToggleOptionValue(optionID, value)
endFunction

function NewAutoAddItemButton_OnSelect(int optionID)
	DebugMessage("NewAutoAddItemButton()")
	EquipSetNewAutoAddItem()
	ForcePageReset()
endFunction
string function NewAutoAddItemButton_OnHighlight()
	return "Add new Auto Add item with effects separated by commas. Prefix with '!' for reverse match. Prefix with 'name=' to match an item name rather than a magic effect. Surround all with single quotes for exact match. Auto Add items can be setup for Potions, Poisons, Food and Ammo (arrows or bolts). e.g. \"'Restore Health',!invis,name=health\" to match potions with 'Restore Health' effect, but not invisibility, and name containing 'health'."
endFunction

; function NewAutoAddItemButton()
; endFunction
; state NewAutoAddItemButton
; 	event OnSelectST()
; 		DebugMessage("NewAutoAddItemButton()")
; 		EquipSetNewAutoAddItem()
; 	endEvent

; 	event OnDefaultST()
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("Add new Auto Add item with effects separated by commas. Prefix with '!' for reverse match. Prefix with 'name=' to match an item name rather than a magic effect. Auto Add items can be setup for Potions, Poisons, Food and Ammo (arrows or bolts).")
; 	endEvent
; endState

function AltToggle()
endFunction
state AltToggle ; TOGGLE
	event OnSelectST()
		int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
		bool isAltKey = !JMap.getInt(objCurrentEquipSet, "altKey")
		bool isControlKey = JMap.getInt(objCurrentEquipSet, "controlKey") as bool
		bool isShiftKey = JMap.getInt(objCurrentEquipSet, "shiftKey") as bool
		bool isModifierKey4 = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if theKeyCode > -1
			if !CheckConflictingKeyCombo(theKeyCodeCombo)
				return
			endIf
		endIf
		JMap.setInt(objCurrentEquipSet, "altKey", isAltKey as int)
		JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
		SetToggleOptionValueST(isAltKey)
		DebugMessage("AltToggle() = " + isAltKey)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "altKey") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Toggle Alt key modifier for hotkey.")
	endEvent
endState

function ControlToggle()
endFunction
state ControlToggle ; TOGGLE
	event OnSelectST()
		int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
		bool isAltKey = JMap.getInt(objCurrentEquipSet, "altKey") as bool
		bool isControlKey = !JMap.getInt(objCurrentEquipSet, "controlKey")
		bool isShiftKey = JMap.getInt(objCurrentEquipSet, "shiftKey") as bool
		bool isModifierKey4 = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if theKeyCode > -1
			if !CheckConflictingKeyCombo(theKeyCodeCombo)
				return
			endIf
		endIf
		JMap.setInt(objCurrentEquipSet, "controlKey", isControlKey as int)
		JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
		SetToggleOptionValueST(isControlKey)
		DebugMessage("ControlToggle() = " + isControlKey)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "controlKey") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Toggle Control key modifier for hotkey.")
	endEvent
endState

function ShiftToggle()
endFunction
state ShiftToggle ; TOGGLE
	event OnSelectST()
		int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
		bool isAltKey = JMap.getInt(objCurrentEquipSet, "altKey")
		bool isControlKey = JMap.getInt(objCurrentEquipSet, "controlKey")
		bool isShiftKey = !JMap.getInt(objCurrentEquipSet, "shiftKey")
		bool isModifierKey4 = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if theKeyCode > -1
			if !CheckConflictingKeyCombo(theKeyCodeCombo)
				return
			endIf
		endIf
		JMap.setInt(objCurrentEquipSet, "shiftKey", isShiftKey as int)
		JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
		SetToggleOptionValueST(isShiftKey)
		DebugMessage("ShiftToggle() = " + isShiftKey)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "shiftKey") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Toggle Shift key modifier for hotkey.")
	endEvent
endState

function ModifierKey4Toggle()
endFunction
state ModifierKey4Toggle ; TOGGLE
	event OnSelectST()
		int theKeyCode = JMap.getInt(objCurrentEquipSet, "hotKey")
		bool isAltKey = JMap.getInt(objCurrentEquipSet, "altKey")
		bool isControlKey = JMap.getInt(objCurrentEquipSet, "controlKey")
		bool isShiftKey = JMap.getInt(objCurrentEquipSet, "shiftKey")
		bool isModifierKey4 = !JMap.getInt(objCurrentEquipSet, "modifierKey4")
		int theKeyCodeCombo = AHMain.GenerateHotkeyCombo(theKeyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if theKeyCode > -1
			if !CheckConflictingKeyCombo(theKeyCodeCombo)
				return
			endIf
		endIf
		JMap.setInt(objCurrentEquipSet, "modifierKey4", isModifierKey4 as int)
		JMap.setInt(objCurrentEquipSet, "hotKeyCombo", theKeyCodeCombo)
		SetToggleOptionValueST(isModifierKey4)
		DebugMessage("ModifierKey4Toggle() = " + isModifierKey4)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "modifierKey4") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Toggle 4th modifier key.")
	endEvent
endState

function UnequipLeftHandToggle()
endFunction
state UnequipLeftHandToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipLeftHand") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "unequipLeftHand", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("UnequipLeftHandToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipLeftHand") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, unequips the left hand item when switching to this EquipSet.")
	endEvent
endState

function UnequipRightHandToggle()
endFunction
state UnequipRightHandToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipRightHand") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "unequipRightHand", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("UnequipRightHandToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipRightHand") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, unequips the right hand item when switching to this EquipSet.")
	endEvent
endState

function UnequipAllItemsToggle()
endFunction
state UnequipAllItemsToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipAllItems") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "unequipAllItems", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("UnequipAllItemsToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "unequipAllItems") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, unequips all apparel items when switching to this EquipSet.")
	endEvent
endState

function ReEquipItemsToggle()
endFunction
state ReEquipItemsToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "reEquipItems") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "reEquipItems", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("ReEquipItemsToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "reEquipItems") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, re-equips items when switching EquipSets (rather than doing nothing if same item is already equipped). Also allows an item to be un-equipped when toggle items is checked but there is no item to be equipped in its place.")
	endEvent
endState

function SheatheHandsOnUnequipToggle()
endFunction
state SheatheHandsOnUnequipToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "sheatheHandsOnUnequip") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "sheatheHandsOnUnequip", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("SheatheHandsOnUnequipToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "sheatheHandsOnUnequip") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, sheathes and redraws weapons and spells when unequipping. This can be checked to fix bugs that may occur when equipping without sheathing first (e.g. crossbow bolts may be stuck to the player's hands when equipping another weapon or spell).")
	endEvent
endState

function OverrideUnequipItemExclusionToggle()
endFunction
state OverrideUnequipItemExclusionToggle
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "overrideUnequipItemExclusion") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "overrideUnequipItemExclusion", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("OverrideUnequipItemExclusionToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "overrideUnequipItemExclusion") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, the Unequip Left Hand, Unequip Right Hand and Unequip All Other Items options will unequip items that are included in the Unequip Item Exclusion list. Otherwise, these items will not be unequipped.")
	endEvent
endState


function NotifyWhenSetEquippedToggle()
endFunction
state NotifyWhenSetEquippedToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "notifyWhenSetEquipped") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "notifyWhenSetEquipped", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("NotifyWhenSetEquippedToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "notifyWhenSetEquipped") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, prints name of EquipSet when equipped.")
	endEvent
endState

function NotifyWhenItemEquippedToggle()
endFunction
state NotifyWhenItemEquippedToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "notifyWhenItemEquipped") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "notifyWhenItemEquipped", toggleVal as int)
		JMap.setInt(objCurrentEquipSet, "notifyItemsRemaining", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("NotifyWhenItemEquippedToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "notifyWhenItemEquipped") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, prints name of each item that is equipped.")
	endEvent
endState

function PropogateEquipMode()
endFunction
state PropogateEquipMode ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "propogateEquipMode") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "propogateEquipMode", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("PropogateEquipMode() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "propogateEquipMode") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, carries forward the equip mode to (and overrides) other equipsets that are added to this one and combines all apparel items together to determine equipping behaviour. Check this to ensure that all equipsets linked to this equipset are considered one equipset (except for hand items and autocasting - these are still actioned separately).")
	endEvent
endState

function CycleEquipModeMenu()
endFunction
state CycleEquipModeMenu
	event OnMenuOpenST()
		DebugMessage("CycleEquipModeMenu()")
		int cycleEquipMode = JMap.getInt(objCurrentEquipSet, "cycleEquipMode")
		SetMenuDialogStartIndex(cycleEquipMode)
		SetMenuDialogDefaultIndex(cycleEquipMode)
		SetMenuDialogOptions(cycleEquipModeMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("CycleEquipModeMenu(): menuIndex = " + menuIndex)
		if menuIndex == kCycleEquipMode_NoReset
			JMap.setInt(objCurrentEquipSet, "cycleEquipMode", kCycleEquipMode_NoReset)
		elseif menuIndex == kCycleEquipMode_ResetToPrevItemIfDifferent
			JMap.setInt(objCurrentEquipSet, "cycleEquipMode", kCycleEquipMode_ResetToPrevItemIfDifferent)
		elseif menuIndex == kCycleEquipMode_ResetToFirstItemIfDifferent
			JMap.setInt(objCurrentEquipSet, "cycleEquipMode", kCycleEquipMode_ResetToFirstItemIfDifferent)
		elseif menuIndex == kCycleEquipMode_ResetToFirstItemOnTimeOut
			JMap.setInt(objCurrentEquipSet, "cycleEquipMode", kCycleEquipMode_ResetToFirstItemOnTimeOut)
		endIf
		ForcePageReset()
	endEvent

	event OnDefaultST()
		;
	endEvent

	event OnHighlightST()
		SetInfoText("Cycle EquipMode Options Menu...")
	endEvent
endState

function CycleResetTimeoutSlider()
endFunction
state CycleResetTimeoutSlider
	event OnSliderOpenST()
		DebugMessage("CycleResetTimeoutSlider()")
		if !JMap.hasKey(objCurrentEquipSet, "cycleEquipModeResetTimeout")
			JMap.setFlt(objCurrentEquipSet, "cycleEquipModeResetTimeout", kCycleEquipMode_defaultTimeout)
		endIf
		float cycleEquipModeTimeout = JMap.getFlt(objCurrentEquipSet, "cycleEquipModeResetTimeout")
		SetSliderDialogStartValue(cycleEquipModeTimeout)
		SetSliderDialogRange(0, 300)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		JMap.setFlt(objCurrentEquipSet, "cycleEquipModeResetTimeout", (a_value))
		SetSliderOptionValueST(a_value)
		DebugMessage("CycleResetTimeoutSlider(): cycleEquipModeResetTimeout = " + a_value + " seconds.")
	endEvent

	event OnHighlightST()
		SetInfoText("Timeout (in seconds) that cycling equipsets will reset to the first item.")
	endEvent

	event OnDefaultST()
		JMap.setFlt(objCurrentEquipSet, "cycleEquipModeResetTimeout", kCycleEquipMode_defaultTimeout)
		SetSliderOptionValueST(kCycleEquipMode_defaultTimeout)
	endEvent
endState

function ThrowMagnitudePercentSlider()
endFunction
state ThrowMagnitudePercentSlider
	event OnSliderOpenST()
		DebugMessage("ThrowMagnitudePercentSlider()")
		if !JMap.hasKey(objCurrentEquipSet, "throwMagnitudePercent")
			JMap.setFlt(objCurrentEquipSet, "throwMagnitudePercent", kDropAllEquipMode_defaultThrowMagnitudePercent)
		endIf
		float throwMagnitudePercent = JMap.getFlt(objCurrentEquipSet, "throwMagnitudePercent")
		int throwMagnitudePercentValue = (throwMagnitudePercent * 100) as int
		SetSliderDialogStartValue(throwMagnitudePercentValue)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		JMap.setFlt(objCurrentEquipSet, "throwMagnitudePercent", (a_value / 100))
		SetSliderOptionValueST(a_value)
		DebugMessage("ThrowMagnitudePercentSlider(): throwMagnitudePercent = " + a_value + "%.")
	endEvent

	event OnHighlightST()
		SetInfoText("How much force is applied (as a %) to an item by the player when the item is dropped. The minimum is 1% and maximum is 100%.")
	endEvent

	event OnDefaultST()
		JMap.setFlt(objCurrentEquipSet, "throwMagnitudePercent", kDropAllEquipMode_defaultThrowMagnitudePercent)
		SetSliderOptionValueST(kDropAllEquipMode_defaultThrowMagnitudePercent * 100)
	endEvent
endState

function FilterByMagicEffectMenu()
endFunction
state FilterByMagicEffectMenu
	event OnMenuOpenST()
		DebugMessage("FilterByMagicEffectMenu()")
		int currentFilterByMagicEffect = JMap.getInt(objCurrentEquipSet, "filterByMagicEffect")
		if currentFilterByMagicEffect == -1
			SetMenuDialogStartIndex(0)
			SetMenuDialogDefaultIndex(0)
		else
			SetMenuDialogStartIndex(currentFilterByMagicEffect)
			SetMenuDialogDefaultIndex(currentFilterByMagicEffect)
		endIf
		SetMenuDialogOptions(filterByMagicEffectMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("FilterByMagicEffectMenu(): menuIndex = " + menuIndex)
		int currentFilterByMagicEffect = menuIndex
		JMap.setInt(objCurrentEquipSet, "filterByMagicEffect", currentFilterByMagicEffect)
		string currentMagicEffectFilterText = JMap.getStr(objCurrentEquipSet, "filterByMagicEffectText")
		if currentFilterByMagicEffect != kCustomEffect
			if currentFilterByMagicEffect == kHealthEffect
				currentMagicEffectFilterText = healthEffectString
				JMap.setStr(objCurrentEquipSet, "filterByMagicEffectText", currentMagicEffectFilterText)
			elseif currentFilterByMagicEffect == kMagickaEffect
				currentMagicEffectFilterText = magickaEffectString
				JMap.setStr(objCurrentEquipSet, "filterByMagicEffectText", currentMagicEffectFilterText)
			elseif currentFilterByMagicEffect == kStaminaEffect
				currentMagicEffectFilterText = staminaEffectString
				JMap.setStr(objCurrentEquipSet, "filterByMagicEffectText", currentMagicEffectFilterText)
			elseif currentFilterByMagicEffect == kHungerEffect
				currentMagicEffectFilterText = hungerEffectString
				JMap.setStr(objCurrentEquipSet, "filterByMagicEffectText", currentMagicEffectFilterText)
			elseif (currentFilterByMagicEffect == kAllMagicEffects) || (currentFilterByMagicEffect == kOtherEffect)
				currentMagicEffectFilterText = ""
				JMap.setStr(objCurrentEquipSet, "filterByMagicEffectText", currentMagicEffectFilterText)
			endIf
			SetMenuOptionValueST(filterByMagicEffectMenuList[currentFilterByMagicEffect])
		else
			string theText = AHUtils.ShowUILibTextInput("Magic Effect Filter", currentMagicEffectFilterText)
			if theText
				JMap.setStr(objCurrentEquipSet, "filterByMagicEffectText", theText)
				SetMenuOptionValueST(theText, false, "FilterByMagicEffectMenu")
			endIf
		endIf
		SortByEffectMagnitude(objCurrentEquipSet)
		ForcePageReset()
	endEvent

	event OnDefaultST()
		int currentFilterByMagicEffect = JMap.getInt(objCurrentEquipSet, "filterByMagicEffect")
		string currentMagicEffectFilterText = JMap.getStr(objCurrentEquipSet, "filterByMagicEffectText")
		if currentFilterByMagicEffect != kCustomEffect
			SetMenuOptionValueST(filterByMagicEffectMenuList[currentFilterByMagicEffect])
		else
			string theText = AHUtils.ShowUILibTextInput("Magic Effect Filter", currentMagicEffectFilterText)
			if theText
				JMap.setStr(objCurrentEquipSet, "filterByMagicEffectText", currentMagicEffectFilterText)
				SetMenuOptionValueST(theText, false, "FilterByMagicEffectMenu")
			endIf
		endIf
	endEvent

	event OnHighlightST()
		SetInfoText("Show only consumables with these effects in the menu list. Note: prefixing a custom text filter with \"!\" will reverse the filter.")
	endEvent
endState

function FilterByItemNameButton()
endFunction
state FilterByItemNameButton
	event OnSelectST()
		string currentNameFilterText = JMap.getStr(objCurrentEquipSet, "filterByNameText")
		currentNameFilterText = AHUtils.ShowUILibTextInput("Filter by Item Name", currentNameFilterText)
		JMap.setStr(objCurrentEquipSet, "filterByNameText", currentNameFilterText)
		; DebugMessage("FilterByItemNameButton(currentNameFilterText) = " + currentNameFilterText)
		SetTextOptionValueST(GetFilterByItemNameButtonText())
		DebugMessage("FilterByItemNameButton(JMap.getStr()) = " + JMap.getStr(objCurrentEquipSet, "filterByNameText"))
	endEvent

	event OnDefaultST()
		SetTextOptionValueST(GetFilterByItemNameButtonText())
	endEvent

	event OnHighlightST()
		SetInfoText("Show only items with names containing this text in the menu list. Note: prefixing a custom text filter with \"!\" will reverse the filter. Separate search parameters using a comma. e.g. potion,food,!health,!magicka will only show items with the words 'potion' or 'food' but not 'health' or 'magicka'.")
	endEvent
endState

string Function GetFilterByItemNameButtonText()
	string currentNameFilterText = JMap.getStr(objCurrentEquipSet, "filterByNameText")
	string nameFilterButtonText
	string[] itemNameFilterArray = StringUtil.split(currentNameFilterText, ",")
	int arraySize = itemNameFilterArray.Length
	if arraySize > 1
		nameFilterButtonText = "[Multiple]"
	else
		nameFilterButtonText = currentNameFilterText
	endIf
	return nameFilterButtonText
EndFunction

int Function GetItemTypeFilterMaskFromID(int itemTypeFilterID)
	int itemTypeFilterBits
	if itemTypeFilterID == kFilterByAllTypes
		itemTypeFilterBits = AHMain.kWeaponType + AHMain.kShieldType + AHMain.kScrollType + AHMain.kSpellType + AHMain.kShoutType + AHMain.kArmorType + AHMain.kAmmoType + AHMain.kPotionType + AHMain.kFoodType + AHMain.kIngredientType + AHMain.kPoisonType + AHMain.kOtherType
	elseif itemTypeFilterID == kFilterByWeapons
		itemTypeFilterBits = Math.LogicalOr(AHMain.kWeaponType, AHMain.kShieldType)
	elseif itemTypeFilterID == kFilterByScrolls
		itemTypeFilterBits = AHMain.kScrollType
	elseif itemTypeFilterID == kFilterBySpells
		itemTypeFilterBits = AHMain.kSpellType
	elseif itemTypeFilterID == kFilterByArmor
		itemTypeFilterBits = AHMain.kArmorType
	elseif itemTypeFilterID == kFilterByPotions
		itemTypeFilterBits = AHMain.kPotionType
	elseif itemTypeFilterID == kFilterByFood
		itemTypeFilterBits = AHMain.kFoodType
	elseif itemTypeFilterID == kFilterByIngredients
		itemTypeFilterBits = AHMain.kIngredientType
	elseif itemTypeFilterID == kFilterByPoisons
		itemTypeFilterBits = AHMain.kPoisonType
	elseif itemTypeFilterID == kFilterByAmmo
		itemTypeFilterBits = AHMain.kAmmoType
	elseif itemTypeFilterID == kFilterByOther
		itemTypeFilterBits = AHMain.kOtherType
	elseif itemTypeFilterID == kFilterByEquipSets
		itemTypeFilterBits = AHMain.kEquipSetType
	endIf
	return itemTypeFilterBits
EndFunction

function FilterByItemTypeMenu()
endFunction
state FilterByItemTypeMenu
	event OnMenuOpenST()
		DebugMessage("FilterByItemTypeMenu()")
		int currentFilterByItemType = JMap.getInt(objCurrentEquipSet, "filterByItemType")
		SetMenuDialogStartIndex(currentFilterByItemType)
		SetMenuDialogDefaultIndex(currentFilterByItemType)
		SetMenuDialogOptions(filterByItemTypeMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("FilterByItemTypeMenu(): menuIndex = " + menuIndex)
		int currentFilterByItemType = menuIndex
		JMap.setInt(objCurrentEquipSet, "filterByItemType", currentFilterByItemType)
		SetMenuOptionValueST(filterByItemTypeMenuList[currentFilterByItemType])
		ForcePageReset()
	endEvent

	event OnDefaultST()
		int currentFilterByItemType = JMap.getInt(objCurrentEquipSet, "filterByItemType")
		SetMenuOptionValueST(filterByItemTypeMenuList[currentFilterByItemType])
	endEvent

	event OnHighlightST()
		SetInfoText("Show only items of these types in the inventory menu list. Filter by: Weapons, Armour, Spells, Scrolls, Potions, Food, Ingredients, Poisons, Other Items and EquipSets. Adding EquipSets allows you to chain together multiple EquipSets. Then click on 'Add Item' in the item list below.")
	endEvent
endState

function SortMenu()
endFunction
state SortMenu
	event OnMenuOpenST()
		DebugMessage("SortMenu()")
		int currentSort = JMap.getInt(objCurrentEquipSet, "itemSortOrder")
		SetMenuDialogStartIndex(currentSort)
		SetMenuDialogDefaultIndex(currentSort)
		SetMenuDialogOptions(sortMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("SortMenu(): menuIndex = " + menuIndex)
		int currentSort = menuIndex
		JMap.setInt(objCurrentEquipSet, "itemSortOrder", currentSort)
		SetMenuOptionValueST(sortMenuList[currentSort])
		if (menuIndex == kSortMenuItem_HighestToLowestMagicEffect) || (menuIndex == kSortMenuItem_LowestToHighestMagicEffect)
			SortByEffectMagnitude(objCurrentEquipSet)
		endIf
		ForcePageReset()
	endEvent

	event OnDefaultST()
		int currentSort = JMap.getInt(objCurrentEquipSet, "itemSortOrder")
		SetMenuOptionValueST(sortMenuList[currentSort])
	endEvent

	event OnHighlightST()
		SetInfoText("Sort inventory item list.")
	endEvent
endState

function EquipModeMenu()
endFunction
state EquipModeMenu
	event OnMenuOpenST()
		DebugMessage("EquipModeMenu()")
		int currentEquipMode = JMap.getInt(objCurrentEquipSet, "equipMode")
		SetMenuDialogStartIndex(currentEquipMode)
		SetMenuDialogDefaultIndex(currentEquipMode)
		SetMenuDialogOptions(equipModeMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("EquipModeMenu(): menuIndex = " + menuIndex)
		int currentEquipMode = menuIndex
		JMap.setInt(objCurrentEquipSet, "equipMode", currentEquipMode)
		if currentEquipMode != kEquipMode_OneAtATime ; reset last used equipped item stats if change equipMode to other than One-At-A-Time
			JMap.setInt(objCurrentEquipSet, "lastItemTypeEquipped", 0)
			JMap.setForm(objCurrentEquipSet, "lastItemFormEquipped", none)
		else
			JMap.setInt(objCurrentEquipSet, "lastCycledIndex", -1)
		endIf
		SetMenuOptionValueST(equipModeDisplayStrings[currentEquipMode])
		ForcePageReset()
	endEvent

	event OnDefaultST()
		int currentEquipMode = JMap.getInt(objCurrentEquipSet, "equipMode")
		SetMenuOptionValueST(equipModeDisplayStrings[currentEquipMode])
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("Equipping behaviour: 1) Equip all items; 2) Equip all, toggle with last equipped items; 3) Cycle through and equip items one at a time; 4) Equip all, toggle between equip/unequip; or 5) Drop all items in EquipSet.")
	endEvent
endState

function NumShoutWordsMenu()
endFunction
state NumShoutWordsMenu
	event OnMenuOpenST()
		int numShoutWords = JMap.getInt(objCurrentEquipSet, "numShoutWords")
		if numShoutWords <= 0
			numShoutWords = kNumShoutWords_Default
		endIf
		SetMenuDialogStartIndex(numShoutWords - 1)
		SetMenuDialogDefaultIndex(numShoutWords - 1)
		SetMenuDialogOptions(numShoutWordsDisplayStrings)
		DebugMessage("NumShoutWordsMenu(Open): numShoutWords = " + numShoutWords)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		int numShoutWords
		if menuIndex < 0
			numShoutWords = kNumShoutWords_Default
		else
			numShoutWords = menuIndex + 1
		endIf
		JMap.setInt(objCurrentEquipSet, "numShoutWords", numShoutWords)
		SetMenuOptionValueST(numShoutWordsDisplayStrings[numShoutWords - 1])
		DebugMessage("NumShoutWordsMenu(Accept): numShoutWords = " + numShoutWords + "; menuIndex = " + menuIndex)
	endEvent

	event OnDefaultST()
		int numShoutWords = kNumShoutWords_Default
		SetMenuOptionValueST(numShoutWordsDisplayStrings[numShoutWords - 1])
		DebugMessage("NumShoutWordsMenu(Default): numShoutWords = " + numShoutWords)
	endEvent

	event OnHighlightST()
		SetInfoText("Number of shout words: Maximum number of words to shout when autocasting.")
	endEvent
endState

function FavoritedToggle()
endFunction
state FavoritedToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "favorited") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "favorited", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("FavoritedToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "favorited") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, favorited equipsets show up in the AH Hotkeys Favorites Menu.")
	endEvent
endState

function FastEquipToggle()
endFunction
state FastEquipToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "fastEquip") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "fastEquip", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		if toggleVal == true
			SetOptionFlagsST(OPTION_FLAG_DISABLED, false, "EquipModeMenu")
		else
			SetOptionFlagsST(OPTION_FLAG_NONE, false, "EquipModeMenu")
		endIf
		DebugMessage("FastEquipToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "fastEquip") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, equipsets will use a simpler, faster and more responsive equipping process. Because of the simpler design, fast equip does not use equipModes etc, but autocasting of spells and executing other equipsets are supported. Fast equip also executes an equipset while other equipsets are running rather than putting into the queue, so can be used to (for example) drink potions while casting spells etc.")
	endEvent
endState

function ConsumableEquipModeToggle()
endFunction
state ConsumableEquipModeToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "consumableEquipMode") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "consumableEquipMode", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("ConsumableEquipModeToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "consumableEquipMode") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, only the first available consumable (potions, scrolls etc) will be used. e.g. add all your different types of health potions and consume them one at a time when needed.")
	endEvent
endState

function AutoCastSpellsToggle()
endFunction
state AutoCastSpellsToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "autoCastSpells") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "autoCastSpells", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		if toggleVal
			SetOptionFlagsST(OPTION_FLAG_NONE, false, "EquipLastItemAfterAutoCastToggle")
			SetOptionFlagsST(OPTION_FLAG_NONE, false, "concentrationSpellOverride")
		else
			SetOptionFlagsST(OPTION_FLAG_DISABLED, false, "EquipLastItemAfterAutoCastToggle")
			SetOptionFlagsST(OPTION_FLAG_DISABLED, false, "concentrationSpellOverride")
		endIf
		DebugMessage("AutoCastSpellsToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "autoCastSpells") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, spells and scrolls will be cast automatically.")
	endEvent
endState

function ConcentrationSpellOverride()
endFunction
state ConcentrationSpellOverride ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "concentrationSpellOverride") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "concentrationSpellOverride", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("ConcentrationSpellOverride() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "concentrationSpellOverride") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, tells the spell autocasting script that this is a concentration-type spell. Concentration spells will continue to cast until magicka is depleted (e.g. healing, flames, wards etc). Check this if concentration spells end early due to magicka not depleting (e.g. due to restore magicka potion).")
	endEvent
endState

function EquipLastItemAfterAutoCastToggle()
endFunction
state EquipLastItemAfterAutoCastToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "equipLastItemAfterAutoCast") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentEquipSet, "equipLastItemAfterAutoCast", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("EquipLastItemAfterAutoCastToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentEquipSet, "equipLastItemAfterAutoCast") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, the last equipped item  will be re-equipped when spells or scrolls are autocast.")
	endEvent
endState

; Function SortByEffectMagnitude()
; 	int objInventoryItem
; 	int objItemMagicEffectMagnitudeArray
; 	int objFormArray = JMap.getObj(objCurrentEquipSet, "formArray")
; 	int objEffectMagnitudeArray = JArray.object()
; 	int objSortedFormArray = JArray.object()
; 	int numItems = JArray.count(objFormArray)
; 	int objEquipSetToAdd
; 	form theForm
; 	int itemDataType
; 	int actualItemType
; 	int currentFilterByMagicEffect = JMap.getInt(objCurrentEquipSet, "filterByMagicEffect")
; 	string currentMagicEffectFilterText = JMap.getStr(objCurrentEquipSet, "filterByMagicEffectText")
; 	int currentSort = JMap.getInt(objCurrentEquipSet, "itemSortOrder")
; 	int itemMagnitude
; 	int lastMagnitudeFound
; 	int highestOrLowestMagnitudeIndex
; 	int foundIndex
; 	int itemDataTypeOfFoundIndex
; 	int itemDataTypeOfCurrentIndex
; 	int arraySize = JArray.count(objFormArray)
; 	int i = 0
; 	DebugMessage("SortByEffectMagnitudeButton() = " + sortMenuList[currentSort])
; 	; DebugMessage("Listing all magnitudes...")
; 	while i < arraySize
; 		itemDataType = JArray.valueType(objFormArray, i)
; 		if itemDataType == AHUtils.kFormDataType ; item is an inventory item
; 			theForm = JArray.getForm(objFormArray, i)
; 			objInventoryItem = JFormMap.getObj(AHMain.objItemFormCache, theForm)
; 			itemMagnitude = GetItemEffectMagnitude(objInventoryItem, currentFilterByMagicEffect, currentMagicEffectFilterText)
; 			JArray.addInt(objEffectMagnitudeArray, itemMagnitude)
; 		else ; is EquipSet type
; 			itemMagnitude = 0
; 			JArray.addInt(objEffectMagnitudeArray, itemMagnitude)
; 		endIf
; 		; DebugMessage("Magnitude added = " + itemMagnitude + "; i = " + i)
; 		i += 1
; 	EndWhile
; 	i = 0
; 	; DebugMessage("Finding all forms in order and deleting from objFormArray, objItemTypeArray and objEffectMagnitudeArray...")
; 	while i < arraySize
; 		if currentSort == kSortMenuItem_HighestToLowestMagicEffect
; 			foundIndex = AHUtils.JArrayFindMaxIndex(objEffectMagnitudeArray, i)
; 		elseif currentSort == kSortMenuItem_LowestToHighestMagicEffect
; 			foundIndex = AHUtils.JArrayFindMinIndex(objEffectMagnitudeArray, i)
; 		else
; 			foundIndex = i
; 		endIf
; 		JArray.swapItems(objEffectMagnitudeArray, foundIndex, i)
; 		JArray.swapItems(objFormArray, foundIndex, i)
; 		i += 1
; 	EndWhile
; EndFunction

Function SortByEffectMagnitude(int objEquipSet)
	; int currentFilterByMagicEffect = JMap.getInt(objCurrentEquipSet, "filterByMagicEffect")
	; string currentMagicEffectFilterText = JMap.getStr(objCurrentEquipSet, "filterByMagicEffectText")
	; int currentSort = JMap.getInt(objCurrentEquipSet, "itemSortOrder")
	int jLuaArgs = 0
	jLuaArgs = JLua.setObj("objEquipSet", objEquipSet, jLuaArgs)
	; jLuaArgs = JLua.setInt("magicEffectFilter", currentFilterByMagicEffect, jLuaArgs)
	; jLuaArgs = JLua.setStr("customMagicEffectFilter", currentMagicEffectFilterText, jLuaArgs)
	int objFormArray = JMap.getObj(objEquipSet, "formArray")
	string equipSetName = JMap.getStr(objEquipSet, "name")
	; AHMain.PrintInventoryItemArray(objFormArray, "Before SortByEffectMagnitude(" + equipSetName + "):", debugLevels_kDebug)
	JLua.evalLuaInt("return AH_Hotkeys.SortEquipSetItemsByMagnitude2(args.objEquipSet)", jLuaArgs)
	; AHMain.PrintInventoryItemArray(objFormArray, "After SortByEffectMagnitude(" + equipSetName + "):", debugLevels_kDebug)
	; int objInventoryItem
	; int objFormArray = JMap.getObj(objCurrentEquipSet, "formArray")
	; int objMagnitudeArray = JArray.object()
	; int objSortedFormArray = JArray.object()
	; int numItems = JArray.count(objFormArray)
	; form theForm
	; int itemType
	; int itemDataType
	; int itemObjectType
	; int currentFilterByMagicEffect = JMap.getInt(objCurrentEquipSet, "filterByMagicEffect")
	; string currentMagicEffectFilterText = JMap.getStr(objCurrentEquipSet, "filterByMagicEffectText")
	; int currentSort = JMap.getInt(objCurrentEquipSet, "itemSortOrder")
	; int itemMagnitude
	; int lastMagnitudeFound
	; int highestOrLowestMagnitudeIndex
	; int foundIndex
	; int arraySize = JArray.count(objFormArray)
	; int i = 0
	; DebugMessage("SortByEffectMagnitudeButton() = " + sortMenuList[currentSort])
	; ; DebugMessage("Listing all magnitudes...")
	; while i < arraySize
	; 	objInventoryItem = AHMain.GetInventoryItemFromItemsArrayIndex(objFormArray, i)
	; 	itemObjectType = JMap.getInt(objInventoryItem, "objectType")
	; 	if itemObjectType == AHMain.kInventoryItemObject ; item is an inventory item
	; 		itemType = JMap.getInt(objInventoryItem, "itemType")
	; 		if (itemType == kPotion) || (itemType == kScrollItem)
	; 			itemMagnitude = GetItemEffectMagnitude(objInventoryItem, currentFilterByMagicEffect, currentMagicEffectFilterText)
	; 		elseif (itemType == kAmmo) || (itemType == kWeapon)
	; 			itemMagnitude = JMap.getInt(objInventoryItem, "itemDamage")
	; 		elseif (itemType == kArmor)
	; 			itemMagnitude = JMap.getInt(objInventoryItem, "itemArmourRating")
	; 		; else
	; 		; 	itemMagnitude = -1
	; 		endIf
	; 		JArray.addInt(objMagnitudeArray, itemMagnitude)
	; 	; else ; is EquipSet type
	; 	; 	itemMagnitude = -2
	; 	; 	JArray.addInt(objMagnitudeArray, itemMagnitude)
	; 	endIf
	; 	; DebugMessage("Magnitude added = " + itemMagnitude + "; i = " + i)
	; 	i += 1
	; EndWhile
	; i = 0
	; ; DebugMessage("Finding all forms in order and deleting from objFormArray, objItemTypeArray and objEffectMagnitudeArray...")
	; while i < arraySize
	; 	if currentSort == kSortMenuItem_HighestToLowestMagicEffect
	; 		foundIndex = AHUtils.JArrayFindMaxIndex(objMagnitudeArray, i)
	; 	elseif currentSort == kSortMenuItem_LowestToHighestMagicEffect
	; 		foundIndex = AHUtils.JArrayFindMinIndex(objMagnitudeArray, i)
	; 	else
	; 		foundIndex = i
	; 	endIf
	; 	JArray.swapItems(objMagnitudeArray, foundIndex, i)
	; 	JArray.swapItems(objFormArray, foundIndex, i)
	; 	i += 1
	; EndWhile
EndFunction

bool function IsValidInventoryForm(form itemForm)
	if !itemForm
		return false
	endIf
	return true
	; if itemForm
	; 	float formWeight = itemForm.GetWeight()
	; 	int formGoldValue = itemForm.GetGoldValue()
	; 	if formGoldValue >= 0
	; 		DebugMessage("IsValid: valid inventory form: " + itemForm.GetName() + "(" + itemForm + ")" + "; weight = " + formWeight + "; Gold Value = " + formGoldValue)
	; 		return true
	; 	else
	; 		DebugMessage("IsValid: invalid inventory form: (" + itemForm + ")" + "; weight = " + formWeight + "; Gold Value = " + formGoldValue)
	; 		return false
	; 	endIf
	; else
	; 	DebugMessage("IsValid: invalid form: (" + itemForm + ")", debugLevels_kError)
	; 	return false
	; endIf
endFunction

bool function IsValidInventoryItem(int objInventoryItem)
	if objInventoryItem
		form itemForm = JMap.getForm(objInventoryItem, "itemForm")
		if !itemForm
			return false
		endIf
		; return IsValidInventoryForm(itemForm)
	else
		DebugMessage("IsValid: invalid objInventoryItem: (" + objInventoryItem + ")", debugLevels_kError)
		return false
	endIf
	return true
endFunction

function LoadEquipSetPage(int objEquipSet)
	string equipSetName = JMap.getStr(objEquipSet, "name")
	DebugMessage("LoadEquipSetPage(): objEquipSet = " + equipSetName + "(" + objEquipSet + ")")
	lastHotKeyEditorMCMPage = kEquipSetPageTitle
	currentMCMPage = kEquipSetPageTitle
	if !AHMain.installed || !AHMain.active
		AddTextOptionST("UninstalledText", AHMain.modName + " is deactivated.", "", OPTION_FLAG_DISABLED)
		return
	endIf
	int foundInventoryLookupIndex
	int theOptionFlag
	int i
	int objInventoryItem
	form theForm
	int itemFormID
	int objItemObject
	int numItems
	form itemForm
	int itemID
	int itemType
	int itemDataType
	int itemObjectType
	int effectMagnitude
	int itemDamage
	int itemArmourRating
	string itemName
	string itemNameSuffix
	string apparelSlotName
	int apparelMenuID
	int kMaxMCMOptionID = 127
	int useHandAndShoutSlots = JMap.getInt(objEquipSet, "useHandAndShoutSlots")
	int currentFilterByMagicEffect = JMap.getInt(objEquipSet, "filterByMagicEffect")
	string currentMagicEffectFilterText = JMap.getStr(objEquipSet, "filterByMagicEffectText")
	int currentFilterByItemType = JMap.getInt(objEquipSet, "filterByItemType")
	string currentNameFilterText = JMap.getStr(objEquipSet, "filterByNameText")
	int currentSortOrder = JMap.getInt(objEquipSet, "itemSortOrder")
	int currentEquipMode = JMap.getInt(objEquipSet, "equipMode")
	int autoCastSpells = JMap.getInt(objEquipSet, "autoCastSpells")
	int autoRemoveInvalidItems = JMap.getInt(AHMain.objUserSettings, "autoRemoveInvalidItems")
	int objTempInventoryItem
	int maxMenuStringLength = JMap.getInt(AHMain.objUserSettings, "maxMenuStringLength") ; v2
	int numShoutWords = JMap.getInt(objEquipSet, "numShoutWords")
	if numShoutWords == 0 
		numShoutWords = kNumShoutWords_Default
	endIf
	int objFormArray = JMap.getObj(objEquipSet, "formArray")
	DebugMessage("LoadEquipSetPage() objFormArray count = " + JArray.count(objFormArray))
	if !objBackupEquipSet
		BackupEquipSet(objEquipSet)
	endIf
	; Left column of page
	SetCursorPosition(0)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddMenuOptionST("FileMenu", SetFontColour("File Menu...",kColour_MenuButton), "")
	AddMenuOptionST("EquipSetHotkeyGroupFilterMenu", SetFontColour("Filter for Hotkey Group", kColour_MenuButton), AHMgr.GetHotkeyGroupText(currentEquipSetHotKeyGroupFilterIndex))
	if !objEquipSet
		if JArray.count(AHMain.objEquipSetArray) > 0
			AddTextOptionST("EquipSetMenu", SetFontColour("Equip Set", kColour_MenuButton), "")
		else
			AddTextOptionST("EquipSetMenu", SetFontColour("Open EquipSet", kColour_MenuButton), "", OPTION_FLAG_DISABLED)
		endIf
	else
		AddTextOptionST("EquipSetMenu", SetFontColour("Equip Set", kColour_MenuButton), equipSetName)
	endIf
	; AddTextOptionST("ExitMCMButton", "Close MCM", "")
	AddHeaderOption("")
	if objEquipSet
		AddKeyMapOptionST("EquipSetKeyMap", "Hot Key", JMap.getInt(objEquipSet, "hotKey"), OPTION_FLAG_WITH_UNMAP)
		AddToggleOptionST("AltToggle", "Alt Key", JMap.getInt(objEquipSet, "altKey") as bool)
		AddToggleOptionST("ControlToggle", "Control Key", JMap.getInt(objEquipSet, "controlKey") as bool)
		AddToggleOptionST("ShiftToggle", "Shift Key", JMap.getInt(objEquipSet, "shiftKey") as bool)
		if JMap.getInt(AHMain.objUserSettings, "useCustomModifierKey4") && JMap.getInt(AHMain.objUserSettings, "customModifierKey4")
			AddToggleOptionST("ModifierKey4Toggle", "Modifier Key 4", JMap.getInt(objEquipSet, "modifierKey4") as bool)
		endIf
		AddMenuOptionST("EquipSetGroupMenu", "Hotkey Group", AHMgr.GetHotkeyGroupTextFromID(JMap.getInt(objEquipSet, "hotkeyGroupID")))
		bool fastEquip = JMap.getInt(objEquipSet, "fastEquip") as bool
		if !fastEquip
			AddMenuOptionST("EquipModeMenu", "Equip Mode:", equipModeDisplayStrings[currentEquipMode])
		else
			AddMenuOptionST("EquipModeMenu", "Equip Mode:", equipModeDisplayStrings[currentEquipMode], OPTION_FLAG_DISABLED)
		endIf
		if currentEquipMode == kEquipMode_OneAtATime
			float cycleEquipModeTimeout
			; string cycleEquipModeResetTimeoutString
			int cycleEquipMode = JMap.getInt(objCurrentEquipSet, "cycleEquipMode")
			if cycleEquipMode == kCycleEquipMode_ResetToFirstItemOnTimeOut
				if !JMap.hasKey(objCurrentEquipSet, "cycleEquipModeResetTimeout")
					JMap.setFlt(objCurrentEquipSet, "cycleEquipModeResetTimeout", kCycleEquipMode_defaultTimeout)
				endIf
				cycleEquipModeTimeout = JMap.getFlt(objCurrentEquipSet, "cycleEquipModeResetTimeout")
				; cycleEquipModeResetTimeoutString = " (" + cycleEquipModeTimeout + ")"
			endIf
			AddMenuOptionST("CycleEquipModeMenu", "Cycle Mode:", cycleEquipModeMenuList[cycleEquipMode])
			if cycleEquipMode == kCycleEquipMode_ResetToFirstItemOnTimeOut
				AddSliderOptionST("CycleResetTimeoutSlider", "Cycle Reset Timeout", cycleEquipModeTimeout)
			endIf
		elseif currentEquipMode == kEquipMode_DropAll
			float throwMagnitudePercent = JMap.getFlt(objCurrentEquipSet, "throwMagnitudePercent", 0.15)
			AddSliderOptionST("ThrowMagnitudePercentSlider", "Throwing Force (%)", (throwMagnitudePercent * 100))
		endIf
		AddToggleOptionST("FavoritedToggle", "Favorite EquipSet", JMap.getInt(objEquipSet, "favorited") as bool)
		AddToggleOptionST("FastEquipToggle", "Fast equip mode", JMap.getInt(objEquipSet, "fastEquip") as bool)
		AddToggleOptionST("ConsumableEquipModeToggle", "Stop at first available consumable", JMap.getInt(objEquipSet, "consumableEquipMode") as bool)
		AddToggleOptionST("AutoCastSpellsToggle", "Autocast Spells & Scrolls", autoCastSpells)
		if autoCastSpells
			theOptionFlag = OPTION_FLAG_NONE
		else
			theOptionFlag = OPTION_FLAG_DISABLED
		endIf 
		AddToggleOptionST("ConcentrationSpellOverride", "This is a concentration spell", JMap.getInt(objEquipSet, "concentrationSpellOverride") as bool, theOptionFlag)
		AddToggleOptionST("EquipLastItemAfterAutoCastToggle", "Equip last item when spell is autocast", JMap.getInt(objEquipSet, "equipLastItemAfterAutoCast") as bool, theOptionFlag)
		AddMenuOptionST("NumShoutWordsMenu", "Number of Shout Words:", numShoutWordsDisplayStrings[numShoutWords - 1])
		theOptionFlag = OPTION_FLAG_NONE

		AddHeaderOption("")
		AddToggleOptionST("NotifyWhenSetEquippedToggle", "Notify when set is equipped.", JMap.getInt(objEquipSet, "notifyWhenSetEquipped") as bool)
		AddToggleOptionST("NotifyWhenItemEquippedToggle", "Notify when item is equipped.", JMap.getInt(objEquipSet, "notifyWhenItemEquipped") as bool)
		AddToggleOptionST("UnequipLeftHandToggle", "Unequip Left Hand", JMap.getInt(objEquipSet, "unequipLeftHand") as bool)
		AddToggleOptionST("UnequipRightHandToggle", "Unequip Right Hand", JMap.getInt(objEquipSet, "unequipRightHand") as bool)
		AddToggleOptionST("UnequipAllItemsToggle", "Unequip all other items", JMap.getInt(objEquipSet, "unequipAllItems") as bool)
		AddToggleOptionST("ReEquipItemsToggle", "Re-equip items", JMap.getInt(objEquipSet, "reEquipItems") as bool, OPTION_FLAG_NONE)
		AddToggleOptionST("SheatheHandsOnUnequipToggle", "Sheathe hands on unequip", JMap.getInt(objEquipSet, "sheatheHandsOnUnequip") as bool)
		AddToggleOptionST("OverrideUnequipItemExclusionToggle", "Override Unequip Item Exclusion", JMap.getInt(objEquipSet, "overrideUnequipItemExclusion") as bool)
		AddToggleOptionST("PropogateEquipMode", "Propogate EquipMode", JMap.getInt(objEquipSet, "propogateEquipMode") as bool, OPTION_FLAG_NONE)

		; Right column of page
		SetCursorPosition(1)
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddMenuOptionST("EquipSetOptionsMenu", SetFontColour("Options Menu...", kColour_MenuButton), ""); RemoveAllItems; GetAlLEquippedItems
		AddHeaderOption("")
		AddMenuOptionST("FilterByItemTypeMenu", "Filter by item type:", filterByItemTypeMenuList[currentFilterByItemType])
		AddTextOptionST("FilterByItemNameButton", "Filter by item name:", GetFilterByItemNameButtonText())
		if currentFilterByMagicEffect != kCustomEffect
			AddMenuOptionST("FilterByMagicEffectMenu", "Filter by MagicEffect:", filterByMagicEffectMenuList[currentFilterByMagicEffect], theOptionFlag)
		else
			AddMenuOptionST("FilterByMagicEffectMenu", "Filter by MagicEffect:", currentMagicEffectFilterText, theOptionFlag)
		endIf
		AddMenuOptionST("SortMenu", "Sort by:", sortMenuList[currentSortOrder])

		AddToggleOptionST("equipSetSlotHeaderToggle", "Left/Righthand/Shout or Power", useHandAndShoutSlots)
		; DebugMessage("LoadEquipSetPage(): useHandAndShoutSlots = " + useHandAndShoutSlots)
		AHMain.ValidateEquipSetItemsWithCache(objEquipSet, true)
		if useHandAndShoutSlots
			if (currentFilterByItemType == kFilterByWeapons) || (currentFilterByItemType == kFilterByOther) || (currentFilterByItemType == kFilterByAllTypes) ||  (currentFilterByItemType == kFilterBySpells) ||  (currentFilterByItemType == kFilterByScrolls)
				theOptionFlag = OPTION_FLAG_NONE
			else
				theOptionFlag = OPTION_FLAG_DISABLED
			endIf
			; Right hand slot
			; theForm = JMap.getForm(objEquipSet, "rightHandForm")
			; DebugMessage("LoadEquipSetPage(): display RH item form = " + theForm + "; form name = " + AHUtils.GetFormName(theForm))
			objInventoryItem = AHMain.GetEquipSetHandInventoryItem(objEquipSet, kRightHand)
			if objInventoryItem
				; AHMain.ValidateInventoryItemForm(objInventoryItem)
				itemName = JMap.getStr(objInventoryItem, "itemDisplayName")
				itemID = JMap.getInt(objInventoryItem, "itemID")
				DebugMessage("LoadEquipSetPage(): display RH item = " + itemName + "; objInventoryItem = " + objInventoryItem + "; itemID = " + itemID)
				itemName = AHUtils.TruncateString(itemName, maxMenuStringLength - 4, true)
				if itemID ; if this is a specific non-generic item (i.e. with an itemID), then indicate with an asterisk.
					itemName = itemName + "*"
				endIf
				rightHandMenuID = AddMenuOption("1) Right", itemName, theOptionFlag)
			else
				rightHandMenuID = AddMenuOption("1) Right", "Add Item...", theOptionFlag)
			endif
			; Left Hand Slot
			; theForm = JMap.getForm(objEquipSet, "leftHandForm")
			objInventoryItem = AHMain.GetEquipSetHandInventoryItem(objEquipSet, kLeftHand)
			if objInventoryItem 
				; AHMain.ValidateInventoryItemForm(objInventoryItem)
				itemName = JMap.getStr(objInventoryItem, "itemDisplayName")
				itemID = JMap.getInt(objInventoryItem, "itemID")
				DebugMessage("LoadEquipSetPage(): display LH item = " + itemName + "; objInventoryItem = " + objInventoryItem + "; itemID = " + itemID)
				itemName = AHUtils.TruncateString(itemName, maxMenuStringLength - 4, true)
				if itemID ; if this is a specific non-generic item (i.e. with an itemID), then indicate with an asterisk.
					itemName = itemName + "*"
				endIf
				leftHandMenuID = AddMenuOption("2) Left", itemName, theOptionFlag)
			else
				leftHandMenuID = AddMenuOption("2) Left", "Add Item...", theOptionFlag)
			endif
			; Shout/Power
			theForm = JMap.getForm(objEquipSet, "shoutForm")
			if currentFilterByItemType == kFilterByEquipSets
				theOptionFlag = OPTION_FLAG_DISABLED
			else
				theOptionFlag = OPTION_FLAG_NONE
			endIf
			if theForm 
				itemFormID = theForm.GetFormID()
				objInventoryItem = AHMain.AddItemToCache(theForm, itemFormID)
				itemName = JMap.getStr(objInventoryItem, "itemName")
				itemName = AHUtils.TruncateString(itemName, maxMenuStringLength - 8, true)
				shoutPowerMenuID = AddMenuOption("3) Shout/Power", itemName, theOptionFlag)
			else
				shoutPowerMenuID = AddMenuOption("3) Shout/Power", "Add Item...", theOptionFlag)
			endif
		else
			rightHandMenuID = 0
			leftHandMenuID = 0
			shoutPowerMenuID = 0
		endIf

		int arraySize

		; Auto Add Items (Potions, Poisons, Food, Arrows, Bolts)
		bool showAutoAddItems = JMap.getInt(objEquipSet, "showAutoAddItems") as bool
		int objAutoAddItemArray = JMap.getObj(objEquipSet, "autoAddItemArray")
		int numAutoAddItems = 0
		string numString
		if objAutoAddItemArray
			numAutoAddItems = JArray.count(objAutoAddItemArray)
		endIf
		if numAutoAddItems == 0
			numString = "(none)"
		else
			numString = "("+numAutoAddItems+" items)"
		endIf
		showAutoAddItemsOptionID = AddToggleOption("Auto Add Items "+numString, showAutoAddItems, theOptionFlag)
		if !objAutoAddListMenuOptionIDArray
			objAutoAddListMenuOptionIDArray = JArray.object()
		else
			JArray.clear(objAutoAddListMenuOptionIDArray)
		endIf
		if showAutoAddItems
			newAutoAddItemButtonOptionID = AddTextOption("New Auto Add Item...", "", theOptionFlag)
			if JMap.hasKey(objEquipSet, "autoAddItemArray")
				if JArray.count(objAutoAddItemArray) > 0
					AddHeaderOption("Auto Add Items ")
					int autoAddOptionID
					int autoAddItemType
					int objAutoAddItem
					int objItemMagicEffectNameArray
					int exactMatchAll
					string autoAddItemEffectsString
					string itemTypeText
					arraySize = JArray.count(objAutoAddItemArray)
					i = 0
					while i < arraySize
						objAutoAddItem = JArray.getObj(objAutoAddItemArray, i)
						autoAddItemType = JMap.getInt(objAutoAddItem, "autoAddItemType")
						exactMatchAll = JMap.getInt(objAutoAddItem, "exactMatchAll")
						itemTypeText = AHMain.GetItemTypeText(autoAddItemType)
						objItemMagicEffectNameArray = JMap.getObj(objAutoAddItem, "itemMagicEffectNameArray")
						autoAddItemEffectsString = JLua.evalLuaStr("return AH_Hotkeys.ConcatJArrayToString(args.inputJArray, ',', "+maxMenuStringLength+")", JLua.setObj("inputJArray", objItemMagicEffectNameArray))
						if exactMatchAll
							autoAddItemEffectsString = "(" + autoAddItemEffectsString + ")"
						endIf
						; magicEffectNamesString = AHUtils.TruncateString(magicEffectNamesString, maxMenuStringLength, true, false)
						autoAddOptionID = AddMenuOption((i + 1) + ") " + itemTypeText, autoAddItemEffectsString)
						JArray.addInt(objAutoAddListMenuOptionIDArray, autoAddOptionID)
						i += 1
					EndWhile
					int findResult = JArray.findObj(objAutoAddEquipSetsUpdatedArray, objEquipSet)
					bool autoAddItemsNeedUpdating
					if findResult == -1
						autoAddItemsNeedUpdating = true
					else
						autoAddItemsNeedUpdating = false
					endIf
					DebugMessage("LoadEquipSetPage(): autoAddItemsNeedUpdating = " + autoAddItemsNeedUpdating + "; findResult = " + findResult + "; objAutoAddEquipSetsUpdatedArray = " + objAutoAddEquipSetsUpdatedArray, debugLevels_kDebug)
					; AHMain.PrintJObject(objAutoAddEquipSetsUpdatedArray, "objAutoAddEquipSetsUpdatedArray: ", debugLevels_kDebug, 1)
					if autoAddItemsNeedUpdating
						float startTime = Utility.GetCurrentRealTime()
						JLua.evalLuaInt("return AH_Hotkeys.CheckAndAutoAddAllItemsToEquipSet(args.objEquipSet, args.objInventoryArray)", JLua.setObj("objEquipSet", objEquipSet, JLua.setObj("objInventoryArray", AHMain.objInventoryItemArray)))
						float endTime = Utility.GetCurrentRealTime()
						float elapsedTime = endTime - startTime
						DebugMessage("CheckAndAutoAddAllItemsToEquipSet: time taken = " + elapsedTime)
						bool itemAdded = JLua.evalLuaInt("return AH_Hotkeys.AddIfNotInArray(args.objItemArray, args.item)", JLua.setObj("objItemArray", objAutoAddEquipSetsUpdatedArray, JLua.setObj("item", objEquipSet)))
						DebugMessage("LoadEquipSetPage(): AH_Hotkeys.AddIfNotInArray itemAdded = " + itemAdded, debugLevels_kDebug)
						AHMain.PrintJObject(objAutoAddEquipSetsUpdatedArray, "objAutoAddEquipSetsUpdatedArray: ", debugLevels_kDebug, 1)
						endTime = Utility.GetCurrentRealTime()
						elapsedTime = endTime - startTime
						DebugMessage("LoadEquipSetPage(): PrintJObject(objAutoAddEquipSetsUpdatedArray); cumulative time taken = " + elapsedTime, debugLevels_kDebug)
					endIf
				else
					JArray.clear(objAutoAddListMenuOptionIDArray)
				endIf
			else
				JArray.clear(objAutoAddListMenuOptionIDArray)
			endIf
		endIf
		SortByEffectMagnitude(objEquipSet)

		; Apparel / Consumables
		AddHeaderOption("Items ")
		if (currentFilterByItemType == kFilterByWeapons) || (currentFilterByItemType == kFilterBySpells)  
			theOptionFlag = OPTION_FLAG_DISABLED
		else
			theOptionFlag = OPTION_FLAG_NONE
		endIf
		if !objInventoryListMenuOptionIDArray
			objInventoryListMenuOptionIDArray = JArray.object()
		else
			JArray.clear(objInventoryListMenuOptionIDArray)
		endIf
		i = 0
		bool continueListingMCMOptions = true
		arraySize = JArray.count(objFormArray)
		DebugMessage("LoadEquipSetPage(): equipset apparel item count = " + arraySize)
		if arraySize > kMaxMCMOptionID
			arraySize = kMaxMCMOptionID
		endIf
		; AHMain.ValidateInventoryItemArray(objFormArray)
		While (i < arraySize) && continueListingMCMOptions
			objInventoryItem = 0
			apparelMenuID = -1
			objItemObject = AHMain.GetInventoryItemFromItemsArrayIndex(objFormArray, i)
			if objItemObject
				itemObjectType = JMap.getInt(objItemObject, "objectType")
				if itemObjectType == AHMain.kInventoryItemObject
				; itemDataType = JArray.valueType(objFormArray, i)
				; if itemDataType == AHUtils.kFormDataType ; inventory object type
				; 	theForm = JArray.getForm(objFormArray, i)
					; DebugMessage(i + ") FormID = " + theForm + "; name = " + theForm.GetName() + "; objItem name = " + JMap.getStr(AHMain.AddItemToCache(theForm), "itemName"))
				; 	if IsValidInventoryForm(theForm)
				; 		objInventoryItem = AHMain.AddItemToCache(theForm)
				; 	endIf
				; elseif itemDataType == AHUtils.kJObjectDataType
				; 	objItemObject = JArray.getObj(objFormArray, int index, int default)
					objInventoryItem = objItemObject
					; itemForm = AHMain.ValidateAndGetInventoryItemForm(objInventoryItem)
					itemForm = JMap.getForm(objInventoryItem, "itemForm")
					; DebugMessage("Debug: LoadEquipSetPage(): objInventoryItem; itemName = " + JMap.getStr(objInventoryItem, "itemName") + "; count of pairs = " + JMap.count(objItemObject) + "; itemForm = " + itemForm)
					if itemForm
						itemName = JMap.getStr(objInventoryItem, "itemDisplayName")
						itemID = JMap.getInt(objInventoryItem, "ItemID")
						itemType = JMap.getInt(objInventoryItem, "itemType")
						apparelSlotName = (i + 1) + ")"
						if (itemType == kPotion) || (itemType == kIngredient)
							numItems = playerREF.GetItemCount(itemForm)
							effectMagnitude = GetItemEffectMagnitude(objInventoryItem, currentFilterByMagicEffect, currentMagicEffectFilterText)
							effectMagnitude = AHUtils.maxFlt(effectMagnitude, 0) as int
							itemNameSuffix = " (" + numItems + ")(+" + effectMagnitude + ")"
							itemName = AHUtils.TruncateString(itemName, maxMenuStringLength - StringUtil.GetLength(itemNameSuffix), true)
							apparelMenuID = AddMenuOption(apparelSlotName, itemName + itemNameSuffix, theOptionFlag)
						elseif (itemType == kAmmo)
							numItems = playerREF.GetItemCount(itemForm)
							itemDamage = JMap.getInt(objInventoryItem, "itemDamage")
							itemNameSuffix = " (" + numItems + ")(+" + itemDamage + ")"
							itemName = AHUtils.TruncateString(itemName, maxMenuStringLength - StringUtil.GetLength(itemNameSuffix), true)
							apparelMenuID = AddMenuOption(apparelSlotName, itemName + itemNameSuffix, theOptionFlag)
						else
							itemName = AHUtils.TruncateString(itemName, maxMenuStringLength, true)
							if itemID
								itemName = itemName + "*"
							endIf
							apparelMenuID = AddMenuOption(apparelSlotName, itemName, theOptionFlag)
						endIf
					else ; form is invalid
						if autoRemoveInvalidItems
							DebugMessage("Form invalid. Erasing index " + i)
							JArray.eraseIndex(objFormArray, i)
							i -= 1
							arraySize -= 1
						else
							DebugMessage("Form invalid. Displaying <invalid> label for item " + i)
							itemName = AHUtils.TruncateString("[Invalid Item]", maxMenuValueStringLength, true)
							apparelSlotName = (i + 1) + ")"
							apparelMenuID = AddMenuOption(apparelSlotName, itemName, theOptionFlag)
						endIf
					endIf
				elseif itemObjectType == AHMain.kEquipSetObject ; EquipSet type
					int objEquipSetToAdd = objItemObject
					numItems = AHMain.CountItemsInEquipSet(objEquipSetToAdd)
					itemName = JMap.getStr(objEquipSetToAdd, "name")
					itemNameSuffix = " (" + numItems + ")"
					itemName = AHUtils.TruncateString(itemName, maxMenuStringLength - StringUtil.GetLength(itemNameSuffix), true)
					DebugMessage("Show EquipSet itemName = " + itemName + itemNameSuffix)
					apparelSlotName = (i + 1) + ")"
					apparelMenuID = AddMenuOption(apparelSlotName, itemName + itemNameSuffix, theOptionFlag)
				endIf
			else
				if autoRemoveInvalidItems
					DebugMessage("Form or EquipSet object invalid. Erasing index " + i)
					JArray.eraseIndex(objFormArray, i)
					arraySize -= 1
					i -= 1
				else
					DebugMessage("Object invalid. Displaying <invalid> label for item " + i)
					itemName = AHUtils.TruncateString("[Invalid Item]", maxMenuValueStringLength, true)
					apparelSlotName = (i + 1) + ")"
					apparelMenuID = AddMenuOption(apparelSlotName, itemName, theOptionFlag)
				endIf
			endIf
			; DebugMessage("apparelMenuID = " + apparelMenuID)
			; if (apparelMenuID >= 0) && (apparelMenuID < kMaxMCMOptionID - 1)
			if apparelMenuID > -1
				JArray.addInt(objInventoryListMenuOptionIDArray, apparelMenuID)
			endIf
			; else
			; 	DebugMessage("LoadEquipSetPage(): error or maximum MCM options added. Stopping list generation. Last apparelMenuID = " + apparelMenuID)
			; 	continueListingMCMOptions = false
			; 	DebugMessage("The maximum number of MCM options have been added. No further items will be displayed.", false, true, true)
			; endIf
			i += 1
		EndWhile
		addItemsMenuID = AddMenuOption("Add Item..." , "", theOptionFlag)
	endIf
endFunction

; BEGIN EquipSet Items Menu List
;kArmor = 26; kAmmo = 42; kOutfit = 124; kPotion = 46; kProjectile = 50; kScrollItem = 23; 
;kShout = 119; kSpell = 22; kWeapon = 41; kWordOfPower = 118; kVoiceType = 98

;-------------------------------------EQUIPSET OPTION MENUS AND BUTTONS -------------------------------------

function OnOptionMenuOpen_EquipSetPage(int optionID)
	DebugMessage("OnOptionMenuOpen_EquipSetPage()")
	if optionID > 0
		OnOptionMenuOpen_EquipSetPageItemControls(optionID)
	endIf
endFunction

function OnOptionMenuAccept_EquipSetPage(int optionID, int menuIndex)
	if optionID > 0
		OnOptionMenuAccept_EquipSetPageItemControls(optionID, menuIndex)
	endIf
endFunction

int showAutoAddItemsOptionID
int newAutoAddItemButtonOptionID

function OnOptionSelect_EquipSetPage(int optionID)
	if optionID == showAutoAddItemsOptionID
		ShowAutoAddItemsToggle_OnSelect(optionID)
	elseif optionID == newAutoAddItemButtonOptionID
		NewAutoAddItemButton_OnSelect(optionID)
	endIf
endFunction

string function OnOptionHighlight_EquipSetPage(int optionID)
	string infoText
	if optionID == showAutoAddItemsOptionID
		infoText = ShowAutoAddItemsToggle_OnHighlight()
	elseif JMap.getInt(objCurrentEquipSet, "showAutoAddItems") && (optionID == newAutoAddItemButtonOptionID)
		infoText = NewAutoAddItemButton_OnHighlight()
	else
		infoText = OnOptionHighlight_EquipSetPageItemControls(optionID)
	endIf
	return infoText
endFunction

string EquipSetItem_kCancel = "(Cancel)"
string EquipSetItem_kNone = "(None)"
string EquipSetItem_kAddAllItems = "(Add All Items)"
string EquipSetItem_kFindItem = "(Find Item)"
string EquipSetItem_kFindEquipSet = "(Find EquipSet)"
string EquipSetItem_kAddEquipSet = "(Add EquipSet)"
string EquipSetItem_kAddItem = "(Add Item)"
string EquipSetItem_kSwapWithOtherHand = "(Swap with other hand)"
string EquipSetItem_kMoveUp = "(Move Up)"
string EquipSetItem_kMoveDown = "(Move Down)"
string EquipSetItem_kGoToEquipSet = "(Go to EquipSet)"
string EquipSetItem_kAutoAddItem = "(Auto Add Item - Potion, Food or Ammo)"
string EquipSetItem_kConvertToGenericItem = "(Convert to generic item)"
string EquipSetItem_kConvertToSpecificItem = "(Convert to specific item)"
string EquipSetItem_kDelete = "Remove Auto Add"
string EquipSetItem_kDeleteAll = "Remove All Auto Adds"
string EquipSetItem_kEdit = "Edit"
int EquipSetItem_listOffset

int EquipSetPage_OptionIDType
int EquipSetPage_kHandMenu = 1
int EquipSetPage_kShoutMenu = 2
int EquipSetPage_kAutoAddMenu = 3
int EquipSetPage_kApparelMenu = 4
int EquipSetPage_kAddItemsMenu = 5

int leftHandMenuID
int rightHandMenuID
int shoutPowerMenuID
int addItemsMenuID


function OnOptionMenuOpen_EquipSetPageItemControls(int optionID)
	DebugMessage("OnOptionMenuOpen_EquipSetPageItemControls()")
	float startTime = Utility.GetCurrentRealTime()
	int i
	int itemObjectType
	int objInventoryItem
	int objEquipSetObject
	int objInventoryListMenuOptionIDInventoryItem
	int itemType
	int itemDataType
	int actualItemType
	form itemForm
	int numItems
	string itemName
	int objItemMagicEffectNameArray
	int objItemMagicEffectMagnitudeArray
	int itemTypeFilterBits
	string itemNameFilter = JMap.getStr(objCurrentEquipSet, "filterbyNameText")
	int itemMagicEffectFilter = JMap.getInt(objCurrentEquipSet, "filterByMagicEffect")
	string itemMagicEffectFilterText = JMap.getStr(objCurrentEquipSet, "filterByMagicEffectText")
	int equipSetTypeFilter = JMap.getInt(objCurrentEquipSet, "filterByItemType")
	int equipSetFilterBits = GetItemTypeFilterMaskFromID(equipSetTypeFilter)
	int inventoryMenuIndex = 0
	int arraySize
	form theForm
	int theItemType
	string isFavoriteString
	string numItemsString
	int effectMagnitude
	int menuItemDefaultIndex = 0
	bool defaultIndexFound = false
	int foundIndex
	int foundInventoryLookupIndex
	int inventoryListFirstMenuID = JArray.getInt(objInventoryListMenuOptionIDArray, 0)
	int inventoryListLastMenuID = JArray.getInt(objInventoryListMenuOptionIDArray, JArray.count(objInventoryListMenuOptionIDArray) - 1)
	int inventoryListMenuOptionIDArrayIndex
	form inventoryListMenuOptionIDForm
	int inventoryListMenuOptionIDEquipSet
	int objFormArray = JMap.getObj(objCurrentEquipSet, "formArray")
	int objCurrentlyWornItemsArray
	int objLeftHandInventoryItem
	int objRightHandInventoryItem
	int objEquipSetItems
	if (optionID == leftHandMenuID) || (optionID == rightHandMenuID)
		EquipSetPage_OptionIDType = EquipSetPage_kHandMenu
	elseif (optionID == shoutPowerMenuID)
		EquipSetPage_OptionIDType = EquipSetPage_kShoutMenu
	elseif JMap.getInt(objCurrentEquipSet, "showAutoAddItems") && JArray.findInt(objAutoAddListMenuOptionIDArray, optionID) != -1
		; if JArray.findInt(objAutoAddListMenuOptionIDArray, optionID) != -1
			EquipSetPage_OptionIDType = EquipSetPage_kAutoAddMenu
		; endIf
	elseif JArray.findInt(objInventoryListMenuOptionIDArray, optionID) != -1
		EquipSetPage_OptionIDType = EquipSetPage_kApparelMenu
	elseif (optionID == addItemsMenuID)
		EquipSetPage_OptionIDType = EquipSetPage_kAddItemsMenu
	endIf
	int objInventoryMenuItemStringsArray = JValue.addToPool(JArray.object(), JCTempPoolClearOnCloseMCM)
	JArray.addStr(objMenuListStringsArray, EquipSetItem_kCancel)
	if (EquipSetPage_OptionIDType == EquipSetPage_kAutoAddMenu)
		JArray.addStr(objMenuListStringsArray, EquipSetItem_kEdit)
		JArray.addStr(objMenuListStringsArray, EquipSetItem_kDelete)
		JArray.addStr(objMenuListStringsArray, EquipSetItem_kDeleteAll)
	elseif (EquipSetPage_OptionIDType == EquipSetPage_kAddItemsMenu)
		if equipSetTypeFilter != kFilterByEquipSets
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kAddAllItems)
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kFindItem)
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kAddEquipSet)
		else
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kFindEquipSet)
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kAddItem)
		endIf
	else
		JArray.addStr(objMenuListStringsArray, EquipSetItem_kNone)
		if equipSetTypeFilter != kFilterByEquipSets
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kFindItem)
		else
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kFindEquipSet)
		endIf
	endIf
	if EquipSetPage_OptionIDType == EquipSetPage_kHandMenu
		JArray.addStr(objMenuListStringsArray, EquipSetItem_kSwapWithOtherHand)
		if optionID == leftHandMenuID
			objInventoryItem = AHMain.GetEquipSetHandInventoryItem(objCurrentEquipSet, kLeftHand)
		elseif optionID == rightHandMenuID
			objInventoryItem = AHMain.GetEquipSetHandInventoryItem(objCurrentEquipSet, kRightHand)
		endIf
		if objInventoryItem
			if AHMain.InventoryItemIsGeneric(objInventoryItem)
				JArray.addStr(objMenuListStringsArray, EquipSetItem_kConvertToSpecificItem)
			else
				JArray.addStr(objMenuListStringsArray, EquipSetItem_kConvertToGenericItem)
			endIf
		endIf
		itemTypeFilterBits = AHMain.kWeaponType + AHMain.kShieldType + AHMain.kSpellType + AHMain.kScrollType
		itemTypeFilterBits = Math.LogicalAnd(itemTypeFilterBits, equipSetFilterBits)
		objInventoryMenuItemObjectsArray = BuildInventoryItemsArray(itemNameFilter, itemTypeFilterBits, kAllMagicEffects, "", 0, 0)
	elseif EquipSetPage_OptionIDType == EquipSetPage_kShoutMenu
		form shoutForm = JMap.getForm(objCurrentEquipSet, "shoutForm")
		objInventoryItem = AHMain.AddItemToCache(shoutForm, 0)
		; objInventoryItem = JFormMap.getObj(AHMain.objItemFormCache, shoutForm)
		itemTypeFilterBits = AHMain.kShoutType
		objEquipSetItems = JLua.evalLuaObj("return AH_Hotkeys.GetEquipSetItems(args.objCurrentEquipSet, args.recurseIntoSubEquipSets)", JLua.setObj("objCurrentEquipSet", objCurrentEquipSet, JLua.setInt("recurseIntoSubEquipSets", 0)))
		objInventoryMenuItemObjectsArray = BuildInventoryItemsArray(itemNameFilter, itemTypeFilterBits, kAllMagicEffects, "", objEquipSetItems, objInventoryItem)
		; AHMain.PrintJObject(objEquipSetItems, "Debug: EquipSetPage_kShoutMenu, objInventoryMenuItemObjectsArray", debugLevels_kDebug)
		; AHMain.PrintJObject(objInventoryMenuItemObjectsArray, "Debug: EquipSetPage_kShoutMenu, objInventoryMenuItemObjectsArray", debugLevels_kDebug)
		; AHMain.PrintJObject(AHMain.objInventoryItemArray, "Debug: EquipSetPage_kShoutMenu, objInventoryMenuItemObjectsArray", debugLevels_kDebug)
	elseif (EquipSetPage_OptionIDType == EquipSetPage_kApparelMenu) || (EquipSetPage_OptionIDType == EquipSetPage_kAddItemsMenu)
		if (EquipSetPage_OptionIDType == EquipSetPage_kApparelMenu)
			inventoryListMenuOptionIDArrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
			objInventoryListMenuOptionIDInventoryItem = AHMain.GetInventoryItemFromItemsArrayIndex(objFormArray, inventoryListMenuOptionIDArrayIndex)
			itemObjectType = JMap.getInt(objInventoryListMenuOptionIDInventoryItem, "objectType")
			if objInventoryListMenuOptionIDInventoryItem && (equipSetTypeFilter != kFilterByEquipSets) && (itemObjectType != AHMain.kEquipSetObject)
				if AHMain.InventoryItemIsGeneric(objInventoryListMenuOptionIDInventoryItem)
					JArray.addStr(objMenuListStringsArray, EquipSetItem_kConvertToSpecificItem)
				else
					JArray.addStr(objMenuListStringsArray, EquipSetItem_kConvertToGenericItem)
				endIf
			endIf
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kAddEquipSet)
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kMoveUp)
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kMoveDown)
			if itemObjectType == AHMain.kEquipSetObject
				JArray.addStr(objMenuListStringsArray, EquipSetItem_kGoToEquipSet)
			endIf
			itemType = JMap.getInt(objInventoryListMenuOptionIDInventoryItem, "itemType")
			if (itemType == kPotion) || (itemType == kAmmo)
				JArray.addStr(objMenuListStringsArray, EquipSetItem_kAutoAddItem)
			endIf
		else
			objInventoryListMenuOptionIDInventoryItem = 0
		endIf
		if equipSetTypeFilter != kFilterByEquipSets ; List items other than EquipSets
			objInventoryItem = objInventoryListMenuOptionIDInventoryItem
			itemTypeFilterBits = AHMain.kArmorType + AHMain.kAmmoType + AHMain.kScrollType + AHMain.kPotionType + AHMain.kIngredientType + AHMain.kFoodType + AHMain.kPoisonType + AHMain.kOtherType
			itemTypeFilterBits = Math.LogicalAnd(itemTypeFilterBits, equipSetFilterBits)
			objEquipSetItems = JLua.evalLuaObj("return AH_Hotkeys.GetEquipSetItems(args.objCurrentEquipSet, args.recurseIntoSubEquipSets)", JLua.setObj("objCurrentEquipSet", objCurrentEquipSet, JLua.setInt("recurseIntoSubEquipSets", 0)))
			objInventoryMenuItemObjectsArray = BuildInventoryItemsArray(itemNameFilter, itemTypeFilterBits, itemMagicEffectFilter, itemMagicEffectFilterText, objEquipSetItems, objInventoryItem)
			UpdateIngredientMagicEffectKnownStatus(objInventoryMenuItemObjectsArray)
		else ; equipSetTypeFilter == kFilterByEquipSets - list all equipSets for inclusion in this equipSet
			JArray.addStr(objMenuListStringsArray, EquipSetItem_kAddItem)
			i = 0
			arraySize = JArray.count(AHMain.objEquipSetArray) ;AHUtils.min(JArray.count(AHMain.objEquipSetArray), 128 - inventoryMenuItemOffset)
			if objInventoryMenuItemObjectsArray == 0
				objInventoryMenuItemObjectsArray = JArray.object()
			else
				JArray.clear(objInventoryMenuItemObjectsArray)
			endIf
			int objItemObjectMenuList = JLua.evalLuaObj("return AH_Hotkeys.GetEquipSetListNameArray(args.objEquipSetArrayToList, args.printHotkeyCombo)", JLua.setObj("objEquipSetArrayToList", AHMain.objEquipSetArray, JLua.setInt("printHotkeyCombo", 1)))
			JArray.addFromArray(objInventoryMenuItemStringsArray, objItemObjectMenuList)
			JArray.addFromArray(objInventoryMenuItemObjectsArray, AHMain.objEquipSetArray)
			; i = 0
			; int listIndex = 0
			; int objEquipSet
			; int hotkeyGroupID
			; string theEquipSetName
			; string menuItemString
			; string menuItemSuffixString
			; bool itemNameFilterPassed
			; bool equipSetWasFound
			; while i < arraySize
			; 	objEquipSet = AHMain.GetEquipSetFromIndex(i)
			; 	theEquipSetName = JMap.getStr(objEquipSet, "name")
			; 	; DebugMessage("Debug: Check equipset to add to menu: objEquipSet = " + theEquipSetName)
			; 	if itemNameFilter != ""
			; 		itemNameFilterPassed = JValue.evalLuaInt(0, "return AH_Hotkeys.MatchTextFromDelimitedString('"+theEquipSetName+"','"+itemNameFilter+"', ',') == true")
			; 		; DebugMessage("Debug: do evalLuaInt(AH_Hotkeys.MatchTextFromDelimitedString): equipSetName = " + theEquipSetName + "; itemNameFilter = " + itemNameFilter + "; passed = " + itemNameFilterPassed)
			; 	else
			; 		itemNameFilterPassed = true
			; 	endIf
			; 	if (objEquipSet != objCurrentEquipSet) && itemNameFilterPassed ; don't add current EquipSet & only add if name is not filter out
			; 		equipSetWasFound = EquipSetContainsEquipSetItem(objCurrentEquipSet, objEquipSet, false)
			; 		DebugMessage("Check if EquipSetContainsEquipSetItem(): " + equipSetWasFound)
			; 		if !equipSetWasFound ;|| defaultIndexFound ; only add to list if it is not the current EquipSet or the current EquipSet does not contain this EquipSet in the items list array.
			; 			hotkeyGroupID = JMap.getInt(objEquipSet, "hotkeyGroupID")
			; 			menuItemString = ((listIndex + 1) + ") " + theEquipSetName)
			; 			menuItemSuffixString = AHMgr.GetHotkeyGroupTextFromID(hotkeyGroupID)
			; 			if menuItemSuffixString
			; 				menuItemString = menuItemString + " - " + menuItemSuffixString
			; 			endIf
			; 			JArray.addObj(objInventoryMenuItemObjectsArray, objEquipSet)
			; 			JArray.addStr(objInventoryMenuItemStringsArray, menuItemString)
			; 			listIndex += 1
			; 		endIf
			; 	endIf
			; 	i += 1
			; EndWhile
			EquipSetItem_listOffset = JArray.count(objMenuListStringsArray)
			DebugMessage("JArray.addFromArray(): objMenuListStringsArray = " + objMenuListStringsArray + "; objInventoryMenuItemStringsArray = " + objInventoryMenuItemStringsArray)
			JArray.addFromArray(objMenuListStringsArray, objInventoryMenuItemStringsArray)
			DebugMessage("JArray.asStringArray(): objMenuListStringsArray count = " + JArray.count(objMenuListStringsArray))
		endIf
	endIf
	if (EquipSetPage_OptionIDType != EquipSetPage_kAutoAddMenu) && (equipSetTypeFilter != kFilterByEquipSets)
		EquipSetItem_listOffset = JArray.count(objMenuListStringsArray)
		int jLuaArgs = 0
		jLuaArgs = JLua.setObj("objInventoryMenuItemObjectsArray", objInventoryMenuItemObjectsArray, jLuaArgs)
		jLuaArgs = JLua.setObj("objCurrentlyEquippedInventoryItems", AHMain.objCurrentlyEquippedInventoryItems, jLuaArgs)
		objInventoryMenuItemStringsArray = JLua.evalLuaObj("return AH_Hotkeys.BuildInventoryMenuList(args.objInventoryMenuItemObjectsArray, 1, args.objCurrentlyEquippedInventoryItems)", jLuaArgs)
		JArray.addFromArray(objMenuListStringsArray, objInventoryMenuItemStringsArray)
	endIf
	float endTime = Utility.GetCurrentRealTime()
	float elapsedTime = endTime - startTime
	DebugMessage("OnOptionMenuOpen(): show item list menu: elapsedTime = " + elapsedTime)
endFunction

function OnOptionMenuAccept_EquipSetPageItemControls(int optionID, int menuIndex)
	int setType
	int itemDataType
	int itemObjectType
	int objItemObject
	int objInventoryItem
	int objEquipSetItem
	int objCurrentEquipSetInventoryItem
	int objSwapInventoryItem
	form itemForm
	int itemFormID
	int inventoryListMenuOptionIDArrayIndex
	int inventoryListFirstMenuID = JArray.getInt(objInventoryListMenuOptionIDArray, 0)
	int inventoryListLastMenuID = JArray.getInt(objInventoryListMenuOptionIDArray, JArray.count(objInventoryListMenuOptionIDArray) - 1)
	int objFormArray = JMap.getObj(objCurrentEquipSet, "formArray")
	int swapEquipSetItem
	int currentItemArrayIndex
	int swapItemArrayIndex
	int currentItemDataType
	int swapItemDataType
	int numItems
	bool doItemSort = false
	bool askToReplaceAllItemsOnSwitch = JMap.getInt(AHMain.objUserSettings, "askToReplaceAllItemsOnSwitch")
	bool doAskReplaceAllItemInAllEquipSets
	string menuItemString = JArray.getStr(objMenuListStringsArray, menuIndex)
	int itemTypeFilterBits
	int objFilteredItemArray
	int objMenuList
	DebugMessage("OnOptionMenuAccept_EquipSetPage(): menuItemString = " + menuItemString, debugLevels_kNotice)
	if (optionID == leftHandMenuID) || (optionID == rightHandMenuID)
		int kHand
		string handItemString
		if optionID == leftHandMenuID
			kHand = kLeftHand
			handItemString = "Left Hand "
		elseif optionID == rightHandMenuID
			kHand = kRightHand
			handItemString = "Right Hand "
		endIf 
		int objHandItemObject = AHMain.GetEquipSetHandInventoryItem(objCurrentEquipSet, kHand)
		DebugMessage("OptionMenuAccept(): " + handItemString + " optionID = " + optionID + "; menuIndex = " + menuIndex, debugLevels_kNotice)
		if menuItemString == EquipSetItem_kCancel ; Cancel; Do nothing
			DebugMessage("OptionMenuAccept(): cancelInventoryMenuItem selected", debugLevels_kNotice)
			;
		elseif menuItemString == EquipSetItem_kNone ; (None). Remove this item.
			DebugMessage("OptionMenuAccept(): noneInventoryMenuItem selected", debugLevels_kNotice)
			AHMain.SetEquipSetHandInventoryItem(objCurrentEquipSet, 0, kHand)
		elseif menuItemString == EquipSetItem_kSwapWithOtherHand ; swap with other hand
			DebugMessage("OptionMenuAccept(): swapInventoryMenuItem selected", debugLevels_kNotice)
			AHMain.SwapEquipSetHandItems(objCurrentEquipSet)
		elseif menuItemString == EquipSetItem_kConvertToGenericItem
			DebugMessage("OptionMenuAccept(): convertToGenericItem selected", debugLevels_kNotice)
			int objNewInventoryItem = AHMain.ConvertInventoryItemToGeneric(objHandItemObject)
			if objNewInventoryItem
				AHMain.SetEquipSetHandInventoryItem(objCurrentEquipSet, objNewInventoryItem, kHand)
			endIf
		elseif menuItemString == EquipSetItem_kConvertToSpecificItem
			DebugMessage("OptionMenuAccept(): convertToSpecificItem selected", debugLevels_kNotice)
			int objNewInventoryItem = AHMain.AskAndConvertInventoryItemToSpecific(objHandItemObject)
			if objNewInventoryItem
				AHMain.SetEquipSetHandInventoryItem(objCurrentEquipSet, objNewInventoryItem, kHand)
			endIf
		else ; set hand equipset item to the selected item
			if menuItemString == EquipSetItem_kFindItem
				DebugMessage("OptionMenuAccept(): kFindItem selected", debugLevels_kNotice)
				itemTypeFilterBits = AHMain.kWeaponType + AHMain.kShieldType + AHMain.kSpellType + AHMain.kScrollType
				objMenuList = AHMain.FindAndGetInventoryItemFromList(handItemString + "item:", itemTypeFilterBits, 0, 0)
				objInventoryItem = JMap.getObj(objMenuList, "objInventoryItem")
			else
				itemDataType = JArray.valueType(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
				if itemDataType == AHUtils.kFormDataType
					itemForm = JArray.getForm(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
					if itemForm
						; objInventoryItem = JFormMap.getObj(objInventoryMenuItemObjectsArray, itemForm)
						objInventoryItem = AHMain.AddItemToCache(itemForm, 0)
						DebugMessage("OptionMenuAccept(): itemForm selected = " + itemForm + " (" + JMap.getStr(objInventoryItem, "itemDisplayName") + ")", debugLevels_kNotice)
					endIf
				elseif itemDataType == AHUtils.kJObjectDataType
					objItemObject = JArray.getObj(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
					itemObjectType = JMap.getInt(objItemObject, "objectType")
					if itemObjectType == AHMain.kInventoryItemObject
						objInventoryItem = objItemObject
						DebugMessage("OptionMenuAccept(): objInventoryItem selected = " + JMap.getStr(objInventoryItem, "itemDisplayName"), debugLevels_kNotice)
					endIf
				endIf
			endIf
			objCurrentEquipSetInventoryItem = AHMain.GetEquipSetHandInventoryItem(objCurrentEquipSet, kHand)
			int itemEquipSlotType = JMap.getInt(objInventoryItem, "itemEquipSlotType")
			if (kHand == kLeftHand) && (itemEquipSlotType == AHMain.kBothHandsEquipSlot)
				if ShowMessage("Two-handed items cannot be added into the left hand slot. Add to the right hand slot instead?", true, "Yes", "Cancel")
					AHMain.SetEquipSetHandInventoryItem(objCurrentEquipSet, objInventoryItem, kRightHand)
				endIf
			else
				AHMain.SetEquipSetHandInventoryItem(objCurrentEquipSet, objInventoryItem, kHand)
			endIf
		endIf
	elseif (optionID == shoutPowerMenuID)
		DebugMessage("OptionMenuAccept(): shoutPowerMenuID optionID = " + optionID + "; menuIndex = " + menuIndex, debugLevels_kNotice)
		if menuItemString == EquipSetItem_kCancel ; Cancel; Do nothing
			DebugMessage("OptionMenuAccept(): cancelInventoryMenuItem selected", debugLevels_kNotice)
			;
		elseif menuItemString == EquipSetItem_kNone ; (None). Remove this item.
			DebugMessage("OptionMenuAccept(): noneInventoryMenuItem selected", debugLevels_kNotice)
			AHMain.SetEquipSetShoutItem(objCurrentEquipSet, none)
		else
			if menuItemString == EquipSetItem_kFindItem
				DebugMessage("OptionMenuAccept(): kFindItem selected", debugLevels_kNotice)
				itemTypeFilterBits = AHMain.kShoutType
				objMenuList = AHMain.FindAndGetInventoryItemFromList("Shout or power:", itemTypeFilterBits, 0, 0)
				objInventoryItem = JMap.getObj(objMenuList, "objInventoryItem")
				itemForm = JMap.getForm(objInventoryItem, "itemForm")
			else
				itemDataType = JArray.valueType(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
				if itemDataType == AHUtils.kFormDataType
					itemForm = JArray.getForm(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
					if itemForm
						; objInventoryItem = JFormMap.getObj(objInventoryMenuItemObjectsArray, itemForm)
						objInventoryItem = AHMain.AddItemToCache(itemForm, 0)
						DebugMessage("OptionMenuAccept(): itemForm selected = " + itemForm + " (" + JMap.getStr(objInventoryItem, "itemDisplayName") + ")", debugLevels_kNotice)
					endIf
				elseif itemDataType == AHUtils.kJObjectDataType
					objItemObject = JArray.getObj(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
					itemObjectType = JMap.getInt(objItemObject, "objectType")
					if itemObjectType == AHMain.kInventoryItemObject
						objInventoryItem = objItemObject
						itemForm = JMap.getForm(objInventoryItem, "itemForm")
						DebugMessage("OptionMenuAccept(): objInventoryItem selected = " + JMap.getStr(objInventoryItem, "itemDisplayName"), debugLevels_kNotice)
					endIf
				endIf
			endIf
			AHMain.SetEquipSetShoutItem(objCurrentEquipSet, itemForm)
		endIf
	; Apparel / inventory list
	elseif EquipSetPage_OptionIDType == EquipSetPage_kApparelMenu
		currentItemArrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
		objCurrentEquipSetInventoryItem = AHMain.GetInventoryItemFromEquipSet(objCurrentEquipSet, currentItemArrayIndex)
		DebugMessage("Debug: objCurrentEquipSetInventoryItem selected = " + objCurrentEquipSetInventoryItem + "; name = " + JMap.getStr(objCurrentEquipSetInventoryItem, "itemDisplayName"), debugLevels_kNotice)
		numItems = JArray.count(objInventoryListMenuOptionIDArray)
		if menuItemString == EquipSetItem_kCancel ; Cancel; Do nothing
			DebugMessage("OptionMenuAccept(): cancelInventoryMenuItem selected", debugLevels_kNotice)
		elseif menuItemString == EquipSetItem_kNone ; (None). Remove this item.
			DebugMessage("OptionMenuAccept(): noneInventoryMenuItem selected", debugLevels_kNotice)
			AHMain.SetEquipSetWornItem(objCurrentEquipSet, 0, currentItemArrayIndex, false)
		elseif (menuItemString == EquipSetItem_kMoveUp) || (menuItemString == EquipSetItem_kMoveDown); Move Up or Move Down
			DebugMessage("OptionMenuAccept(): moveUpInventoryMenuItem or moveDownInventoryMenuItem selected", debugLevels_kNotice)
			if menuItemString == EquipSetItem_kMoveUp ; Move Up
				swapItemArrayIndex = currentItemArrayIndex - 1; next item up
			elseif menuItemString == EquipSetItem_kMoveDown ; Move Down
				swapItemArrayIndex = currentItemArrayIndex + 1; next item down
			endIf
			if (swapItemArrayIndex >= 0) && (swapItemArrayIndex < numItems)
				JArray.swapItems(objFormArray, currentItemArrayIndex, swapItemArrayIndex)
				JMap.setInt(objCurrentEquipSet, "itemSortOrder", kSortMenuItem_Cancel)
				SetMenuOptionValueST(sortMenuList[kSortMenuItem_Cancel], false, "SortMenu")
			endIf
		elseif (menuItemString == EquipSetItem_kConvertToGenericItem) || (menuItemString == EquipSetItem_kConvertToSpecificItem)
			if menuItemString == EquipSetItem_kConvertToGenericItem
				DebugMessage("OptionMenuAccept(): convertToGenericItem selected", debugLevels_kNotice)
			elseif menuItemString == EquipSetItem_kConvertToSpecificItem
				DebugMessage("OptionMenuAccept(): convertToSpecificItem selected", debugLevels_kNotice)
			endIf
			inventoryListMenuOptionIDArrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
			int objInventoryListMenuOptionIDInventoryItem = AHMain.GetInventoryItemFromItemsArrayIndex(objFormArray, inventoryListMenuOptionIDArrayIndex)
			; AHMain.PrintJObject(objInventoryListMenuOptionIDInventoryItem, "GetInventoryItemFromItemsArrayIndex: " + (inventoryListMenuOptionIDArrayIndex), debugLevels_kDebug)
			int objNewInventoryItem
			if menuItemString == EquipSetItem_kConvertToGenericItem
				objNewInventoryItem = AHMain.ConvertInventoryItemToGeneric(objInventoryListMenuOptionIDInventoryItem)
			elseif menuItemString == EquipSetItem_kConvertToSpecificItem
				objNewInventoryItem = AHMain.AskAndConvertInventoryItemToSpecific(objInventoryListMenuOptionIDInventoryItem)
			endIf
			if objNewInventoryItem
				AHMain.SetEquipSetWornItem(objCurrentEquipSet, objNewInventoryItem, inventoryListMenuOptionIDArrayIndex, false)
			endIf
			; AHMain.PrintJObject(objNewInventoryItem, "Converted objNewInventoryItem:", debugLevels_kDebug)
		elseif menuItemString == EquipSetItem_kAutoAddItem
			; int objAutoAddItemArray = JMap.getObj(objCurrentEquipSet, "autoAddItemArray")
			; int objMagicEffectNameArray = JMap.getObj(objCurrentEquipSetInventoryItem, "itemMagicEffectNameArray")
			; string magicEffectNamesString = JLua.evalLuaStr("return AH_Hotkeys.ConcatJArrayToString(args.inputJArray, args.delimiter)", JLua.setObj("inputJArray", objMagicEffectNameArray, JLua.setStr("delimiter", ",")))
			if !AHMgr.AddNewAutoAddItemToEquipSet(objCurrentEquipSet, objCurrentEquipSetInventoryItem)
				Debug.MessageBox("Magic effect not added. Check AH Hotkeys log.")
			endIf
			; if JArray.findStr(objAutoAddPotionEffectsArray, magicEffectNamesString) == -1
			; 	JArray.addStr(objAutoAddPotionEffectsArray, magicEffectNamesString)
			; else
			; 	Debug.MessageBox("Magic effect not added as these effects are already in the auto add list.")
			; 	; ShowMessage("Magic effect not added as these effects are already in the auto add list.", true, "Continue", "Cancel")
			; endIf
			; DebugMessage("Debug: objCurrentEquipSet = " + objCurrentEquipSet + "; objAutoAddPotionEffectsArray = " + objAutoAddPotionEffectsArray + "; objMagicEffectNameArray = " + objMagicEffectNameArray, debugLevels_kDebug)
			if AHMain.debugLevel >= AHMain.debugLevels_kDebug
				int objAutoAddItemArray = JMap.getObj(objCurrentEquipSet, "autoAddItemArray")
				AHMain.PrintJObject(objAutoAddItemArray, "AddNewAutoAddItemToEquipSet(): Print objAutoAddItemArray", debugLevels_kDebug)
			endIf
		elseif (menuItemString == EquipSetItem_kGoToEquipSet)
			itemObjectType = JMap.getInt(objCurrentEquipSetInventoryItem, "objectType")
			if itemObjectType == AHMain.kEquipSetObject
				int selectedEquipSet = objCurrentEquipSetInventoryItem
				DebugMessage("OptionMenuAccept(): menuIndex = " + menuIndex + "; Goto EquipSet: " + JMap.getStr(selectedEquipSet, "name") + " (" + selectedEquipSet + ")", debugLevels_kNotice)
				ShowEquipSet(selectedEquipSet)
				return
			endIf
		else; replace equipset item with selection from inventory
			if menuItemString == EquipSetItem_kFindItem
				DebugMessage("OptionMenuAccept(): kFindItem selected")
				inventoryListMenuOptionIDArrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
				int objInventoryItemToKeep = AHMain.GetInventoryItemFromItemsArrayIndex(objFormArray, inventoryListMenuOptionIDArrayIndex)
				int objEquipSetItems = JLua.evalLuaObj("return AH_Hotkeys.GetEquipSetItems(args.objCurrentEquipSet, args.recurseIntoSubEquipSets)", JLua.setObj("objCurrentEquipSet", objCurrentEquipSet, JLua.setInt("recurseIntoSubEquipSets", 0)))
				itemTypeFilterBits = AHMain.kArmorType + AHMain.kAmmoType + AHMain.kScrollType + AHMain.kPotionType + AHMain.kIngredientType + AHMain.kFoodType + AHMain.kPoisonType + AHMain.kOtherType
				objMenuList = AHMain.FindAndGetInventoryItemFromList("Replace Inventory Item:", itemTypeFilterBits, objEquipSetItems, objInventoryItemToKeep)
				objInventoryItem = JMap.getObj(objMenuList, "objInventoryItem")
				AHMain.SetEquipSetWornItem(objCurrentEquipSet, objInventoryItem, inventoryListMenuOptionIDArrayIndex, false)
			else
				DebugMessage("OptionMenuAccept(): inventory item selected", debugLevels_kNotice)
				objItemObject = AHMain.GetInventoryItemFromItemsArrayIndex(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
				; itemDataType = JArray.valueType(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
				; if itemDataType == AHUtils.kFormDataType
				; 	itemForm = JArray.getForm(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
				; 	objInventoryItem = JFormMap.getObj(AHMain.objItemFormCache, itemForm)
				; 	DebugMessage("OptionMenuAccept(): form selected = " + itemForm)
				; else ;if itemDataType == AHUtils.kJObjectDataType
				; 	objItemObject = JArray.getObj(objInventoryMenuItemObjectsArray, menuIndex - EquipSetItem_listOffset)
				; 	DebugMessage("Debug: objInventoryMenuItemObjectsArray isExists = " + JValue.isExists(objInventoryMenuItemObjectsArray) + "; count = " + JValue.count(objInventoryMenuItemObjectsArray) + "; JArray.count = " + JArray.count(objInventoryMenuItemObjectsArray))
				; 	DebugMessage("Debug: objItemObject isExists = " + JValue.isExists(objItemObject) + "; count = " + JValue.count(objItemObject) + "; JMap.count = " + JMap.count(objItemObject) + "; objectType = " + JMap.getInt(objItemObject, "objectType") + "; itemName" + JMap.getStr(objItemObject, "itemName") + "; itemForm = " + JMap.getForm(objItemObject, "itemForm") + "; itemID = " + JMap.getInt(objItemObject, "itemID"))
					itemObjectType = JMap.getInt(objItemObject, "objectType")
					if (itemObjectType == AHMain.kEquipSetObject)
						objEquipSetItem = objItemObject
						DebugMessage("OptionMenuAccept(): equipset object selected = " + objEquipSetItem + "(" + JMap.getStr(objEquipSetItem, "name") + ")", debugLevels_kNotice)
						if EquipSetContainsEquipSetItem(objCurrentEquipSet, objEquipSetItem, true)
							ShowMessage("Cannot add EquipSet " + JMap.getStr(objEquipSetItem, "name") + " because it contains (or one of its EquipSets contains) the current EquipSet (cyclic dependencies create infinite loops and are not allowed).", false, "Cancel")
						else
							inventoryListMenuOptionIDArrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
							AHMain.SetEquipSetWornItem(objCurrentEquipSet, objEquipSetItem, inventoryListMenuOptionIDArrayIndex, false)
						endIf
					elseif (itemObjectType == AHMain.kInventoryItemObject)
						objInventoryItem = objItemObject
						DebugMessage("OptionMenuAccept(): inventory item selected = " + objInventoryItem + "(" + JMap.getStr(objInventoryItem, "itemDisplayName") + ")", debugLevels_kNotice)
						inventoryListMenuOptionIDArrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
						AHMain.SetEquipSetWornItem(objCurrentEquipSet, objInventoryItem, inventoryListMenuOptionIDArrayIndex, false)
					endIf
				; endIf
			endIf
			doItemSort = true
		endIf
	elseif (EquipSetPage_OptionIDType == EquipSetPage_kAddItemsMenu); add selection to end of list (replace addItems menu button with this item)
		askToReplaceAllItemsOnSwitch = false ; adding an item, not replacing
		int i
		int arraySize
		bool addSelectedInventoryItem = false
		if menuItemString == EquipSetItem_kCancel ; Cancel; Do nothing
			DebugMessage("OptionMenuAccept(): cancelInventoryMenuItem selected", debugLevels_kNotice)
			;
		elseif menuItemString == EquipSetItem_kAddAllItems
			i = 0
			arraySize = JArray.count(objInventoryMenuItemObjectsArray)
			doItemSort = true
			addSelectedInventoryItem = true
			DebugMessage("OptionMenuAccept(): addAllInventoryMenuItem selected", debugLevels_kNotice)
		elseif menuItemString == EquipSetItem_kAddEquipSet
			; Do AddEquipSet menus
			DebugMessage("OptionMenuAccept(): addEquipSetMenuItem selected", debugLevels_kNotice)
			int objMenuItem = AHMain.GetEquipSetFromList("Add EquipSet:", 0, 0, includeCancel = true, includeBack = false, includeHotkeyGroups = true, includeFindEquipSet = true)
			objEquipSetItem = JMap.getObj(objMenuItem, "equipSet")
			DebugMessage("OptionMenuAccept(): GetEquipSetFromList() = " + objEquipSetItem + "(" + JMap.getStr(objEquipSetItem, "name") + ")", debugLevels_kNotice)
			if objEquipSetItem
				if EquipSetContainsEquipSetItem(objEquipSetItem, objCurrentEquipSet, true)
					ShowMessage("Cannot add EquipSet " + JMap.getStr(objEquipSetItem, "name") + " because it contains (or one of its EquipSets contains) the current EquipSet (cyclic dependencies create infinite loops and are not allowed).", false, "Cancel")
				else
					AHMain.AddEquipSetWornItem(objCurrentEquipSet, objEquipSetItem)
				endIf
			endIf
		elseif menuItemString == EquipSetItem_kFindItem
			DebugMessage("OptionMenuAccept(): kFindItem selected", debugLevels_kNotice)
			int objInventoryItemToKeep = AHMain.GetInventoryItemFromItemsArrayIndex(objFormArray, inventoryListMenuOptionIDArrayIndex)
			int objEquipSetItems = JLua.evalLuaObj("return AH_Hotkeys.GetEquipSetItems(args.objCurrentEquipSet, args.recurseIntoSubEquipSets)", JLua.setObj("objCurrentEquipSet", objCurrentEquipSet, JLua.setInt("recurseIntoSubEquipSets", 0)))
			itemTypeFilterBits = AHMain.kArmorType + AHMain.kAmmoType + AHMain.kScrollType + AHMain.kPotionType + AHMain.kIngredientType + AHMain.kFoodType + AHMain.kPoisonType + AHMain.kOtherType
			objMenuList = AHMain.FindAndGetInventoryItemFromList("Add Inventory Item:", itemTypeFilterBits, objEquipSetItems, objInventoryItemToKeep)
			objInventoryItem = JMap.getObj(objMenuList, "objInventoryItem")
			DebugMessage("OptionMenuAccept(): item selected = " + JMap.getStr(objInventoryItem, "itemDisplayName"), debugLevels_kNotice)
			AHMain.AddEquipSetWornItem(objCurrentEquipSet, objInventoryItem)
		else ; add selected item
			i = menuIndex - EquipSetItem_listOffset
			arraySize = i + 1 ; only process 1 item in the loop below
			addSelectedInventoryItem = true
			DebugMessage("OptionMenuAccept(): add item selected: item " + i, debugLevels_kDebug)
		endIf
		; DebugMessage("menuIndex == addAllInventoryMenuItem; arraySize = " + arraySize)
		if addSelectedInventoryItem
			while i < arraySize
				itemDataType = JArray.valueType(objInventoryMenuItemObjectsArray, i)
				if itemDataType == AHUtils.kFormDataType
					itemForm = JArray.getForm(objInventoryMenuItemObjectsArray, i)
					if itemForm
						; objInventoryItem = JFormMap.getObj(AHMain.objItemFormCache, itemForm)
						objInventoryItem = AHMain.AddItemToCache(itemForm, 0)
						DebugMessage("OptionMenuAccept(): form selected = " + itemForm + "(" + JMap.getStr(objInventoryItem, "itemDisplayName") + ")", debugLevels_kDebug)
						; DebugMessage("addAllInventoryMenuItems: item to add = " + JMap.getStr(objInventoryItem, "itemName"))
						AHMain.AddEquipSetWornItem(objCurrentEquipSet, objInventoryItem)
					endIf
				else ;if itemDataType == AHUtils.kJObjectDataType
					objItemObject = JArray.getObj(objInventoryMenuItemObjectsArray, i)
					itemObjectType = JMap.getInt(objItemObject, "objectType")
					if (itemObjectType == AHMain.kEquipSetObject)
						objEquipSetItem = objItemObject
						DebugMessage("OptionMenuAccept(): equipset object selected = " + objEquipSetItem + "(" + JMap.getStr(objEquipSetItem, "name") + ")", debugLevels_kDebug)
						; if EquipSetContainsEquipSetItem(objCurrentEquipSet, objEquipSetItem, true)
						if EquipSetContainsEquipSetItem(objEquipSetItem, objCurrentEquipSet, true)
							ShowMessage("Cannot add EquipSet " + JMap.getStr(objEquipSetItem, "name") + " because it contains (or one of its EquipSets contains) the current EquipSet (cyclic dependencies create infinite loops and are not allowed).", false, "Cancel")
						else
							AHMain.AddEquipSetWornItem(objCurrentEquipSet, objEquipSetItem)
						endIf
					elseif (itemObjectType == AHMain.kInventoryItemObject)
						objInventoryItem = objItemObject
						DebugMessage("OptionMenuAccept(): inventory item selected = " + objInventoryItem + "(" + JMap.getStr(objInventoryItem, "itemDisplayName") + ")", debugLevels_kDebug)
						AHMain.AddEquipSetWornItem(objCurrentEquipSet, objInventoryItem)
					endIf
				endIf
				i += 1
			EndWhile
		endIf
	elseif (EquipSetPage_OptionIDType == EquipSetPage_kAutoAddMenu)
		if menuItemString == EquipSetItem_kCancel ; Cancel; Do nothing
			DebugMessage("OptionMenuAccept(EquipSetPage_kAutoAddMenu): kCancel selected", debugLevels_kNotice)
		elseif menuItemString == EquipSetItem_kEdit
			int objAutoAddItemArray = JMap.getObj(objCurrentEquipSet, "autoAddItemArray")
			int autoAddListIndex = JArray.findInt(objAutoAddListMenuOptionIDArray, optionID)
			; int objAutoAddItem = JArray.getObj(objAutoAddItemArray, autoAddListIndex)
			AHMgr.EditAutoAddItemInEquipSet(objCurrentEquipSet, autoAddListIndex)
			DebugMessage("OptionMenuAccept(EquipSetPage_kAutoAddMenu): AHMgr.EditAutoAddItemInEquipSet finished.", debugLevels_kDebug)
		elseif menuItemString == EquipSetItem_kDelete
			int objAutoAddItemArray = JMap.getObj(objCurrentEquipSet, "autoAddItemArray")
			int autoAddListIndex = JArray.findInt(objAutoAddListMenuOptionIDArray, optionID)
			int objAutoAddItem = JArray.getObj(objAutoAddItemArray, autoAddListIndex)
			JMap.clear(objAutoAddItem)
			JArray.eraseIndex(objAutoAddItemArray, autoAddListIndex)
			objAutoAddItem = JValue.release(objAutoAddItem)
		elseif menuItemString == EquipSetItem_kDeleteAll
			EquipSetRemoveAllAutoAddItems()
		endIf
	endIf
	itemForm = JMap.getForm(objInventoryItem, "itemForm")
	form curEquipSetItemForm = JMap.getForm(objCurrentEquipSetInventoryItem, "itemForm")
	if askToReplaceAllItemsOnSwitch && curEquipSetItemForm && objCurrentEquipSetInventoryItem && itemForm && objInventoryItem
		DebugMessage("askToReplaceAllItemsOnSwitch = " + askToReplaceAllItemsOnSwitch + "; objCurrentEquipSetInventoryItem = " + objCurrentEquipSetInventoryItem + "; objInventoryItem = " + objInventoryItem, debugLevels_kDebug)
		if !jLua.evalLuaInt("return AH_Hotkeys.CompareInventoryItems(args.objItem1, args.objItem2)", jLua.setObj("objItem1",objCurrentEquipSetInventoryItem,jLua.setObj("objItem2", objInventoryItem, 0)))
			int objFoundEquipSetArray = AHMain.FindItemInAllEquipSets(objCurrentEquipSetInventoryItem, true, true, true)
			int arraySize = JArray.count(objFoundEquipSetArray)
			string equipSetNames
			int objFoundEquipSet
			DebugMessage("askToReplaceAllItemsOnSwitch: objFoundEquipSetArray arraySize = " + arraySize, debugLevels_kDebug)
			if arraySize > 0
				int i = 0
				While i < arraySize
					objFoundEquipSet = JArray.getObj(objFoundEquipSetArray, i)
					equipSetNames = equipSetNames + JMap.getStr(objFoundEquipSet, "name") + "\n"
					i += 1
				EndWhile
				if ShowMessage("The following EquipSets contain the item \"" + JMap.getStr(objCurrentEquipSetInventoryItem, "itemDisplayName") + "\":\n" + equipSetNames + "Replace with item \"" + JMap.getStr(objInventoryItem, "itemDisplayName") + "\" in all EquipSets?", true, "Replace All", "Cancel")
					AHMain.ReplaceItemInAllEquipSets(objFoundEquipSetArray, objCurrentEquipSetInventoryItem, objInventoryItem)
				endIf
			endIf
			JValue.release(objFoundEquipSetArray)
		endIf
	endIf
	if doItemSort
		int currentSort = JMap.getInt(objCurrentEquipSet, "itemSortOrder")
		if (currentSort == kSortMenuItem_HighestToLowestMagicEffect) || (currentSort == kSortMenuItem_LowestToHighestMagicEffect)
			SortByEffectMagnitude(objCurrentEquipSet)
		endIf
	endIf
	JValue.release(objMenuList)
	ForcePageReset()
EndFunction

string function OnOptionHighlight_EquipSetPageItemControls(int optionID)
	int i
	string itemName
	int itemType
	int numItems
	int objEquipSet
	int objFormArray
	int equipSetFormArrayIndex
	int dataType
	int itemObjectType
	form itemForm
	int itemHash
	int objInventoryItem
	int objItemObject
	string numItemsText
	string itemTypeText
	string magicEffectsText
	string manaCostText
	int itemSlotMask
	string itemSlotMaskText
	int inventoryArraySize
	int arrayIndex
	; DebugMessage("OnOptionHighlight_EquipSetPage()")
	; if (optionID == rightHandMenuID) || (optionID == leftHandMenuID) || (optionID == shoutPowerMenuID)
	; 	dataType = AHUtils.kFormDataType
	; DebugMessage("OptionID="+optionID+"; find optionID in objInventoryListMenuOptionIDArray="+JArray.findInt(objInventoryListMenuOptionIDArray, optionID))
	if (optionID == leftHandMenuID) || (optionID == rightHandMenuID)
		EquipSetPage_OptionIDType = EquipSetPage_kHandMenu
	elseif (optionID == shoutPowerMenuID)
		EquipSetPage_OptionIDType = EquipSetPage_kShoutMenu
	elseif JMap.getInt(objCurrentEquipSet, "showAutoAddItems") && JArray.findInt(objAutoAddListMenuOptionIDArray, optionID) != -1
		; arrayIndex = JArray.findInt(objAutoAddListMenuOptionIDArray, optionID)
		; if arrayIndex != -1
			EquipSetPage_OptionIDType = EquipSetPage_kAutoAddMenu
			; DebugMessage("OptionID="+optionID+"; arrayIndex="+arrayIndex+"; OptionIDType = EquipSetPage_kAutoAddMenu.")
		; endIf
	elseif JArray.findInt(objInventoryListMenuOptionIDArray, optionID) != -1
		; arrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
		EquipSetPage_OptionIDType = EquipSetPage_kApparelMenu
		; DebugMessage("OptionID="+optionID+"; arrayIndex="+arrayIndex+"; OptionIDType = EquipSetPage_kApparelMenu.")
	elseif (optionID == addItemsMenuID)
		EquipSetPage_OptionIDType = EquipSetPage_kAddItemsMenu
	endIf
	if optionID == addItemsMenuID
		return "Add item to this EquipSet."
	endIf
	; DebugMessage("OptionID="+optionID+"; EquipSetPage_OptionIDType="+EquipSetPage_OptionIDType)
	; elseif inventoryArraySize > 0
	; 	equipSetFormArrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
	; 	objFormArray = JMap.getObj(objCurrentEquipSet, "formArray")
	; 	dataType = JArray.valueType(objFormArray, equipSetFormArrayIndex)
	; else
	; 	return
	; endIf
	; if dataType == AHUtils.kFormDataType
	if (EquipSetPage_OptionIDType == EquipSetPage_kHandMenu) || (EquipSetPage_OptionIDType == EquipSetPage_kShoutMenu)
		if (optionID == rightHandMenuID)
			objInventoryItem = AHMain.GetEquipSetHandInventoryItem(objCurrentEquipSet, kRightHand)
			if objInventoryItem
				itemForm = JMap.getForm(objInventoryItem, "itemForm")
			else
				return "Add item to the right hand slot."
			endIf
		elseif (optionID == leftHandMenuID)
			objInventoryItem = AHMain.GetEquipSetHandInventoryItem(objCurrentEquipSet, kLeftHand)
			if objInventoryItem
				itemForm = JMap.getForm(objInventoryItem, "itemForm")
			else
				return "Add item to the left hand slot."
			endIf
		elseif (optionID == shoutPowerMenuID)
			itemForm = JMap.getForm(objCurrentEquipSet, "shoutForm")
			if itemForm
				; objInventoryItem = JFormMap.getObj(AHMain.objItemFormCache, itemForm)
				objInventoryItem = AHMain.AddItemToCache(itemForm, 0)
			else
				return "Add shout or power."
			endIf
		endIf
	elseif EquipSetPage_OptionIDType == EquipSetPage_kApparelMenu ; apparel inventory item
		inventoryArraySize = JArray.count(objInventoryListMenuOptionIDArray)
		if inventoryArraySize > 0
			equipSetFormArrayIndex = JArray.findInt(objInventoryListMenuOptionIDArray, optionID)
			objItemObject = AHMain.GetEquipSetWornItem(objCurrentEquipSet, equipSetFormArrayIndex)
			itemObjectType = JMap.getInt(objItemObject, "objectType")
			if itemObjectType == AHMain.kInventoryItemObject
				objInventoryItem = objItemObject
				itemForm = JMap.getForm(objInventoryItem, "itemForm")
			elseif itemObjectType == AHMain.kEquipSetObject
				objEquipSet = objItemObject
			else
				return "Invalid item."
			endIf
		endIf
	elseif EquipSetPage_OptionIDType == EquipSetPage_kAutoAddMenu
		int objAutoAddItemArray = JMap.getObj(objCurrentEquipSet, "autoAddItemArray")
		int autoAddListIndex = JArray.findInt(objAutoAddListMenuOptionIDArray, optionID)
		int objAutoAddItem = JArray.getObj(objAutoAddItemArray, autoAddListIndex)
		int autoAddItemType = JMap.getInt(objAutoAddItem, "autoAddItemType")
		itemTypeText = AHMain.GetItemTypeText(autoAddItemType)
		if autoAddItemType != AHMain.kFoodType
			itemTypeText + "s"
		endIf
		int objItemMagicEffectNameArray = JMap.getObj(objAutoAddItem, "itemMagicEffectNameArray")
		string autoAddItemEffectsString = JLua.evalLuaStr("return AH_Hotkeys.ConcatJArrayToString(args.inputJArray, ',')", JLua.setObj("inputJArray", objItemMagicEffectNameArray))
		string exactMatchAll = JMap.getInt(objAutoAddItem, "exactMatchAll")
		return "Auto add "+itemTypeText+" with magic effects: " + autoAddItemEffectsString + "; exactMatch = " + exactMatchAll
	endIf
	if objInventoryItem
		itemName = JMap.getStr(objInventoryItem, "itemDisplayName")
		itemType = JMap.getInt(objInventoryItem, "itemType")
		itemHash = JMap.getInt(objInventoryItem, "itemHash")
		numItems = playerREF.GetItemCount(itemForm)
		int actualItemType = JMap.getInt(objInventoryItem, "actualItemType")
		itemTypeText = AHMain.GetItemTypeText(actualItemType)
		; DebugMessage("OnOptionHighlight(): actualItemType = " + actualItemType + "; itemTypeText = " + itemTypeText)
		if JMap.hasKey(objInventoryItem, "itemMagicEffectNameArray")
			string magicEffectNamesString
			int objMagicEffectNameArray = JMap.getObj(objInventoryItem, "itemMagicEffectNameArray")
			int objItemMagicEffectMagnitudeArray = JMap.getObj(objInventoryItem, "itemMagicEffectMagnitudeArray")
			while i < JArray.count(objMagicEffectNameArray)
				if ((actualItemType == AHMain.kIngredientType) && !(itemForm as ingredient).GetIsNthEffectKnown(i))
					; skip if item is an ingredient and the magic effect isn't known to the player.
				else
					magicEffectNamesString = magicEffectNamesString + ", " + JArray.getStr(objMagicEffectNameArray, i)
					if objItemMagicEffectMagnitudeArray != 0
						magicEffectNamesString = magicEffectNamesString + " (+" + JArray.getInt(objItemMagicEffectMagnitudeArray, i) + ")"
					endIf
				endIf
				i += 1
			EndWhile
			magicEffectNamesString = StringUtil.Substring(magicEffectNamesString, 1)
			if magicEffectNamesString != ""
				if (itemType == kArmor) || (itemType == kWeapon)
					magicEffectsText = " with enchantments: " + magicEffectNamesString
				else
					magicEffectsText = " with magic effects: " + magicEffectNamesString
				endIf
			endIf
		endIf
		if (itemType!= kSpell) && (itemType!= kShout)
			numItemsText = " (" + numItems + ")"
			if itemType == kArmor
				itemSlotMask = JMap.getInt(objInventoryItem, "itemSlotMask")
				itemSlotMaskText = " (slotmask " + itemSlotMask + ")"
			endIf
		endIf
		; if itemType == kSpell
			; itemForm = JMap.getForm(objInventoryItem, "itemForm")
			; int manaCost =  (itemForm as spell).GetEffectiveMagickaCost(playerREF)
			; manaCostText = ", mana cost = " + manaCost
		; endIf
		int itemEquipSlotType = JMap.getInt(objInventoryItem, "itemEquipSlotType")
		int itemID = JMap.getInt(objInventoryItem, "itemID")
		string specificItemText
		if itemID
			specificItemText = " (specific itemID = " + itemID + ") "
		endIf
		int itemFormID = JMap.getInt(objInventoryItem, "itemFormID")
		string itemFormText = " ; Form:" + itemForm
		string itemFormIDText = " ; FormID: " + itemFormID + " (" + Game.GetFormEx(itemFormID) + ")"
		string itemHashText = " ; itemHash: " + itemHash
		string equipSlotTypeText = ", equip slot: " + itemEquipSlotType
		return itemName + specificItemText + " of type " + itemTypeText + numItemsText + itemSlotMaskText + magicEffectsText + equipSlotTypeText + itemFormText + itemFormIDText + itemHashText
	elseif objEquipSet
		; objEquipSet = JArray.getObj(objFormArray, equipSetFormArrayIndex)
		itemName = JMap.getStr(objEquipSet, "name")
		numItems = AHMain.CountItemsInEquipSet(objEquipSet)
		int hotkeyGroupID = JMap.getInt(objEquipSet, "hotkeyGroupID")
		string hotkeyGroupText = AHMgr.GetHotkeyGroupTextFromID(hotkeyGroupID)
		itemTypeText = AHMain.GetItemTypeText(AHMain.kEquipSetType)
		if numItems == 1
			numItemsText = " item)"
		else
			numItemsText = " items)"
		endIf
		return itemName + " of type " + itemTypeText + " (contains " + numItems + numItemsText
	endIf
	return ""
endFunction



bool Function EquipSetContainsEquipSetItem(int objEquipSet, int objEquipSetItemToMatch, bool recursiveSearch)
	int objEquipSetItem
	int i
	int itemDataType
	form itemForm
	int objFormArray = JMap.getObj(objEquipSet, "formArray")
	int arraySize = JArray.count(objFormArray)
	int startIndex = 0
	int foundIndex = 0
	; int objItemTypeArray = JArray.object()
	; i = 0
	; while i < arraySize
	; 	itemDataType = JArray.valueType(objFormArray, i)
	; 	if itemDataType == AHUtils.kFormDataType
	; 		JArray.addInt(objItemTypeArray, AHUtils.kFormDataType)
	; 	else
	; 		JArray.addInt(objItemTypeArray, AHUtils.kJObjectDataType)
	; 	endIf
	; 	i += 1
	; EndWhile
	; startIndex = 0
	; while (foundIndex >= 0) && (startIndex < arraySize)
	; 	foundIndex = JArray.findInt(objItemTypeArray, AHUtils.kJObjectDataType, startIndex)
	; 	; DebugMessage("EquipSetContainsEquipSetItem(): kEquipSetType foundIndex = " + foundIndex)
	; 	if foundIndex >= 0
	; 		objEquipSetItem = JArray.getObj(objFormArray, foundIndex)
	; 		if objEquipSetItem == objEquipSetItemToMatch
	; 			return true
	; 		elseif recursiveSearch
	; 			if EquipSetContainsEquipSetItem(objEquipSetItem, objEquipSetItemToMatch, true)
	; 				return true
	; 			endIf
	; 		endIf
	; 		startIndex = foundIndex + 1
	; 	endIf
	; EndWhile
	if objEquipSetItemToMatch == objEquipSet
		return true
	endIf
	if !objEquipSet || !objEquipSetItemToMatch
		return false
	endIf
	while (foundIndex >= 0) && (startIndex < arraySize) ; LOOK AT THIS.
		if arraySize > 0
			foundIndex = JValue.evalLuaInt(objFormArray, "return AH_Hotkeys.FindIndex(jobject, function(x) return x.objectType == " + AHMain.kEquipSetObject + " end, " + startIndex + ", " + AHUtils.kJObjectDataType + ", " + AHMain.kEquipSetObject + ", debugTag9)", -1) ; in JC 3.2+ only.
			DebugMessage("EquipSetContainsEquipSetItem(): evalLuaInt x.objectType == kEquipSetObject; foundIndex = " + foundIndex)
		endIf
		if foundIndex >= 0
			objEquipSetItem = JArray.getObj(objFormArray, foundIndex)
			if objEquipSetItem == objEquipSetItemToMatch
				return true
			elseif recursiveSearch
				if EquipSetContainsEquipSetItem(objEquipSetItem, objEquipSetItemToMatch, true)
					return true
				endIf
			endIf
			startIndex = foundIndex + 1
		endIf
	EndWhile
	return false
EndFunction

;-------------------------------------MCM OPTION MENUS-------------------------------------

event OnOptionMenuOpen(int optionID)
	DebugMessage("OnOptionMenuOpen(): current page = " + CurrentPage + "; currentMCMPage = " + currentMCMPage)
	JArray.clear(objMenuListStringsArray)
	menuListDefaultIndex = 0
	if currentMCMPage == kEquipSetPageTitle
		OnOptionMenuOpen_EquipSetPage(optionID)
	elseif currentMCMPage == kMacroPageTitle
		OnOptionMenuOpen_MacroPage(optionID)
	endIf
	DebugMessage("OnOptionMenuOpen(): count of objMenuListStringsArray = " + JArray.count(objMenuListStringsArray))
	string[] menuListStringsArray = JArray.asStringArray(objMenuListStringsArray)
	SetMenuDialogStartIndex(menuListDefaultIndex)
	SetMenuDialogDefaultIndex(menuListDefaultIndex)
	SetMenuDialogOptions(menuListStringsArray)
endEvent

event OnOptionMenuAccept(int optionID, int menuIndex)
	DebugMessage("OnOptionMenuAccept(): current page = " + CurrentPage + "; currentMCMPage = " + currentMCMPage)
	if currentMCMPage == kEquipSetPageTitle
		OnOptionMenuAccept_EquipSetPage(optionID, menuIndex)
	elseif currentMCMPage == kMacroPageTitle
		OnOptionMenuAccept_MacroPage(optionID, menuIndex)
	endIf
EndEvent

event OnOptionHighlight(int optionID)
	; DebugMessage("OnOptionHighlight(): current page = " + CurrentPage + "; currentMCMPage = " + currentMCMPage)
	string infoText
	if currentMCMPage == kEquipSetPageTitle
		infoText = OnOptionHighlight_EquipSetPage(optionID)
	elseif currentMCMPage == kMacroPageTitle
		infoText = OnOptionHighlight_MacroPage(optionID)
	endIf
	SetInfoText(infoText)
endEvent

event OnOptionSelect(int optionID) ; for overflow of states when using the state-based options (apparently, there's a maximum number of states that can be used in any one script.)
	DebugMessage("OnOptionSelect(): current page = " + CurrentPage + "; currentMCMPage = " + currentMCMPage)
	if currentMCMPage == kEquipSetPageTitle
		OnOptionSelect_EquipSetPage(optionID)
	elseif currentMCMPage == kMacroPageTitle

	elseif currentMCMPage == kDevPageTitle
		OnOptionSelect_DevPage(optionID)
	endIf
endEvent


;---------------------MACRO FUNCTIONS ---------------------

function SetupMacroPage(int objMacro)
	if !AHMain.installed || !AHMain.active
		AddTextOptionST("UninstalledText", AHMain.modName + " is deactivated.", "", OPTION_FLAG_DISABLED)
		return
	endIf
	if !objMacro
		objMacro = JArray.getObj(AHMain.objMacroArray, 0)
	endIf
	string macroName
	if objMacro
		objCurrentMacro = objMacro
		macroName = JMap.getStr(objMacro, "name")
	endIf
	if !objBackupMacro
		BackupMacro(objMacro)
	endIf
	string functionDebugHeader = "SetupMacroPage(" + macroName + ")"
	string functionDebugSubline = "  " + functionDebugHeader + ": "
	DebugMessage(functionDebugHeader)
	lastHotKeyEditorMCMPage = kMacroPageTitle
	currentMCMPage = kMacroPageTitle

	SetCursorPosition(0)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddMenuOptionST("MacroPage_FileMenu", "File Menu...", "")
	AddMenuOptionST("MacroPage_OpenMenu", "Open Macro", macroName)
	AddTextOptionST("ExitMCMButton", "Close MCM", "")
	AddHeaderOption("")
	AddKeyMapOptionST("MacroPage_KeyMap", "Hot Key", JMap.getInt(objMacro, "hotKey"), OPTION_FLAG_WITH_UNMAP)
	AddToggleOptionST("MacroPage_AltToggle", "Alt Key", JMap.getInt(objMacro, "altKey") as bool)
	AddToggleOptionST("MacroPage_ControlToggle", "Control Key", JMap.getInt(objMacro, "controlKey") as bool)
	AddToggleOptionST("MacroPage_ShiftToggle", "Shift Key", JMap.getInt(objMacro, "shiftKey") as bool)
	AddHeaderOption("")
	AddToggleOptionST("MacroPage_NotifyWhenMacroExecuted", "Notify when run", JMap.getInt(objMacro, "notifyWhenMacroExecuted") as bool)
	AddToggleOptionST("MacroPage_ProcessKeyPresses", "Process key presses", JMap.getInt(objMacro, "processKeyPresses") as bool)
	AddToggleOptionST("MacroPage_WaitForEquipSets", "Wait for EquipSets to finish", JMap.getInt(objMacro, "waitForEquipSets") as bool)
	AddToggleOptionST("MacroPage_EnableInMenus", "Enable Macro in Menus", JMap.getInt(objMacro, "enableMacroInMenus") as bool)

	SetCursorPosition(1)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddMenuOptionST("MacroPage_OptionsMenu", "Options Menu...", "")
	AddTextOptionST("MacroPage_EditMacroScript", "Edit Macro Script", "")
	AddHeaderOption("Macro Script ")
	SetupMacroPage_MacroList(objMacro)
	AddMenuOptionST("MacroPage_AddMacroItem", "Add Macro Item...", "")
endFunction

int objMacroItemOptionIDArray
function SetupMacroPage_MacroList(int objMacro)
	int objMacroList = JMap.getObj(objMacro, "macroScript")
	if !objMacroItemOptionIDArray
		objMacroItemOptionIDArray = JArray.object()
		JValue.addToPool(objMacroItemOptionIDArray, JCTempPoolClearOnCloseMCM)
	else
		JArray.clear(objMacroItemOptionIDArray)
	endIf
	int mcmID
	int i = 0
	string macroKey
	string macroValue
	string macroPair
	string mcmText
	int arraySize = JArray.count(objMacroList)
	while i < arraySize
		macroPair = JArray.getStr(objMacroList, i)
		macroKey = JLua.evalLuaStr("return AH_Hotkeys.GetKeyFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
		macroValue = JLua.evalLuaStr("return AH_Hotkeys.GetValueFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
		if macroKey == "equipSet"
			int objItemObject = macroValue as int
			string equipSetName = JMap.getStr(objItemObject, "name")
			mcmText = macroKey + " = " + macroValue + " (" + equipSetName + ")"
		elseif macroKey == "macro"
			int objItemObject = macroValue as int
			string macroName = JMap.getStr(objItemObject, "name")
			mcmText = macroKey + " = " + macroValue + " (" + macroName + ")"
		elseif macroKey == "openMCMbyName"
			mcmText = macroKey + " = " + macroValue
		elseif (macroKey == "key") || (macroKey == "keyUp") || (macroKey == "keyDown")
			mcmText = macroKey + " = " + macroValue + " (" + AHUtils.GetKeyCodeFromString(macroValue) + ")"
		elseif (macroKey == "keyCode") || (macroKey == "keyCodeUp") || (macroKey == "keyCodeDown")
			mcmText = macroKey + " = " + macroValue + " (" + AHUtils.GetKeyStringFromKeyCode(macroValue as int) + ")"
		elseif macroKey != "end"
			mcmText = macroKey + " = " + macroValue
		else
			mcmText = macroKey
		endIf
		mcmID = AddMenuOption((i + 1) + ") " + mcmText, "")
		JArray.addInt(objMacroItemOptionIDArray, mcmID)
		i += 1
	EndWhile
	DebugMessage("SetupMacroPage_MacroList(): count of objMacroItemOptionIDArray = " + JArray.count(objMacroItemOptionIDArray))
endFunction

Function BackupMacro(int objMacro) ; backs up the Macro to the objMacroEquipSet variable
	DebugMessage("BackupMacro()")
	if objMacro == 0
		objBackupMacro = AHMgr.DeleteMacro(objBackupMacro)
	else
		objBackupMacro = AHMgr.DeleteMacro(objBackupMacro)
		objBackupMacro = AHMgr.NewMacroObject()
		AHMgr.CopyMacro(objMacro, objBackupMacro) ; backup Macro for revert menu item.
	endIf
EndFunction

int Function RestoreMacroFromBackup(int objMacro) ; backs up the Macro to the objBackupMacro variable
	if objBackupMacro
		AHMgr.CopyMacro(objBackupMacro, objMacro) ; copy backed up Macro to macro.
	endIf
EndFunction

Function ShowMacro(int objMacro)
	objPreviousMacro = objCurrentMacro
	objCurrentMacro = objMacro
	BackupMacro(objMacro) ; backup Macro
	ForcePageReset()
EndFunction

string Function GetNewMacroName()
	int nextMacroIndex = JArray.count(AHMain.objMacroArray)
	return ("Macro-" + (nextMacroIndex))
endFunction

int Function AddNewMacro()
	int objMacro = AHMgr.NewMacroObject()
	AHMgr.SaveMacro(objMacro)
	JMap.setStr(objMacro, "name", GetNewMacroName())
	return objMacro
EndFunction

Function DeleteMacroMenuItem()
	DebugMessage("DeleteMacroMenuItem()")
	int objMacro
	int foundIndex
	int newIndex
	int arraySize = JArray.count(AHMain.objMacroArray)
	if ShowMessage("Delete Macro \"" + JMap.getStr(objCurrentMacro, "name") + "\"?", true, "Delete", "Cancel")
		foundIndex = JArray.findObj(AHMain.objMacroArray, objCurrentMacro)
		if foundIndex >= 0
			JArray.eraseIndex(AHMain.objMacroArray, foundIndex)
			AHMgr.DeleteMacro(objCurrentMacro)
			if foundIndex > 0
				newIndex = foundIndex - 1
			else
				newIndex = 0
			endIf
			objMacro = JArray.getObj(AHMain.objMacroArray, newIndex)
			ShowMacro(objMacro)
		endIf
	endIf
EndFunction

function MacroPage_FileMenu()
endFunction
	int MacroPage_FileMenu_listOffset
	string MacroPage_FileMenu_kCancel = "(Cancel)"
	string MacroPage_FileMenu_kNew = "New Macro"
	string MacroPage_FileMenu_kRevert = "Revert Macro"
	string MacroPage_FileMenu_kRevertToOriginal = "Revert back to original"
	string MacroPage_FileMenu_kDuplicate = "Duplicate Macro"
	string MacroPage_FileMenu_kDelete = "Delete Macro"
	string MacroPage_FileMenu_kRename = "Rename Macro"
state MacroPage_FileMenu
	event OnMenuOpenST()
		DebugMessage("MacroPage_FileMenu()")
		; string[] fileMenuStringArray = new string[6]
		JArray.clear(objMenuListStringsArray)
		JArray.addStr(objMenuListStringsArray, MacroPage_FileMenu_kCancel)
		JArray.addStr(objMenuListStringsArray, MacroPage_FileMenu_kNew)
		if objCurrentMacro
			JArray.addStr(objMenuListStringsArray, MacroPage_FileMenu_kDuplicate)
			JArray.addStr(objMenuListStringsArray, MacroPage_FileMenu_kRevert)
			; if objCurrentMacro == AHMain.objOpenAHHotkeysMCMMacro
			; 	JArray.addStr(objMenuListStringsArray, MacroPage_FileMenu_kRevertToOriginal)
			; else
				JArray.addStr(objMenuListStringsArray, MacroPage_FileMenu_kDelete)
				JArray.addStr(objMenuListStringsArray, MacroPage_FileMenu_kRename)
			; endIf
		endIf
		string[] menuListStringsArray = JArray.asStringArray(objMenuListStringsArray)
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(1)
		SetMenuDialogOptions(menuListStringsArray)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("MacroPage_FileMenu(): menuIndex = " + menuIndex)
		string menuItemString = JArray.getStr(objMenuListStringsArray, menuIndex)
		string theText
		if menuItemString == MacroPage_FileMenu_kCancel
			return
		elseif menuItemString == MacroPage_FileMenu_kNew ; New
			int objNewMacro = AddNewMacro()
			ShowMacro(objNewMacro)
			theText = AHUtils.ShowUILibTextInput("Macro Name", JMap.getStr(objNewMacro, "name"))
			if theText
				JMap.setStr(objNewMacro, "name", theText)
				SetMenuOptionValueST(theText, false, "MacroPage_OpenMenu")
			endIf
		elseif menuItemString == MacroPage_FileMenu_kRevert ; Revert
			if ShowMessage("Revert this Macro back to last saved?", true, "Revert", "Cancel")
				RestoreMacroFromBackup(objCurrentMacro)
				ShowMacro(objCurrentMacro)
			endIf
		; elseif menuItemString == MacroPage_FileMenu_kRevertToOriginal ; Revert
		; 	if ShowMessage("Revert all changes back to original?", true, "Revert", "Cancel")
		; 		if objCurrentMacro == AHMain.objOpenAHHotkeysMCMMacro
		; 			AHMgr.CopyMacro(AHMain.objOpenAHHotkeysMCMMacro_Default, AHMain.objOpenAHHotkeysMCMMacro)
		; 		endIf
		; 		ShowMacro(objCurrentMacro)
		; 	endIf
		elseif menuItemString == MacroPage_FileMenu_kDuplicate ; Duplicate
			int objNewMacro = AHMgr.SaveAsMacro(objCurrentMacro)
			string macroName = GetNewMacroName()
			JMap.setStr(objNewMacro, "name", macroName)
			if JMap.getInt(objCurrentMacro, "protected")
				JMap.removeKey(objNewMacro, "protected")
			endIf
			ShowMacro(objNewMacro)
			theText = AHUtils.ShowUILibTextInput("Rename Duplicated Macro", JMap.getStr(objNewMacro, "name"))
			if theText
				JMap.setStr(objNewMacro, "name", theText)
				SetMenuOptionValueST(theText, false, "MacroPage_OpenMenu")
			endIf
		elseif menuItemString == MacroPage_FileMenu_kDelete ; Delete
			DeleteMacroMenuItem()
		elseif menuItemString == MacroPage_FileMenu_kRename ; Rename
			theText = AHUtils.ShowUILibTextInput("Rename Macro", JMap.getStr(objCurrentMacro, "name"))
			if theText
				JMap.setStr(objCurrentMacro, "name", theText)
				SetMenuOptionValueST(theText, false, "MacroPage_OpenMenu")
			endIf
		endIf
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("File Menu: New, Duplicate, Revert, Delete, Rename Macros")
	endEvent
endState

function MacroPage_OpenMenu()
endFunction
	int MacroPage_OpenMenu_kCancel
	int MacroPage_OpenMenu_listOffset
state MacroPage_OpenMenu
	event OnMenuOpenST()
		DebugMessage("MacroPage_OpenMenu()")
		int objMenuList = JArray.object()
		MacroPage_OpenMenu_listOffset = 0
		MacroPage_OpenMenu_kCancel = MacroPage_OpenMenu_listOffset
		JArray.addStr(objMenuList, "Cancel", MacroPage_OpenMenu_listOffset)
		MacroPage_OpenMenu_listOffset += 1
		int objTempStringArray = JLua.evalLuaObj("return AH_Hotkeys.BuildListFromJMapArray(args.objArray, args.key)", JLua.setObj("objArray", AHMain.objMacroArray, JLua.setStr("key", "name")))
		AHMain.PrintJObject(objTempStringArray, "objTempStringArray: ", debugLevels_kDebug)
		JArray.addFromArray(objMenuList, objTempStringArray)
		string[] menuList = JArray.asStringArray(objMenuList)

		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(1)
		SetMenuDialogOptions(menuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("MacroPage_OpenMenu(): menuIndex = " + menuIndex)
		string theText
		int macroArrayIndex
		int objMacro
		if menuIndex == MacroPage_OpenMenu_kCancel
			return
		else
			macroArrayIndex = menuIndex - MacroPage_OpenMenu_listOffset
			objMacro = JArray.getObj(AHMain.objMacroArray, macroArrayIndex)
			ShowMacro(objMacro)
		endIf
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("Open Macro Menu")
	endEvent
endState

function MacroPage_KeyMap()
endFunction
state MacroPage_KeyMap
    event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
    	DebugMessage("MacroPage_KeyMap(" + keyCode + ")")
    	int oldHotKey = JMap.getInt(objCurrentMacro, "hotKey")
		bool acceptKey = true
    	if (conflictControl != "") && (keyCode != -1)
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
        bool isAltKey = JMap.getInt(objCurrentMacro, "altKey") as bool
		bool isControlKey = JMap.getInt(objCurrentMacro, "controlKey") as bool
		bool isShiftKey = JMap.getInt(objCurrentMacro, "shiftKey") as bool
		bool isModifierKey4 = JMap.getInt(objCurrentMacro, "modifierKey4") as bool
		int keyCodeCombo = AHMain.GenerateHotkeyCombo(keyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if (keyCode != -1)
			if !CheckConflictingKeyCombo(keyCodeCombo)
				acceptKey = false
			endIf
		endIf
		if keyCode == oldHotKey
			DebugMessage("MacroPage_KeyMap(" + keyCode + "): keyCode same as previous. Exiting.")
			acceptKey = false
			return
		endIf
		if acceptKey
	        if oldHotKey
	        	AHMgr.UnregisterEquipSetHotKey(objCurrentMacro)
	        endIf
			JMap.setInt(objCurrentMacro, "hotKey", keyCode)
	        JMap.setInt(objCurrentMacro, "hotKeyCombo", keyCodeCombo)
	        SetKeyMapOptionValueST(keyCode)
	        AHMgr.RegisterMacroHotKey(objCurrentMacro)
		endIf
    endEvent

    event OnDefaultST()
        int keyCode = JMap.getInt(objCurrentMacro, "hotKey")
        SetKeyMapOptionValueST(keyCode)
    endEvent

    event OnHighlightST()
        SetInfoText("Set hot key for this Macro.")
    endEvent
endState

function MacroPage_AltToggle()
endFunction
state MacroPage_AltToggle
	event OnSelectST()
		int keyCode = JMap.getInt(objCurrentMacro, "hotKey")
		bool isAltKey = !(JMap.getInt(objCurrentMacro, "altKey") as bool)
		bool isControlKey = JMap.getInt(objCurrentMacro, "controlKey") as bool
		bool isShiftKey = JMap.getInt(objCurrentMacro, "shiftKey") as bool
		bool isModifierKey4 = JMap.getInt(objCurrentMacro, "modifierKey4") as bool
		int keyCodeCombo = AHMain.GenerateHotkeyCombo(keyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if keyCode > -1
			if !CheckConflictingKeyCombo(keyCodeCombo)
				return
			endIf
		endIf
		JMap.setInt(objCurrentMacro, "altKey", isAltKey as int)
		JMap.setInt(objCurrentMacro, "hotKeyCombo", keyCodeCombo)
		SetToggleOptionValueST(isAltKey)
		DebugMessage("MacroPage_AltToggle() = " + isAltKey)
	endEvent
	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "altKey") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent
	event OnHighlightST()
		SetInfoText("MacroPage_Toggle Alt key modifier for hotkey.")
	endEvent
endState

function MacroPage_ControlToggle()
endFunction
state MacroPage_ControlToggle
	event OnSelectST()
		int keyCode = JMap.getInt(objCurrentMacro, "hotKey")
		bool isAltKey = JMap.getInt(objCurrentMacro, "altKey") as bool
		bool isControlKey = !(JMap.getInt(objCurrentMacro, "controlKey") as bool)
		bool isShiftKey = JMap.getInt(objCurrentMacro, "shiftKey") as bool
		bool isModifierKey4 = JMap.getInt(objCurrentMacro, "modifierKey4") as bool
		int keyCodeCombo = AHMain.GenerateHotkeyCombo(keyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if keyCode > -1
			if !CheckConflictingKeyCombo(keyCodeCombo)
				return
			endIf
		endIf
		JMap.setInt(objCurrentMacro, "controlKey", isControlKey as int)
		JMap.setInt(objCurrentMacro, "hotKeyCombo", keyCodeCombo)
		SetToggleOptionValueST(isControlKey)
		DebugMessage("MacroPage_ControlToggle() = " + isControlKey)
	endEvent
	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "controlKey") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent
	event OnHighlightST()
		SetInfoText("MacroPage_Toggle Control key modifier for hotkey.")
	endEvent
endState

function MacroPage_ShiftToggle()
endFunction
state MacroPage_ShiftToggle
	event OnSelectST()
		int keyCode = JMap.getInt(objCurrentMacro, "hotKey")
		bool isAltKey = JMap.getInt(objCurrentMacro, "altKey")
		bool isControlKey = JMap.getInt(objCurrentMacro, "controlKey")
		bool isShiftKey = !JMap.getInt(objCurrentMacro, "shiftKey")
		bool isModifierKey4 = JMap.getInt(objCurrentMacro, "modifierKey4") as bool
		int keyCodeCombo = AHMain.GenerateHotkeyCombo(keyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if keyCode > -1
			if !CheckConflictingKeyCombo(keyCodeCombo)
				return
			endIf
		endIf
		JMap.setInt(objCurrentMacro, "shiftKey", isShiftKey as int)
		JMap.setInt(objCurrentMacro, "hotKeyCombo", keyCodeCombo)
		SetToggleOptionValueST(isShiftKey)
		DebugMessage("MacroPage_ShiftToggle() = " + isShiftKey)
	endEvent
	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "shiftKey") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent
	event OnHighlightST()
		SetInfoText("MacroPage_Toggle Shift key modifier for hotkey.")
	endEvent
endState

function MacroPage_ModifierKey4Toggle()
endFunction
state MacroPage_ModifierKey4Toggle
	event OnSelectST()
		int keyCode = JMap.getInt(objCurrentMacro, "hotKey")
		bool isAltKey = JMap.getInt(objCurrentMacro, "altKey")
		bool isControlKey = JMap.getInt(objCurrentMacro, "controlKey")
		bool isShiftKey = JMap.getInt(objCurrentMacro, "shiftKey")
		bool isModifierKey4 = !JMap.getInt(objCurrentMacro, "modifierKey4") as bool
		int keyCodeCombo = AHMain.GenerateHotkeyCombo(keyCode, isAltKey, isControlKey, isShiftKey, isModifierKey4)
		if keyCode > -1
			if !CheckConflictingKeyCombo(keyCodeCombo)
				return
			endIf
		endIf
		JMap.setInt(objCurrentMacro, "modifierKey4", isShiftKey as int)
		JMap.setInt(objCurrentMacro, "hotKeyCombo", keyCodeCombo)
		SetToggleOptionValueST(isShiftKey)
		DebugMessage("MacroPage_ModifierKey4Toggle() = " + isShiftKey)
	endEvent
	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "modifierKey4") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent
	event OnHighlightST()
		SetInfoText("MacroPage_Toggle modifier key 4.")
	endEvent
endState

function MacroPage_NotifyWhenMacroExecuted()
endFunction
state MacroPage_NotifyWhenMacroExecuted
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "notifyWhenMacroExecuted") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentMacro, "notifyWhenMacroExecuted", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("MacroPage_NotifyWhenMacroExecuted() = " + toggleVal)
	endEvent
	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "notifyWhenMacroExecuted") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent
	event OnHighlightST()
		SetInfoText("If checked, prints name of Macro when run.")
	endEvent
endState

function MacroPage_ProcessKeyPresses()
endFunction
state MacroPage_ProcessKeyPresses
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "processKeyPresses") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentMacro, "processKeyPresses", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("MacroPage_ProcessKeyPresses() = " + toggleVal)
	endEvent
	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "processKeyPresses") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent
	event OnHighlightST()
		SetInfoText("If checked, AH Hotkeys will process macro key presses further (e.g. by running other macros or equipsets).")
	endEvent
endState

function MacroPage_WaitForEquipSets()
endFunction
state MacroPage_WaitForEquipSets
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "waitForEquipSets") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentMacro, "waitForEquipSets", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("MacroPage_WaitForEquipSets() = " + toggleVal)
	endEvent
	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "waitForEquipSets") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent
	event OnHighlightST()
		SetInfoText("If checked, EquipSets will finish executing before proceeding to the next macro item.")
	endEvent
endState

function MacroPage_EnableInMenus()
endFunction
state MacroPage_EnableInMenus
	event OnSelectST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "enableMacroInMenus") as bool
		toggleVal = !toggleVal
		JMap.setInt(objCurrentMacro, "enableMacroInMenus", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("MacroPage_EnableInMenus() = " + toggleVal)
	endEvent
	event OnDefaultST()
		bool toggleVal = JMap.getInt(objCurrentMacro, "enableMacroInMenus") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent
	event OnHighlightST()
		SetInfoText("If checked, Macro is able to be run in menus (including the inventory and crafting menus). This overrides the Configuration setting to disable hotkeys in menus.")
	endEvent
endState

function MacroPage_OptionsMenu()
endFunction
	int MacroPage_OptionsMenu_kCancel
	int MacroPage_OptionsMenu_listOffset
	int MacroPage_OptionsMenu_kClearMacroList
state MacroPage_OptionsMenu
	event OnMenuOpenST()
		DebugMessage("MacroPage_OptionsMenu()")
		int objMenuList = JArray.object()
		MacroPage_OptionsMenu_listOffset = 0
		MacroPage_OptionsMenu_kCancel = MacroPage_OptionsMenu_listOffset
		JArray.addStr(objMenuList, "Cancel", MacroPage_OptionsMenu_listOffset)
		MacroPage_OptionsMenu_listOffset += 1
		MacroPage_OptionsMenu_kClearMacroList = MacroPage_OptionsMenu_listOffset
		JArray.addStr(objMenuList, "Clear Macro List", MacroPage_OptionsMenu_listOffset)
		MacroPage_OptionsMenu_listOffset += 1
		
		string[] menuList = JArray.asStringArray(objMenuList)

		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(1)
		SetMenuDialogOptions(menuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("MacroPage_OptionsMenu(): menuIndex = " + menuIndex)
		string theText
		int macroArrayIndex
		int objMacro
		if menuIndex == MacroPage_OptionsMenu_kCancel
			return
		elseif menuIndex == MacroPage_OptionsMenu_kClearMacroList
			int objMacroScript = JMap.getObj(objCurrentMacro, "macroScript")
			int objMacroKeys = JMap.getObj(objCurrentMacro, "macroKeys")
			int objMacroValues = JMap.getObj(objCurrentMacro, "macroValues")
			JArray.clear(objMacroScript)
			JArray.clear(objMacroKeys)
			JArray.clear(objMacroValues)
			ForcePageReset()
		endIf
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("Options Menu")
	endEvent
endState

function MacroPage_EditMacroScript()
endFunction
state MacroPage_EditMacroScript
	event OnSelectST()
		int macroScript = JMap.getObj(objCurrentMacro, "macroScript")
		string macroScriptText = JLua.evalLuaStr("return AH_Hotkeys.ConcatJArrayToString(args.inputJArray, args.delimiter)", JLua.setObj("inputJArray", macroScript, JLua.setStr("delimiter", ";")))
		DebugMessage("MacroPage_EditMacroScript() = " + macroScriptText)
		string newMacroScriptString = AHUtils.ShowUILibTextInput("Edit Macro Script", macroScriptText)
		if newMacroScriptString
			AHMgr.CompileMacroFromString(objCurrentMacro, newMacroScriptString)
		endIf
		ForcePageReset()
	endEvent
	event OnHighlightST()
		SetInfoText("Directly edit the script for this macro.")
	endEvent
endState

;-------------------------------------MACRO OPTION MENUS-------------------------------------

string MacroPage_MacroItems_kCancel = "(Cancel)"
string MacroPage_MacroItems_kMoveUp = "Move Up"
string MacroPage_MacroItems_kMoveDown = "Move Down"
string MacroPage_MacroItems_kEditKey = "Edit Key"
string MacroPage_MacroItems_kEditValue = "Edit Value"
string MacroPage_MacroItems_kEditText = "Edit Text"
string MacroPage_MacroItems_kDuplicate = "Duplicate"
string MacroPage_MacroItems_kDelete = "Delete"

function OnOptionMenuOpen_MacroPage(int optionID)
	DebugMessage("OnOptionMenuOpen_MacroPage()")
	JArray.clear(objMenuListStringsArray)
	JArray.addStr(objMenuListStringsArray, MacroPage_MacroItems_kCancel)
	JArray.addStr(objMenuListStringsArray, MacroPage_MacroItems_kMoveUp)
	JArray.addStr(objMenuListStringsArray, MacroPage_MacroItems_kMoveDown)
	JArray.addStr(objMenuListStringsArray, MacroPage_MacroItems_kEditKey)
	JArray.addStr(objMenuListStringsArray, MacroPage_MacroItems_kEditValue)
	JArray.addStr(objMenuListStringsArray, MacroPage_MacroItems_kEditText)
	JArray.addStr(objMenuListStringsArray, MacroPage_MacroItems_kDuplicate)
	JArray.addStr(objMenuListStringsArray, MacroPage_MacroItems_kDelete)
	string[] menuListStringsArray = JArray.asStringArray(objMenuListStringsArray)
	SetMenuDialogStartIndex(0)
	SetMenuDialogDefaultIndex(0)
	SetMenuDialogOptions(menuListStringsArray)
endFunction

bool macroScriptWasChanged
function OnOptionMenuAccept_MacroPage(int optionID, int menuIndex)
	macroScriptWasChanged = false
	int objMacroScript = JMap.getObj(objCurrentMacro, "macroScript")
	int arraySize = JArray.count(objMacroScript)
	int index = JArray.findInt(objMacroItemOptionIDArray, optionID)
	string menuItemString = JArray.getStr(objMenuListStringsArray, menuIndex)
	DebugMessage("OnOptionMenuAccept_MacroPage(" + menuItemString + "): optionID = " + optionID + "; menuIndex = " + menuIndex + "; macroItem index = " + index, debugLevels_kDebug)
	if menuItemString == MacroPage_MacroItems_kCancel
		return
	elseif menuItemString == MacroPage_MacroItems_kMoveUp
		if index > 0
			JArray.swapItems(objMacroScript, index, index - 1)
			macroScriptWasChanged = true
		endIf
	elseif menuItemString == MacroPage_MacroItems_kMoveDown
		if index < (arraySize - 1)
			JArray.swapItems(objMacroScript, index, index + 1)
			macroScriptWasChanged = true
		endIf
	elseif menuItemString == MacroPage_MacroItems_kEditKey
		OnOptionMenuAccept_MacroPage_EditMacroItem(index, true, false)
	elseif menuItemString == MacroPage_MacroItems_kEditValue
		OnOptionMenuAccept_MacroPage_EditMacroItem(index, false, true)
	elseif menuItemString == MacroPage_MacroItems_kEditText
		OnOptionMenuAccept_MacroPage_EditMacroText(index)
	elseif menuItemString == MacroPage_MacroItems_kDuplicate
		string macroItemText = JArray.getStr(objMacroScript, index)
		JArray.addStr(objMacroScript, macroItemText, index + 1)
		macroScriptWasChanged = true
	elseif menuItemString == MacroPage_MacroItems_kDelete
		JArray.eraseIndex(objMacroScript, index)
		macroScriptWasChanged = true
	endIf
	if macroScriptWasChanged
		AHMgr.CompileMacro(objCurrentMacro)
		ForcePageReset()
	endIf
endFunction

; string EditMacroItem_lastMacroKey
; string EditMacroItem_lastMacroValue
; string EditMacroItem_prevMacroKey
; string EditMacroItem_prevMacroValue
string EditMacroItem_lastKeyDown
string EditMacroItem_lastKeyCodeDown
string EditMacroItem_lastMappedKeyDown

function OnOptionMenuAccept_MacroPage_EditMacroItem(int index, bool editKey, bool editValue)
	int objMacroScript = JMap.getObj(objCurrentMacro, "macroScript")
	string macroPair = JArray.getStr(objMacroScript, index)
	string macroKey = JLua.evalLuaStr("return AH_Hotkeys.GetKeyFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
	string macroValue = JLua.evalLuaStr("return AH_Hotkeys.GetValueFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
	string newMacroKey
	string newMacroValue
	string lastMacroKey = macroKey
	if editKey
		; EditMacroItem_prevMacroKey = EditMacroItem_lastMacroKey
		newMacroKey = OnOptionMenuAccept_MacroPage_EditKey(index)
		if (newMacroKey == macroKey) || (newMacroKey == "")
			return
		else
			if (editValue == false) && (((lastMacroKey == "key") || (lastMacroKey == "keyup") || (lastMacroKey == "keydown")) && ((newMacroKey == "key") || (newMacroKey == "keyup") || (newMacroKey == "keydown")))
				editValue = false
				JArray.setStr(objMacroScript, index, newMacroKey + "=" + macroValue)
				macroScriptWasChanged = true
			else
				editValue = true
			endIf
			; EditMacroItem_lastMacroKey = newMacroKey
			; editValue = true
		endIf
	endIf
	if editValue
		if newMacroKey == ""
			newMacroKey = macroKey
		endIf
		; EditMacroItem_prevMacroValue = EditMacroItem_lastMacroValue
		newMacroValue = MacroPage_MacroItems_EditValue(index, newMacroKey)
		if newMacroValue
			; EditMacroItem_lastMacroValue = newMacroValue
			JArray.setStr(objMacroScript, index, newMacroKey + "=" + newMacroValue)
			macroScriptWasChanged = true
		endIf
	endIf
endFunction

string function OnOptionMenuAccept_MacroPage_EditKey(int index)
	int objMacroScript = JMap.getObj(objCurrentMacro, "macroScript")
	string macroPair = JArray.getStr(objMacroScript, index)
	string macroKey = JLua.evalLuaStr("return AH_Hotkeys.GetKeyFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
	string macroValue = JLua.evalLuaStr("return AH_Hotkeys.GetValueFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
	DebugMessage("OnOptionMenuAccept_MacroPage_EditKey(): macroPair " + (index + 1) + " = " + macroPair)
	JArray.clear(objMenuListStringsArray)
	menuListDefaultIndex = 0
	string kCancel = "(Cancel)"
	JArray.addStr(objMenuListStringsArray, kCancel)
	JArray.addFromArray(objMenuListStringsArray, AHMain.objAllMacroKeysArray)
	string[] menuList = JArray.asStringArray(objMenuListStringsArray)
	int menuIndex = AHUtils.ShowUILibListMenu("Edit key " + (index + 1) + ": " + macroPair, menuList, 0, 0)
	string menuString = menuList[menuIndex]
	string returnString
	if menuString == kCancel
		return ""
	else
		string newMacroKey = menuString
		return newMacroKey
	endIf
endFunction

string function MacroPage_MacroItems_EditValue(int index, string newMacroKey)
	int objMacroScript = JMap.getObj(objCurrentMacro, "macroScript")
	string macroPair = JArray.getStr(objMacroScript, index)
	string macroKey = JLua.evalLuaStr("return AH_Hotkeys.GetKeyFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
	string macroValue = JLua.evalLuaStr("return AH_Hotkeys.GetValueFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
	DebugMessage("MacroPage_MacroItems_EditValue(): macroPair " + (index + 1) + " = " + macroPair + "; newMacroKey = " + newMacroKey)
	string newMacroValue
	string theText
	string defaultMacroValue
	if newMacroKey == macroKey
		defaultMacroValue = macroValue
	endIf
	if newMacroKey == "repeat"
		theText = AHUtils.ShowUILibTextInput("Repeat: how many times?", defaultMacroValue)
		if theText
			int newInt = theText as int
			newMacroValue = newInt
		endIf
	elseif newMacroKey == "end"
		newMacroValue = "end"
	elseif (newMacroKey == "key") || (newMacroKey == "keydown") || (newMacroKey == "keyup")
		if newMacroKey == "keyup"
			defaultMacroValue = EditMacroItem_lastKeyDown
		endIf
		theText = MacroPage_MacroItems_GetKeyStringFromList(newMacroKey + ": key to press", defaultMacroValue)
		if theText
			newMacroValue = theText
		endIf
	elseif (newMacroKey == "keycode") || (newMacroKey == "keycodedown") || (newMacroKey == "keycodeup")
		if newMacroKey == "keycodeup"
			defaultMacroValue = EditMacroItem_lastKeyCodeDown
		endIf
		theText = AHUtils.ShowUILibTextInput(newMacroKey + ": keycode to press", defaultMacroValue)
		if theText
			int newInt = theText as int
			newMacroValue = newInt
		endIf
	elseif (newMacroKey == "mappedkey") || (newMacroKey == "mappedkeydown") || (newMacroKey == "mappedkeyup")
		if newMacroKey == "mappedkeyup"
			defaultMacroValue = EditMacroItem_lastMappedKeyDown
		endIf
		int objMenuItem = GetMappedKeyFromList("Select Mapped Key:", defaultMacroValue, includeCancel = true, includeBack = false)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			;
		else
			newMacroValue = menuItemString
		endIf
	elseif (newMacroKey == "wait") || (newMacroKey == "macrokeydelay")
		theText = AHUtils.ShowUILibTextInput(newMacroKey + ": seconds (float)", defaultMacroValue)
		if theText
			float newFlt = theText as float
			newMacroValue = newFlt
		endIf
	elseif (newMacroKey == "waitformenu") || (newMacroKey == "stopifmenu")
		theText = MacroPage_MacroItems_GetUIMenuFromList(newMacroKey)
		if theText
			newMacroValue = theText
		endIf
	elseif newMacroKey == "equipset"
		int objMenuItem = AHMain.GetEquipSetFromList("Select EquipSet to add:", 0, objEquipSetArrayToList = 0, includeCancel = true, includeBack = false, includeHotkeyGroups = true, includeFindEquipSet = true)
		int objEquipSet = JMap.getObj(objMenuItem, "equipSet")
		if objEquipSet
			newMacroValue = objEquipSet
		endIf
	elseif newMacroKey == "macro"
		int objMenuItem = AHMain.GetMacroFromList("Select Macro to add:", 0, objMacroArrayToList = 0, includeCancel = true, includeBack = false, includeFindMacro = true)
		int objMacro = JMap.getObj(objMenuItem, "macro")
		if objMacro
			newMacroValue = objMacro
		endIf
	elseif newMacroKey == "openMCMbyName"
		int objMenuItem = AHMain.GetMCMModNameFromList("Select MCM mod:", includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString && (menuItemString != AHMain.kCancelMenuItemString)
			newMacroValue = menuItemString
		endIf
	endIf
	return newMacroValue
endFunction

string function MacroPage_MacroItems_GetKeyStringFromList(string menuTitleText, string defaultValue)
	int objKeyStringArray = JMap.getObj(AHUtils.objKeyMap, "keyStringArray")
	JArray.clear(objMenuListStringsArray)
	string kCancel = "(Cancel)"
	JArray.addStr(objMenuListStringsArray, kCancel)
	JArray.addFromArray(objMenuListStringsArray, objKeyStringArray)
	int defaultIndex
	if defaultValue != ""
		defaultIndex = JArray.findStr(objMenuListStringsArray, defaultValue)
		if defaultIndex == -1
			defaultIndex = 0
		endIf
	endIf
	string[] menuListStringsArray = JArray.asStringArray(objMenuListStringsArray)
	int menuIndex = AHUtils.ShowUILibListMenu(menuTitleText, menuListStringsArray, defaultIndex, 0)
	string menuString = JArray.getStr(objMenuListStringsArray, menuIndex)
	if menuString == kCancel
		return ""
	else
		return menuString
	endIf
endFunction

string function MacroPage_MacroItems_GetUIMenuFromList(string menuTitleText)
	JArray.clear(objMenuListStringsArray)
	string kCancel = "(Cancel)"
	string kAnyMenu = "Any Menu"
	string kNoMenu = "No Menu"
	JArray.addStr(objMenuListStringsArray, kCancel)
	JArray.addStr(objMenuListStringsArray, kAnyMenu)
	JArray.addStr(objMenuListStringsArray, kNoMenu)
	JArray.addFromArray(objMenuListStringsArray, AHMain.objUIMenuNameArray)
	string[] menuListStringsArray = JArray.asStringArray(objMenuListStringsArray)
	int menuIndex = AHUtils.ShowUILibListMenu(menuTitleText, menuListStringsArray, 0, 0)
	string menuString = JArray.getStr(objMenuListStringsArray, menuIndex)
	if menuString == kCancel
		return ""
	else
		return menuString
	endIf
endFunction

function OnOptionMenuAccept_MacroPage_EditMacroText(int index)
	DebugMessage("OnOptionMenuAccept_MacroPage_EditMacroText()", debugLevels_kNotice)
	int objMacroScript = JMap.getObj(objCurrentMacro, "macroScript")
	string macroItemText = JArray.getStr(objMacroScript, index)
	string newMacroItemText = AHUtils.ShowUILibTextInput("Edit Macro item text:", macroItemText)
	if newMacroItemText
		JArray.setStr(objMacroScript, index, newMacroItemText)
		macroScriptWasChanged = true
	endIf
	DebugMessage("OnOptionMenuAccept_MacroPage_EditMacroText(): newMacroNameText = " + newMacroItemText, debugLevels_kNotice)
endFunction

string function OnOptionHighlight_MacroPage(int optionID)
	int objMacroScript = JMap.getObj(objCurrentMacro, "macroScript")
	int index = JArray.findInt(objMacroItemOptionIDArray, optionID)
	string macroPair = JArray.getStr(objMacroScript, index)
	string macroKey = JLua.evalLuaStr("return AH_Hotkeys.GetKeyFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
	string macroValue = JLua.evalLuaStr("return AH_Hotkeys.GetValueFromPair(args.inputStr, args.delimiter)", JLua.setStr("inputStr", macroPair, JLua.setStr("delimiter", "=")))
	string infoText
	if macroKey == "repeat"
		infoText = "Repeat for " + macroValue + " times until the next 'end' statement or the end of the macro script."
	elseif macroKey == "end"
		infoText = "Ends the previous 'Repeat' statement."
	elseif macroKey == "key"
		infoText = "Tap key '" + macroValue + "' (key code " + AHUtils.GetKeyCodeFromString(macroValue) + ")"
	elseif macroKey == "keydown"
		infoText = "Press and hold down key '" + macroValue + "' (key code " + AHUtils.GetKeyCodeFromString(macroValue) + ")"
	elseif macroKey == "keyup"
		infoText = "Release key '" + macroValue + "' (key code " + AHUtils.GetKeyCodeFromString(macroValue) + ")"
	elseif macroKey == "keycode"
		infoText = "Tap key code " + macroValue + " (" + AHUtils.GetKeyStringFromKeyCode(macroValue as int) + ")"
	elseif macroKey == "keycodedown"
		infoText = "Hold down key code " + macroValue + " (" + AHUtils.GetKeyStringFromKeyCode(macroValue as int) + ")"
	elseif macroKey == "keycodeup"
		infoText = "Release key code " + macroValue + " (" + AHUtils.GetKeyStringFromKeyCode(macroValue as int) + ")"
	elseif macroKey == "mappedkey"
		int keyCode = Input.GetMappedKey(macroValue, kDeviceType_AutoDetect)
		infoText = "Tap mapped key '" + macroValue + "' (" + AHUtils.GetKeyStringFromKeyCode(keyCode) + ", key code " + keyCode + ")"
	elseif macroKey == "mappedkeydown"
		int keyCode = Input.GetMappedKey(macroValue, kDeviceType_AutoDetect)
		infoText = "Press and hold down mapped key '" + macroValue + "' (" + AHUtils.GetKeyStringFromKeyCode(keyCode) + ", key code " + keyCode + ")"
	elseif macroKey == "mappedkeyup"
		int keyCode = Input.GetMappedKey(macroValue, kDeviceType_AutoDetect)
		infoText = "Release mapped key '" + macroValue + "' (" + AHUtils.GetKeyStringFromKeyCode(keyCode) + ", key code " + keyCode + ")"
	elseif macroKey == "wait"
		infoText = "Wait for " + macroValue + " seconds."
	elseif macroKey == "waitformenu"
		infoText = "Wait for menu " + macroValue + " to open."
	elseif macroKey == "stopifmenu"
		infoText = "Stop and exit macro if menu " + macroValue + " is open."
	elseif macroKey == "keydelay"
		infoText = "Sets the delay between key presses to " + macroValue + " seconds."
	elseif macroKey == "equipset"
		int objItemObject = macroValue as int
		string equipSetName = JMap.getStr(objItemObject, "name")
		infoText = "Execute EquipSet " + macroValue + " (" + equipSetName + ")"
	elseif macroKey == "macro"
		int objItemObject = macroValue as int
		string macroName = JMap.getStr(objItemObject, "name")
		infoText = "Run Macro " + macroValue + " (" + macroName + ")"
	elseif macroKey == "openMCMbyName"
		infoText = "Open mod MCM menu: " + macroValue
	endIf
	return infoText
endFunction

function MacroPage_AddMacroItem()
endFunction
string MacroPage_AddMacroItem_kCancel = "(Cancel)"
state MacroPage_AddMacroItem
	event OnMenuOpenST()
		DebugMessage("MacroPage_AddMacroItem()")
		JArray.clear(objMenuListStringsArray)
		JArray.addStr(objMenuListStringsArray, MacroPage_AddMacroItem_kCancel)
		JArray.addFromArray(objMenuListStringsArray, AHMain.objAllMacroKeysArray)
		string[] menuList = JArray.asStringArray(objMenuListStringsArray)
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(1)
		SetMenuDialogOptions(menuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("MacroPage_AddMacroItem(): menuIndex = " + menuIndex)
		macroScriptWasChanged = false
		string menuItemString = JArray.getStr(objMenuListStringsArray, menuIndex)
		if menuItemString == MacroPage_AddMacroItem_kCancel
			return
		else
			int objMacroScript = JMap.getObj(objCurrentMacro, "macroScript")
			string macroKey = menuItemString
			JArray.addStr(objMacroScript, macroKey)
			int index = JArray.count(objMacroScript) - 1
			OnOptionMenuAccept_MacroPage_EditMacroItem(index, false, true)
		endIf
		if macroScriptWasChanged
			ForcePageReset()
		endIf
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("Add Macro Item")
	endEvent
endState

;---------------------CONFIGURATION PAGE FUNCTIONS ---------------------

int property favItemsProcessed auto hidden
int property favTotalSize auto hidden
int property favStepIncrementPercent = 5 autoreadonly
int property favSteppedPercent auto hidden
int property favOldSteppedPercent auto hidden
int property favRunningThreadCount auto hidden
bool property updateFavoritesThreadsStarted auto hidden
bool property updateFavoritesThreadsFinished auto hidden

function UpdateFavoritesEvent(bool filterWeaponFavorites = false, bool filterArmorFavorites = false, bool filterSpellFavorites = false)
	float startTime = Utility.GetCurrentRealTime()
	string filterString
	string theString
	if filterWeaponFavorites
		filterString = "+Weapons"
	endIf
	if filterArmorFavorites
		filterString = filterString + "+Armour"
	endIf
	if filterSpellFavorites
		filterString = filterString + "+Spells"
	endIf
	string functionDebugHeader = "UpdateFavoritesEvent()"
	string functionDebugSubline = "  " + functionDebugHeader + ": "
	DebugMessage(functionDebugHeader)
	int objInventoryItem
	form itemForm
	bool itemIsFavorited
	int i
	int arraySize
	if filterWeaponFavorites
		DebugMessage(functionDebugSubline + "weapons")
		int objWeaponArray = JValue.evalLuaObj(AHMain.objInventoryItemArray, "return jc.filter(jobject, function(x) return (x.actualItemType == " + AHMain.kWeaponType + ") or (x.actualItemType == " + AHMain.kShieldType + ") end)")
		arraySize = JArray.count(objWeaponArray)
		favTotalSize += arraySize
		i = 0
		while i < arraySize
			favItemsProcessed += 1
			favSteppedPercent = AHUtils.GetPercentProgress(favItemsProcessed, favTotalSize, favStepIncrementPercent)
			if favSteppedPercent != favOldSteppedPercent 
				theString = favSteppedPercent + "%"
				AHMain.UpdateMCMButtonStateProgress(theString, "")
				favOldSteppedPercent = favSteppedPercent
			endIf
			objInventoryItem = JArray.getObj(objWeaponArray, i)
			itemForm = JMap.getForm(objInventoryItem, "itemForm")
			itemIsFavorited = game.IsObjectFavorited(itemForm)
			JMap.setInt(objInventoryItem, "itemIsFavorited", itemIsFavorited as int)
			i += 1
		EndWhile
	endIf
	if filterArmorFavorites
		DebugMessage(functionDebugSubline + "armour")
		int objArmorArray = JValue.evalLuaObj(AHMain.objInventoryItemArray, "return jc.filter(jobject, function(x) return (x.actualItemType == " + AHMain.kArmorType + ") end)")
		arraySize = JArray.count(objArmorArray)
		favTotalSize += arraySize
		i = 0
		while i < arraySize
			favItemsProcessed += 1
			favSteppedPercent = AHUtils.GetPercentProgress(favItemsProcessed, favTotalSize, favStepIncrementPercent)
			if favSteppedPercent != favOldSteppedPercent 
				theString = favSteppedPercent + "%"
				AHMain.UpdateMCMButtonStateProgress(theString, "")
				favOldSteppedPercent = favSteppedPercent
			endIf
			objInventoryItem = JArray.getObj(objArmorArray, i)
			itemForm = JMap.getForm(objInventoryItem, "itemForm")
			itemIsFavorited = game.IsObjectFavorited(itemForm)
			JMap.setInt(objInventoryItem, "itemIsFavorited", itemIsFavorited as int)
			i += 1
		EndWhile
	endIf
	if filterSpellFavorites
		DebugMessage(functionDebugSubline + "spells")
		int objSpellArray = JValue.evalLuaObj(AHMain.objInventoryItemArray, "return jc.filter(jobject, function(x) return (x.actualItemType == " + AHMain.kSpellType + ") end)")
		arraySize = JArray.count(objSpellArray)
		favTotalSize += arraySize
		i = 0
		while i < arraySize
			favItemsProcessed += 1
			favSteppedPercent = AHUtils.GetPercentProgress(favItemsProcessed, favTotalSize, favStepIncrementPercent)
			if favSteppedPercent != favOldSteppedPercent 
				theString = favSteppedPercent + "%"
				AHMain.UpdateMCMButtonStateProgress(theString, "")
				favOldSteppedPercent = favSteppedPercent
			endIf
			objInventoryItem = JArray.getObj(objSpellArray, i)
			itemForm = JMap.getForm(objInventoryItem, "itemForm")
			itemIsFavorited = game.IsObjectFavorited(itemForm)
			JMap.setInt(objInventoryItem, "itemIsFavorited", itemIsFavorited as int)
			i += 1
		EndWhile
	endIf
	float endTime = Utility.GetCurrentRealTime()
	float elapsedTime = endTime - startTime
	DebugMessage(functionDebugSubline + "time taken = " + elapsedTime)
endFunction

; CONFIGURATION PAGE
function FilterWeaponFavorites()
endFunction
state FilterWeaponFavorites
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "filterWeaponFavorites")
		JMap.setInt(AHMain.objUserSettings, "filterWeaponFavorites", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("FilterWeaponFavorites() = " + theVal)
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "filterWeaponFavorites", (theVal as int))
		SetToggleOptionValueST(theVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Filter weapon inventory list to favourited items only.")
	endEvent
endState

function FilterArmorFavorites()
endFunction
state FilterArmorFavorites
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "filterArmorFavorites")
		JMap.setInt(AHMain.objUserSettings, "filterArmorFavorites", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("FilterArmorFavorites() = " + theVal)
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "filterArmorFavorites", (theVal as int))
		SetToggleOptionValueST(theVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Filter armor inventory list to favourited items only.")
	endEvent
endState

function FilterSpellFavorites()
endFunction
state FilterSpellFavorites
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "filterSpellFavorites")
		JMap.setInt(AHMain.objUserSettings, "filterSpellFavorites", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("FilterSpellFavorites() = " + theVal)
	endEvent

	event OnDefaultST()
		bool theVal = true
		JMap.setInt(AHMain.objUserSettings, "filterSpellFavorites", (theVal as int))
		SetToggleOptionValueST(theVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Filter spell list to favourited items only.")
	endEvent
endState

function AutoUpdateInventoryItemsInMenu()
endFunction
state AutoUpdateInventoryItemsInMenu
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "autoUpdateInventoryItemsInMenu")
		JMap.setInt(AHMain.objUserSettings, "autoUpdateInventoryItemsInMenu", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("AutoUpdateInventoryItemsInMenu() = " + theVal)
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "autoUpdateInventoryItemsInMenu", (theVal as int))
		SetToggleOptionValueST(theVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Automatically check and update the inventory items list when loading the MCM menu. This is usually not necessary as the mod should update inventory items when they are added to or removed from the inventory.")
	endEvent
endState

function AutoUpdateSpellsInMenu()
endFunction
state AutoUpdateSpellsInMenu
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "autoUpdateSpellsInMenu")
		JMap.setInt(AHMain.objUserSettings, "autoUpdateSpellsInMenu", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("AutoUpdateSpellsInMenu() = " + theVal)
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "autoUpdateSpellsInMenu", (theVal as int))
		SetToggleOptionValueST(theVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Automatically check and update the spells list when loading the MCM menu. You may want to do this to avoid having to equip spells to add them to the inventory list. Note that shouts must still be equipped to add them to the inventory list.")
	endEvent
endState

function AskToReplaceAllItemsOnSwitch()
endFunction
state AskToReplaceAllItemsOnSwitch
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "askToReplaceAllItemsOnSwitch")
		JMap.setInt(AHMain.objUserSettings, "askToReplaceAllItemsOnSwitch", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("AskToReplaceAllItemsOnSwitch() = " + theVal)
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "askToReplaceAllItemsOnSwitch", (theVal as int))
		SetToggleOptionValueST(theVal)
	endEvent

	event OnHighlightST()
		SetInfoText("When switching items in an EquipSet to another item, this option checks if the item is present in other EquipSets and, if so, asks whether the item should be replaced in all other EquipSets.")
	endEvent
endState

function UpdateInventoryListButton()
endFunction
state UpdateInventoryListButton
	event OnSelectST()
		DebugMessage("UpdateInventoryListButton()")
		AHMain.GetAllInventoryItems(true, false, true, true, true, "UpdateInventoryListButton")
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST("")
	endEvent

	event OnHighlightST()
		SetInfoText("Update inventory. This will not add shouts. Shouts must added by equipping them in the inventory menu.")
	endEvent
endState

function RebuildInventoryListButton()
endFunction
state RebuildInventoryListButton
	event OnSelectST()
		DebugMessage("RebuildInventoryListButton()")
		AHMain.GetAllInventoryItems(true, true, true, true, true, "RebuildInventoryListButton")
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST("")
	endEvent

	event OnHighlightST()
		SetInfoText("Rebuild inventory. Note that shouts will be cleared and cannot be added back into the inventory list automatically, but must be added by equipping them in the inventory menu.")
	endEvent
endState

; function RebuildSpellListButton()
; endFunction
; state RebuildSpellListButton
; 	event OnSelectST()
; 		AHMain.GetAllSpells()
; 	endEvent

; 	event OnDefaultST()
; 		SetToggleOptionValueST("")
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("Rebuild spell list.")
; 	endEvent
; endState

function SaveHotKeySetToFileMenu()
endFunction
state SaveHotKeySetToFileMenu
	event OnMenuOpenST()
		DebugMessage("SaveHotKeySetToFile(): " + modFolderPath + "; extension = " + hotKeySetExtension)
		string fileName
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		int truncateLength = StringUtil.GetLength(hotKeySetExtension)
		string[] menuList = new string[128]
		menuList[0] = "Cancel"
		menuList[1] = "Save As..."
		int listIndex = 1
		objFileList = JValue.readFromDirectory(modFolderPath, hotKeySetExtension) ; Returns a JMap, put into property
		int objFileNameArray = JMap.allKeys(objFileList)
		int objFileHotkeySetArray = JMap.allValues(objFileList)
		int arraySize = JArray.count(objFileNameArray)
		int i = 0
		listIndex += 1
		while i < arraySize
			fileName = JArray.getStr(objFileNameArray, i)
			menuList[listIndex] = AHUtils.TruncateString(fileName, truncateLength, false, true)
			if fileName == currentHotkeySetFileName
				SetMenuDialogStartIndex(listIndex)
				SetMenuDialogDefaultIndex(listIndex)
			endIf
			listIndex += 1
			i += 1
		EndWhile
		SetMenuDialogOptions(menuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		int menuIndexOffSet = 2 ; see above for other menuItems before the fileName list
		string fileName
		string defaultFileName
		int objFileNameArray = JMap.allKeys(objFileList)
		int objFileHotkeySetArray = JMap.allValues(objFileList)
		int truncateLength = StringUtil.GetLength(hotKeySetExtension)
		if menuIndex == 0
			return
		elseif menuIndex == 1
			; fileName = AHUtils.ExecuteMenuOptionSTInput("Untitled", "SaveHotKeySetToFileMenu")
			if currentHotkeySetFileName
				defaultFileName = AHUtils.TruncateString(currentHotkeySetFileName, truncateLength, false, true)
			else
				defaultFileName = ""
			endIf
			fileName = AHUtils.ShowUILibTextInput("File Name", defaultFileName)
			if fileName == ""
				DebugMessage("SaveHotKeySetToFileMenu(): cancelled due to empty file name.")
				return
			else
				SetMenuOptionValueST(fileName, false, "SaveHotKeySetToFileMenu")
				fileName = fileName + hotKeySetExtension
			endIf
		else
			fileName = JArray.getStr(objFileNameArray, menuIndex - menuIndexOffSet)
			if !ShowMessage("Overwrite file \"" + fileName + "\"?", true, "$OK", "$Cancel")
				DebugMessage("SaveHotKeySetToFileMenu(): cancelled due to user not overwriting existing file.")
				return
			endIf
		endIf
		objFileList = 0 ; deletes object from the JDB through the property definition
		JValue.writeToFile(AHMain.objHotKeySet, modFolderPath + fileName)
		currentHotkeySetFileName = fileName
		SetMenuOptionValueST(AHUtils.TruncateString(fileName, truncateLength, false, true))
		DebugMessage("SaveHotKeySetToFileMenu(): file saved = " + fileName)
		ShowMessage("Hotkey Set saved to \"" + modFolderPath + fileName + "\".", false, "$OK")
	endEvent

	event OnHighlightST()
		SetInfoText("Save hotkey data to file in folder \"" + modFolderPath + "\".")
	endEvent
endState

function LoadHotKeySetFromFileMenu()
endFunction
state LoadHotKeySetFromFileMenu
	event OnMenuOpenST()
		DebugMessage("LoadHotKeySetFromFile(): " + modFolderPath)
		string fileName
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		int truncateLength = StringUtil.GetLength(hotKeySetExtension)
		string[] menuList = new string[128]
		menuList[0] = "Cancel"
		int listIndex = 0
		objFileList = JValue.readFromDirectory(modFolderPath, hotKeySetExtension) ; Returns a JMap, put into property
		int objFileNameArray = JMap.allKeys(objFileList)
		int objFileHotkeySetArray = JMap.allValues(objFileList)
		int arraySize = JArray.count(objFileNameArray)
		int i = 0
		listIndex += 1
		while i < arraySize
			fileName = JArray.getStr(objFileNameArray, i)
			menuList[listIndex] = AHUtils.TruncateString(fileName, truncateLength, false, true)
			listIndex += 1
			i += 1
		EndWhile
		SetMenuDialogOptions(menuList)
	endEvent

event OnMenuAcceptST(int menuIndex)
		int menuIndexOffSet = 1 ; see above for other menuItems before the fileName list
		int objFileNameArray = JMap.allKeys(objFileList)
		int objFileHotkeySetArray = JMap.allValues(objFileList)
		if menuIndex == 0
			return
		endIf
		string fileName = JArray.getStr(objFileNameArray, menuIndex - menuIndexOffSet)
		int objLoadedHotkeySet = JArray.getObj(objFileHotkeySetArray, menuIndex - menuIndexOffSet)
		if ShowMessage("Are you sure you want to load the hotkey set \"" + fileName + "\"? If yes, you will lose the current hotkey data.", true, "Load and Replace", "Cancel")
			if JValue.isExists(objLoadedHotkeySet)
				DebugMessage("LoadHotKeySetFromFileMenu(): oldItemFormCache size (JFormMap) = " + JFormMap.count(AHMain.objItemFormCache), debugLevels_kDebug)
				; DebugMessage("LoadHotKeySetFromFileMenu(): oldItemFormCache size (JMap) = " + JMap.count(AHMain.objItemFormCache), debugLevels_kDebug)
				AHMgr.DeleteHotKeySet()
				AHMain.objHotKeySet = objLoadedHotkeySet ; property function will put object into JDB
				DebugMessage("LoadHotKeySetFromFileMenu(): newItemFormCache (JFormMap) size = " + JFormMap.count(AHMain.objItemFormCache), debugLevels_kDebug)
				; DebugMessage("LoadHotKeySetFromFileMenu(): newItemFormCache size (JMap) = " + JMap.count(AHMain.objItemFormCache), debugLevels_kDebug)
				AHMain.InitialiseVariables()
				AHMain.UpdateHotKeySetVersion()
				AHMain.ValidateItemsFromAllEquipSetsWithCache(true)
				AHMgr.RegisterAllEquipSetHotKeys()
				AHMgr.RegisterAllMacroHotkeys()
				DebugMessage("LoadHotKeySetFromFileMenu(): file loaded = " + fileName)
				ShowMessage("Hotkey data loaded from: \"" + modFolderPath + fileName + "\".", false, "$OK")
				currentHotkeySetFileName = fileName
				int truncateLength = StringUtil.GetLength(hotKeySetExtension)
				SetMenuOptionValueST(AHUtils.TruncateString(fileName, truncateLength, false, true), false, "SaveHotKeySetToFileMenu")
				objCurrentEquipSet = 0
				objCurrentMacro = 0
				currentEquipSetHotKeyGroupFilterIndex = 0
			else
				ShowMessage("Error with reading file: no data loaded.", false, "$OK")
			endIf
		endIf
		objFileList = 0 ; deletes object from the JDB through the property definition
	endEvent

	event OnHighlightST()
		SetInfoText("Load hotkey data from files in folder \"" + modFolderPath + "\".")
	endEvent
endState

function DeleteHotKeySetFromFileMenu()
endFunction
state DeleteHotKeySetFromFileMenu
	event OnMenuOpenST()
		DebugMessage("DeleteHotKeySetFromFileMenu(): " + modFolderPath)
		string fileName
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		int truncateLength = StringUtil.GetLength(hotKeySetExtension)
		string[] menuList = new string[128]
		menuList[0] = "Cancel"
		int listIndex = 0
		objFileList = JValue.readFromDirectory(modFolderPath, hotKeySetExtension) ; Returns a JMap, put into property
		int objFileNameArray = JMap.allKeys(objFileList)
		int objFileHotkeySetArray = JMap.allValues(objFileList)
		int arraySize = JArray.count(objFileNameArray)
		int i = 0
		listIndex += 1
		while i < arraySize
			fileName = JArray.getStr(objFileNameArray, i)
			menuList[listIndex] = AHUtils.TruncateString(fileName, truncateLength, false, true)
			listIndex += 1
			i += 1
		EndWhile
		SetMenuDialogOptions(menuList)
	endEvent

event OnMenuAcceptST(int menuIndex)
		int menuIndexOffSet = 1 ; see above for other menuItems before the fileName list
		int objFileNameArray = JMap.allKeys(objFileList)
		int objFileHotkeySetArray = JMap.allValues(objFileList)
		if menuIndex == 0
			return
		endIf

		string fileName = JArray.getStr(objFileNameArray, menuIndex - menuIndexOffSet)
		if ShowMessage("Are you sure you want to delete the hotkey set file \"" + fileName + "\"?", true, "Delete File", "Cancel")
			DebugMessage("DeleteHotKeySetFromFileMenu(): file deleted = " + fileName)
			JContainers.removeFileAtPath(modFolderPath + fileName)
		endIf
		objFileList = 0 ; deletes object from the JDB through the property definition
	endEvent

	event OnHighlightST()
		SetInfoText("Delete selected hotkey file in folder \"" + modFolderPath + "\".")
	endEvent
endState

string function GetModFolderPathText()
	if modFolderPathType == kModFolderPath_UserDirectory
		return "User Directory"
	elseif modFolderPathType == kModFolderPath_SkyrimDataDirectory
		return "Skyrim/Data"
	endIf
endFunction

function ModFolderPathButton()
endFunction
state ModFolderPathButton
	event OnSelectST()
		if modFolderPathType == kModFolderPath_UserDirectory
			modFolderPathType = kModFolderPath_SkyrimDataDirectory ; property also sets modFolderPath itself
			SetTextOptionValueST(GetModFolderPathText())
		elseif modFolderPathType == kModFolderPath_SkyrimDataDirectory
			modFolderPathType = kModFolderPath_UserDirectory ; property also sets modFolderPath itself
			SetTextOptionValueST(GetModFolderPathText())
		endIf
		DebugMessage("ModFolderPathButton() = " + GetModFolderPathText())
		OnHighlightST()
	endEvent

	event OnHighlightST()
		SetInfoText("Set mod folder path directory to save hotkey sets. Current folder path: \"" + modFolderPath + "\".")
	endEvent
endState

int function GetHotKeyGroupMenuList(bool includeNumEquipSets = false)
	int objHotkeyGroupTextArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupTextArray")
	int objHotkeyGroupIDArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupIDArray")
	string hotkeyGroupText
	int numEquipSetsByHotkeyGroupID
	int hotkeyGroupID
	; Erase objHotKeyGroupMenuList and rebuild
	int objHotKeyGroupMenuList = JArray.object()
	int arraySize = JArray.count(objHotkeyGroupIDArray)
	int i = 0
	while i < arraySize
		hotkeyGroupText = JArray.getStr(objHotkeyGroupTextArray, i)
		hotkeyGroupID = JArray.getInt(objHotkeyGroupIDArray, i)
		if includeNumEquipSets
			numEquipSetsByHotkeyGroupID = AHMgr.CountEquipSetsByHotkeyGroupID(hotkeyGroupID)
			hotkeyGroupText = hotkeyGroupText + " (" + numEquipSetsByHotkeyGroupID + ")"
		endIf
		JArray.addStr(objHotKeyGroupMenuList, (i + 1) + ") " + hotkeyGroupText)
		i += 1
	EndWhile
	return objHotKeyGroupMenuList
endFunction

function RenameHotkeyGroupButton()
endFunction
state RenameHotkeyGroupButton
	event OnSelectST()
		int objHotkeyGroupTextArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupTextArray")
		string hotkeyGroupText = JArray.getStr(objHotkeyGroupTextArray, currentConfigHotKeyGroupIndex)
		; hotkeyGroupText = AHUtils.ExecuteMenuOptionSTInput(hotkeyGroupText, "HotkeyGroupMenu")
		hotkeyGroupText = AHUtils.ShowUILibTextInput("Hotkey Group Name", hotkeyGroupText)
		if hotkeyGroupText
			SetMenuOptionValueST(hotkeyGroupText, false, "HotkeyGroupMenu")
			AHMgr.SetHotkeyGroupText(currentConfigHotKeyGroupIndex, hotkeyGroupText)
		endIf
		DebugMessage("RenameHotkeyGroupButton() = " + hotkeyGroupText)
	endEvent

	event OnHighlightST()
		SetInfoText("Set hotkey group name")
	endEvent
endState

function HotkeyGroupMenu()
endFunction
state HotkeyGroupMenu
	event OnMenuOpenST()
		DebugMessage("HotkeyGroupMenu()")
		int objHotKeyGroupMenuList = GetHotKeyGroupMenuList()
		string[] hotKeyGroupMenuList = JArray.asStringArray(objHotKeyGroupMenuList)
		SetMenuDialogStartIndex(currentConfigHotKeyGroupIndex)
		SetMenuDialogDefaultIndex(currentConfigHotKeyGroupIndex)
		SetMenuDialogOptions(hotKeyGroupMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		currentConfigHotKeyGroupIndex = menuIndex
		SetMenuOptionValueST(AHMgr.GetHotkeyGroupText(currentConfigHotKeyGroupIndex))
		DebugMessage("HotkeyGroupMenu() = " + menuIndex)
		ForcePageReset()
	endEvent

	event OnDefaultST()
		SetMenuOptionValueST(AHMgr.GetHotkeyGroupText(currentConfigHotKeyGroupIndex))
	endEvent

	event OnHighlightST()
		SetInfoText("Select Hotkey Group...")
	endEvent
endState

function AddHotkeyGroupButton()
endFunction
state AddHotkeyGroupButton
	event OnSelectST()
		int objHotkeyGroupTextArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupTextArray")
		int objHotkeyGroupIDArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupIDArray")
		int nextGroupIndex = JArray.count(objHotkeyGroupIDArray)
		string hotkeyGroupText = "HotkeyGroup-" + (nextGroupIndex + 1)
		AHMgr.AddHotkeyGroup(hotkeyGroupText)
		currentConfigHotKeyGroupIndex = nextGroupIndex
		SetTextOptionValueST(JArray.getStr(objHotkeyGroupTextArray, currentConfigHotKeyGroupIndex), false, "RenameHotkeyGroupButton")
		DebugMessage("AddHotkeyGroupButton() = " + hotkeyGroupText)
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("Add new hotkey group.")
	endEvent
endState

function DeleteHotkeyGroupButton()
endFunction
state DeleteHotkeyGroupButton
	event OnSelectST()
		int objHotkeyGroupTextArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupTextArray")
		int objHotkeyGroupIDArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupIDArray")
		string hotkeyGroupText = JArray.getStr(objHotkeyGroupTextArray, currentConfigHotKeyGroupIndex)
		if ShowMessage("Delete hotkey group \"" + hotkeyGroupText + "\"?", true, "Delete", "Cancel")
			AHMgr.DeleteHotkeyGroup(currentConfigHotKeyGroupIndex)
			currentConfigHotKeyGroupIndex = JArray.count(objHotkeyGroupIDArray) - 1
			SetMenuOptionValueST(JArray.getStr(objHotkeyGroupTextArray, currentConfigHotKeyGroupIndex), false, "RenameHotkeyGroupButton")
			DebugMessage("DeleteHotkeyGroupButton() = " + currentConfigHotKeyGroupIndex)
			ForcePageReset()
		endIf
	endEvent

	event OnHighlightST()
		SetInfoText("Delete hotkey group.")
	endEvent
endState

function UninstallButton()
endFunction
state UninstallButton
	event OnSelectST()
		DebugMessage("UninstallButton()")
		if AHMain.installed ; Uninstall
			if ShowMessage("Uninstall the mod? This will delete all mod data. Ensure that you backup the hotkey and settings data if you need to reinstall later.", true, "Uninstall", "Cancel")
				if ShowMessage("Are you sure you want to uninstall and delete all mod data?", true, "Uninstall", "Cancel")
					DebugMessage("UninstallButton(): uninstalling.")
					SetTextOptionValueST("Uninstalling. Please wait...")
					AHMain.Uninstall()
					ShowMessage(AHMain.modName + " uninstalled and all data structures have been cleared.", false)
				endIf
			endIf
		else ; Re-Install
			; if ShowMessage("Re-install " + AHMain.modName + "?")
			DebugMessage("UninstallButton(): installing.")
			SetTextOptionValueST("Installing. Please wait...")
			AHMain.forcedUninstalled = false
			AHMain.SetTraceDebug(true)
			AHMain.SetDebugLevel(AHMain.debugLevels_kNotice)
			AHMain.Load()
			string theString = "Installing " + modName + " version " + AHMain.GetMajorVersion() + "." + AHMain.GetMinorVersion() + ".\n\n" + "Do you want " + modName + " to scan your inventory (this may take a while)? Inventory lists will not be populated until you do. Note this will not pick up shouts. Shouts must be equipped first in order to show in the inventory lists."
			if ShowMessage(theString, true, "OK", "Cancel")
				AHMain.GetAllInventoryItems(true, true, true, true, true, "ProgressButton")
				; WaitUntilGetInventoryThreadsFinish()
			endIf
			if AHMain.installed
				ShowMessage(AHMain.modName + " has been installed.", false)
			endIf
			AHMain.SetInstalled(true)
			; endIf
		endIf
		DebugMessage("UninstallButton(): installed = " + AHMain.installed)
		ForcePageReset()
	endEvent

	event OnDefaultST()
		if AHMain.installed
			SetTextOptionValueST("Uninstall")
		else
			SetTextOptionValueST("Re-Install")
		endIf
	endEvent

	event OnHighlightST()
		SetInfoText("Uninstall/Re-install the mod. Warning: uninstalling deletes all mod data, including saved hotkeys.")
	endEvent
endState

function DeactivateButton()
endFunction
state DeactivateButton
	event OnSelectST()
		DebugMessage("DeactivateButton()")
		if !AHMain.installed
			return
		endIf
		if AHMain.active
			DebugMessage("DeactivateButton(): deactivating.")
			AHMain.SetActivated(false)
			AHMgr.UnregisterAllHotKeys()
			; SetTextOptionValueST("Activate")
			ShowMessage(AHMain.modName + " deactivated.", false)
		else
			if !AHMain.objAHHotKeysData
				DebugMessage("DeactivateButton(): re-activating.")
				SetTextOptionValueST("Reactivating. Please wait...")
				AHMain.Initialise()
			endIf
			AHMain.SetActivated(true)
			; SetTextOptionValueST("Deactivate")
			AHMgr.RegisterAllHotKeys()
			ShowMessage(AHMain.modName + " re-activated.", false)
		endIf
		DebugMessage("DeactivateButton(): active = " + AHMain.active)
		ForcePageReset()
	endEvent

	event OnDefaultST()
		if AHMain.active
			SetTextOptionValueST("Deactivate")
		else
			SetTextOptionValueST("Activate")
		endIf
	endEvent

	event OnHighlightST()
		SetInfoText("Activate/Deactivate the mod. Deactivating will stop the mod from catching key presses.")
	endEvent
endState

function UnbindVanillaHotkeysButton()
endFunction
state UnbindVanillaHotkeysButton
	event OnSelectST()
		DebugMessage("UnbindVanillaHotkeysButton()")
		int i = 0
		int maxVanillaHotkeys = 8 ; Vanilla hotkeys are numbered 1-8 on the keyboard (index 0 to 7)
		while i < maxVanillaHotkeys
			game.UnbindObjectHotkey(i)
			i += 1
		EndWhile
		ShowMessage("Vanilla hotkeys 1-8 have been removed.", false)
	endEvent

	event OnHighlightST()
		SetInfoText("Removes all vanilla hotkeys bound to keys 1-8.")
	endEvent
endState

;============================= USER SETTINGS =============================

function UseAlternateHotkeyMethodToggle()
endFunction
state UseAlternateHotkeyMethodToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = AHMain.useAlternateHotkeyMethod
		toggleVal = !toggleVal
		JMap.setInt(AHMain.objUserSettings, "useAlternateHotkeyMethod", toggleVal as int)
		AHMain.useAlternateHotkeyMethod = toggleVal
		SetToggleOptionValueST(toggleVal)
		DebugMessage("UseAlternateHotkeyMethodToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "useAlternateHotkeyMethod") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, AH Hotkeys will use an alternate method for detecting modifier keys. If the default (unchecked) method has glitches (not picking up modifier keys etc), give this a try. Be aware that the default method should work better, but YMMV.")
	endEvent
endState

; EquipDelay functions changed in version 1.2 to set a minimum delay (kMinEquipDelay)
function EquipDelaySlider()
endFunction
state EquipDelaySlider
	event OnSliderOpenST()
		DebugMessage("EquipDelaySlider()")
		float minEquipDelay
		if AHMain.extraEquippingPaddingRequired
			minEquipDelay = AHMain.kMinEquipDelay
		else
			minEquipDelay = 0
		endIf
		float equipDelay = AHUtils.maxFlt(minEquipDelay, JMap.getFlt(AHMain.objUserSettings, "equipDelay"))
		SetSliderDialogStartValue(equipDelay * 1000)
		SetSliderDialogRange(minEquipDelay * 1000, 1000)
		SetSliderDialogInterval(10)
	endEvent

	event OnSliderAcceptST(float a_value)
		JMap.setFlt(AHMain.objUserSettings, "equipDelay", (a_value / 1000))
		SetSliderOptionValueST(a_value)
		DebugMessage("EquipDelaySlider(): equipDelay = " + a_value + " ms.")
		; ForcePageReset()
	endEvent

	event OnHighlightST()
		float minEquipDelay
		if AHMain.extraEquippingPaddingRequired
			minEquipDelay = AHMain.kMinEquipDelay
		else
			minEquipDelay = 0
		endIf
		SetInfoText("The delay (in milliseconds) between each item equip. Default and minimum delay = " + (minEquipDelay * 1000) as int + " ms.")
	endEvent

	event OnDefaultST()
		float minEquipDelay
		; if AHMain.extraEquippingPaddingRequired
		; 	minEquipDelay = AHMain.kMinEquipDelay
		; else
			minEquipDelay = 0
		; endIf
		JMap.setFlt(AHMain.objUserSettings, "equipDelay", (AHMain.kMinEquipDelay * 1000))
		SetSliderOptionValueST((minEquipDelay * 1000))
	endEvent
endState

function ModifierKeyStickyTimeSlider()
endFunction
state ModifierKeyStickyTimeSlider
	event OnSliderOpenST()
		DebugMessage("ModifierKeyStickyTimeSlider()")
		float modifierKeyStickyTime = JMap.getFlt(AHMain.objUserSettings, "modifierKeyStickyTime")
		; DebugMessage("ModifierKeyStickyTimeSlider(): get modifierKeyStickyTime = " + modifierKeyStickyTime)
		SetSliderDialogStartValue(modifierKeyStickyTime * 1000)
		SetSliderDialogRange(0, 1000)
		SetSliderDialogInterval(10)
	endEvent

	event OnSliderAcceptST(float a_value)
		float modifierKeyStickyTime = a_value / 1000
		AHMain.modifierKeyStickyTime = modifierKeyStickyTime
		JMap.setFlt(AHMain.objUserSettings, "modifierKeyStickyTime", modifierKeyStickyTime)
		; DebugMessage("ModifierKeyStickyTimeSlider(): set modifierKeyStickyTime = " + JMap.getFlt(AHMain.objUserSettings, "modifierKeyStickyTime"))
		SetSliderOptionValueST(a_value)
		DebugMessage("ModifierKeyStickyTimeSlider(): modifierKeyStickyTime = " + a_value + " ms.")
		; ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("The time (in milliseconds) to wait for modifier keys to be pressed and for modifier keys (Alt, Control and Shift Keys) to 'stick'. This will reduce the error that can happen with keys and modifiers not being pressed at the same time - i.e. modifier keys not detected due to key actions being too quick (e.g. accidentally unpressing keys that should be pressed at the same time). Default = " + (AHMain.kDefaultModifierKeyStickyTime * 1000) as int + " ms.")
	endEvent

	event OnDefaultST()
		JMap.setFlt(AHMain.objUserSettings, "modifierKeyStickyTime", (AHMain.kDefaultModifierKeyStickyTime * 1000))
		SetSliderOptionValueST((AHMain.kDefaultModifierKeyStickyTime * 1000))
	endEvent
endState

function NotificationTextColour()
endFunction
state NotificationTextColour
    event OnColorOpenST()
    	DebugMessage("NotificationTextColour()")
    	int notificationTextColour = JMap.getInt(AHMain.objUserSettings, "notificationTextColour")
        SetColorDialogStartColor(notificationTextColour)
        SetColorDialogDefaultColor(notificationTextColour)
    endEvent

    event OnColorAcceptST(int notificationTextColour)
        JMap.setInt(AHMain.objUserSettings, "notificationTextColour", notificationTextColour)
        SetColorOptionValueST(notificationTextColour)
        DebugMessage("NotificationTextColour() = " + notificationTextColour)
    endEvent

    event OnDefaultST()
        int notificationTextColour = JMap.getInt(AHMain.objUserSettings, "notificationTextColour")
        SetColorOptionValueST(notificationTextColour)
    endEvent

    event OnHighlightST()
    	int notificationTextColour = JMap.getInt(AHMain.objUserSettings, "notificationTextColour")
    	string hexString = AHUtils.ColorIntToHex(notificationTextColour)
        SetInfoText("Choose colour for EquipSet notifications. Current colour = " + hexString)
    endEvent
endState

function SpellStartDelayTimeSlider()
endFunction
state SpellStartDelayTimeSlider
	event OnSliderOpenST()
		DebugMessage("SpellStartDelayTimeSlider()")
		SetSliderDialogStartValue(JMap.getFlt(AHMain.objUserSettings, "spellStartDelayTime") * 1000)
		SetSliderDialogDefaultValue(AHSpells.kDefaultSpellStartDelayTime)
		SetSliderDialogRange(0, 1000)
		SetSliderDialogInterval(10)
	endEvent

	event OnSliderAcceptST(float a_value)
		float settingValue = a_value / 1000
		JMap.setFlt(AHMain.objUserSettings, "spellStartDelayTime", settingValue)
		AHSpells.spellStartDelayTime = settingValue
		SetSliderOptionValueST(a_value)
		DebugMessage("SpellStartDelayTimeSlider() = " + a_value + " ms.")
	endEvent

	event OnHighlightST()
		SetInfoText("The buffer time (in milliseconds) to allow spell animations to start (if too short, spells may terminate early without casting). Default = " + (AHSpells.kDefaultSpellStartDelayTime * 1000) as int + " ms.")
	endEvent

	event OnDefaultST()
		JMap.setFlt(AHMain.objUserSettings, "spellStartDelayTime", AHSpells.kDefaultSpellStartDelayTime)
		SetSliderOptionValueST(AHSpells.kDefaultSpellStartDelayTime)
	endEvent
endState

function SpellCastFinishTimeSlider()
endFunction
state SpellCastFinishTimeSlider
	event OnSliderOpenST()
		DebugMessage("SpellCastFinishTimeSlider()")
		SetSliderDialogStartValue(JMap.getFlt(AHMain.objUserSettings, "spellCastFinishTime") * 1000)
		SetSliderDialogDefaultValue(AHSpells.kDefaultSpellCastFinishTime)
		SetSliderDialogRange(0, 1000)
		SetSliderDialogInterval(10)
	endEvent

	event OnSliderAcceptST(float a_value)
		float settingValue = a_value / 1000
		JMap.setFlt(AHMain.objUserSettings, "spellCastFinishTime", settingValue)
		AHSpells.spellCastFinishTime = settingValue
		SetSliderOptionValueST(a_value)
		DebugMessage("SpellCastFinishTimeSlider() = " + a_value + " ms.")
	endEvent

	event OnHighlightST()
		SetInfoText("The buffer time (in milliseconds) to allow spell animations to finish (if too short, spells may fail to complete when chained with other spells). Default = " + (AHSpells.kDefaultSpellCastFinishTime * 1000) as int + " ms")
	endEvent

	event OnDefaultST()
		JMap.setFlt(AHMain.objUserSettings, "spellCastFinishTime", AHSpells.kDefaultSpellCastFinishTime)
		SetSliderOptionValueST(AHSpells.kDefaultSpellCastFinishTime)
	endEvent
endState

function SpellCastHoldkeyTriggerTimeSlider()
endFunction
state SpellCastHoldkeyTriggerTimeSlider
	event OnSliderOpenST()
		DebugMessage("SpellCastHoldkeyTriggerTimeSlider()")
		SetSliderDialogStartValue(JMap.getFlt(AHMain.objUserSettings, "spellCastHoldkeyTriggerTime") * 1000)
		SetSliderDialogDefaultValue(AHSpells.kDefaultSpellCastHoldkeyTriggerTime)
		SetSliderDialogRange(0, 1000)
		SetSliderDialogInterval(10)
	endEvent

	event OnSliderAcceptST(float a_value)
		float settingValue = a_value / 1000
		JMap.setFlt(AHMain.objUserSettings, "spellCastHoldkeyTriggerTime", settingValue)
		AHSpells.spellCastHoldkeyTriggerTime = settingValue
		SetSliderOptionValueST(a_value)
		DebugMessage("SpellCastHoldkeyTriggerTimeSlider() = " + a_value + " ms.")
	endEvent

	event OnHighlightST()
		SetInfoText("The time (in milliseconds) for concentration-type spells to cast by continuously holding down the hotkey (i.e. after this time, spell is released when the hotkey is released). Default = " + (AHSpells.kDefaultSpellCastHoldkeyTriggerTime * 1000) as int + " ms.")
	endEvent

	event OnDefaultST()
		JMap.setFlt(AHMain.objUserSettings, "spellCastHoldkeyTriggerTime", AHSpells.kDefaultSpellCastHoldkeyTriggerTime)
		SetSliderOptionValueST(AHSpells.kDefaultSpellCastHoldkeyTriggerTime)
	endEvent
endState

function CancelSpellCastKey1()
endFunction
state CancelSpellCastKey1 ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("CancelSpellCastKey1()")
		bool acceptKey = true
		if theKeyCode >= 0
	    	if (conflictControl != "")
	    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
		            string msg
		            if (conflictName != "")
		                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
		            else
		                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
		            endIf
		            if !ShowMessage(msg, true, "$Yes", "$No")
		            	acceptKey = false
		            endIf
				endIf
	        endIf
		endIf
		if acceptKey
			int oldHotKey = JMap.getInt(AHMain.objUserSettings, "cancelSpellCastKey")
			if oldHotKey
				AHMgr.UnregisterModKey(oldHotKey)
			endIf
			JMap.setInt(AHMain.objUserSettings, "cancelSpellCastKey", theKeyCode)
			AHMain.cancelSpellCastKey1 = theKeyCode
	        SetKeyMapOptionValueST(theKeyCode)
	        AHMgr.RegisterModKey(theKeyCode)
			DebugMessage("CancelSpellCastKey1() = " + theKeyCode)
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = JMap.getInt(AHMain.objUserSettings, "cancelSpellCastKey")
        SetKeyMapOptionValueST(theKeyCode)
    endEvent

    event OnHighlightST()
        SetInfoText("Set key to cancel spell autocasting (including any queued hotkeys).")
    endEvent
endState

function CancelSpellCastKey2()
endFunction
state CancelSpellCastKey2 ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("CancelSpellCastKey2()")
		bool acceptKey = true
		if theKeyCode >= 0
	    	if (conflictControl != "")
	    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
		            string msg
		            if (conflictName != "")
		                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
		            else
		                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
		            endIf
		            if !ShowMessage(msg, true, "$Yes", "$No")
		            	acceptKey = false
		            endIf
				endIf
	        endIf
		endIf
		if acceptKey
			int oldHotKey = JMap.getInt(AHMain.objUserSettings, "cancelSpellCastKey2")
			if oldHotKey
				AHMgr.UnregisterModKey(oldHotKey)
			endIf
			JMap.setInt(AHMain.objUserSettings, "cancelSpellCastKey2", theKeyCode)
			AHMain.cancelSpellCastKey2 = theKeyCode
	        SetKeyMapOptionValueST(theKeyCode)
	        AHMgr.RegisterModKey(theKeyCode)
			DebugMessage("CancelSpellCastKey2() = " + theKeyCode)
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = JMap.getInt(AHMain.objUserSettings, "cancelSpellCastKey2")
        SetKeyMapOptionValueST(theKeyCode)
    endEvent

    event OnHighlightST()
        SetInfoText("Set key to cancel spell autocasting (including any queued hotkeys).")
    endEvent
endState

; function CancelSpellCastKey2()
; endFunction
; state UseRightButtonToCancelSpellCast
; 	event OnSelectST()
; 		bool theVal = !JMap.getInt(AHMain.objUserSettings, "useRightButtonToCancelSpellCast")
; 		JMap.setInt(AHMain.objUserSettings, "useRightButtonToCancelSpellCast", theVal as int)
; 		SetToggleOptionValueST(theVal)
; 		int rightHandAttackKey = AHMain.kRightButtonCancelSpellKey ;Input.GetMappedKey("Right Attack/Block", 0xFF)
; 		AHMain.rightHandAttackKeyRegistered = theVal
; 		if theVal
; 			AHMgr.RegisterModKey(rightHandAttackKey)
; 		else
; 			AHMgr.UnregisterModKey(rightHandAttackKey)
; 		endIf
; 		DebugMessage("UseRightButtonToCancelSpellCast(" + rightHandAttackKey + ") = " + theVal)
; 	endEvent

; 	event OnDefaultST()
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, the right Attack/Block button will cancel current spell cast and any further queued hotkeys.")
; 	endEvent
; endState

; function CancelSpellCastKey3()
; endFunction
; state UseLeftButtonToCancelSpellCast
; 	event OnSelectST()
; 		bool theVal = !JMap.getInt(AHMain.objUserSettings, "useLeftButtonToCancelSpellCast")
; 		JMap.setInt(AHMain.objUserSettings, "useLeftButtonToCancelSpellCast", theVal as int)
; 		SetToggleOptionValueST(theVal)
; 		int leftHandAttackKey = AHMain.kLeftButtonCancelSpellKey ; Input.GetMappedKey("Left Attack/Block", 0xFF)
; 		AHMain.leftHandAttackKeyRegistered = theVal
; 		if theVal
; 			AHMgr.RegisterModKey(leftHandAttackKey)
; 		else
; 			AHMgr.UnregisterModKey(leftHandAttackKey)
; 		endIf
; 		DebugMessage("UseLeftButtonToCancelSpellCast(" + leftHandAttackKey + ") = " + theVal)
; 	endEvent

; 	event OnDefaultST()
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("If checked, the left Attack/Block button will cancel current spell cast and any further queued hotkeys.")
; 	endEvent
; endState

function UseJumpKeyToCancelSpellCast()
endFunction
state UseJumpKeyToCancelSpellCast
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "useJumpKeyToCancelSpellCast")
		AHMain.useJumpKeyToCancelSpellCast = theVal as int
		JMap.setInt(AHMain.objUserSettings, "useJumpKeyToCancelSpellCast", theVal as int)
		SetToggleOptionValueST(theVal)
		AHMain.jumpKey = Input.GetMappedKey("Jump", 0xFF)
		if theVal
			AHMgr.RegisterModKey(AHMain.jumpKey)
		else
			AHMgr.UnregisterModKey(AHMain.jumpKey)
		endIf
		DebugMessage("UseJumpKeyToCancelSpellCast() = " + theVal)
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, jump key will cancel current spell cast and any further queued hotkeys, and then attempt to execute the jump.")
	endEvent
endState

function SheathHandsWhenEquippingToggle()
endFunction
state SheathHandsWhenEquippingToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "sheathHandsWhenEquipping") as bool
		toggleVal = !toggleVal
		JMap.setInt(AHMain.objUserSettings, "sheathHandsWhenEquipping", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("SheathHandsWhenEquippingToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "sheathHandsWhenEquipping") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, AH Hotkeys will sheathe your hands when equipping hand items (except when equipping between spells or scrolls). This is to avoid jumpy animations during equipping actions, but equipping animations will take longer. Note that the Quick Combat Sheathe and Redraw option will override this setting during combat.")
	endEvent
endState

function SheatheHandsAfterAutoCastToggle()
endFunction
state SheatheHandsAfterAutoCastToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "sheatheHandsAfterAutoCast") as bool
		toggleVal = !toggleVal
		JMap.setInt(AHMain.objUserSettings, "sheatheHandsAfterAutoCast", toggleVal as int)
		AHSpells.sheatheHandsAfterAutoCast = toggleVal
		SetToggleOptionValueST(toggleVal)
		DebugMessage("SheatheHandsAfterAutoCastToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "sheatheHandsAfterAutoCast") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, AH Hotkeys will sheathe your hands after auto casting a spell if not drawn prior to the spell cast, unless you are in combat or the spell is classified as hostile (i.e. in the case of combat or casting a hostile spell, you may want your hands to be ready for use).")
	endEvent
endState

function QuickCombatSheathAndRedrawToggle()
endFunction
state QuickCombatSheathAndRedrawToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "quickCombatSheathAndRedraw") as bool
		toggleVal = !toggleVal
		JMap.setInt(AHMain.objUserSettings, "quickCombatSheathAndRedraw", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("QuickCombatSheathAndRedrawToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "quickCombatSheathAndRedraw") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, AH Hotkeys will no longer wait for the sheathe and redraw animations to complete when switching EquipSets during combat. Check this to speed up equipping actions during combat. Note this may result in jumpy animations during equipping actions.")
	endEvent
endState

function AutoUnequipAmmoToggle()
endFunction
state AutoUnequipAmmoToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "autoUnequipAmmo") as bool
		toggleVal = !toggleVal
		JMap.setInt(AHMain.objUserSettings, "autoUnequipAmmo", toggleVal as int)
		SetToggleOptionValueST(toggleVal)
		DebugMessage("AutoUnequipAmmoToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "autoUnequipAmmo") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, AH Hotkeys will automatically unequip the last equipped ammo when ranged weapons that use ammo are unequipped.")
	endEvent
endState

function AltNotificationToggle()
endFunction
state AltNotificationToggle ; TOGGLE
	event OnSelectST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "altNotification") as bool
		toggleVal = !toggleVal
		JMap.setInt(AHMain.objUserSettings, "altNotification", toggleVal as int)
		AHUtils.altNotification = toggleVal
		SetToggleOptionValueST(toggleVal)
		DebugMessage("AltNotificationToggle() = " + toggleVal)
	endEvent

	event OnDefaultST()
		bool toggleVal = JMap.getInt(AHMain.objUserSettings, "altNotification") as bool
		SetToggleOptionValueST(toggleVal)
	endEvent

	event OnHighlightST()
		SetInfoText("Use another method for notification messages. Use this if an incompatibility with another mod causes notifications to be over sized or to otherwise not display correctly. The alternate notification method only displays in white.")
	endEvent
endState

function DisableInCraftingMenu()
endFunction
state DisableInCraftingMenu
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "disableInCraftingMenu")
		JMap.setInt(AHMain.objUserSettings, "disableInCraftingMenu", theVal as int)
		SetToggleOptionValueST(theVal)
		AHMain.disableInCraftingMenu = theVal
		DebugMessage("DisableInCraftingMenu() = " + theVal)
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, will prevent hotkeys from executing when in the crafting or other menus. This may be required if some hotkeys are the same as those being used in crafting, inventory and other menus.")
	endEvent
endState

function DisableAllKeysInCraftingMenu()
endFunction
state DisableAllKeysInCraftingMenu
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "DisableAllKeysInCraftingMenu")
		JMap.setInt(AHMain.objUserSettings, "DisableAllKeysInCraftingMenu", theVal as int)
		SetToggleOptionValueST(theVal)
		AHMain.DisableAllKeysInCraftingMenu = theVal
		DebugMessage("DisableAllKeysInCraftingMenu() = " + theVal)
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, will disable all AH Hotkeys key detection functions while in Crafting and Dialog menus.")
	endEvent
endState

function FixUILibShowTextInputBug()
endFunction
state FixUILibShowTextInputBug
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "fixUILibShowTextInputBug")
		JMap.setInt(AHMain.objUserSettings, "fixUILibShowTextInputBug", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("FixUILibShowTextInputBug() = " + theVal)
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("Experimental only: If checked, works around a UILib glitch in the ShowTextInput dialog when displayed in the SkyUI MCM menus. On occasion, UILib may prevent the next tab key press from being actioned in the MCM menus if a new string is returned. This option simulates a tab key press once the ShowTextInput dialog is closed. Uncheck this if undesired behaviour occurs (i.e. MCM menu closes unexpectedly).")
	endEvent
endState

function AutoRemoveInvalidItems()
endFunction
state AutoRemoveInvalidItems
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "autoRemoveInvalidItems")
		JMap.setInt(AHMain.objUserSettings, "autoRemoveInvalidItems", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("AutoRemoveInvalidItems() = " + theVal)
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, will automatically remove invalid items from the EquipSet (this check is made when the EquipSet is displayed in the EquipSet page). An item may become invalid if its form ID changes as a result of its mod being deactivated or if the mod load order changes. If this happens, you may need to Rebuild Inventory Items for the items with the new form IDs to show up.")
	endEvent
endState

; v2
function MaxMenuStringLengthSlider()
endFunction
state MaxMenuStringLengthSlider
	event OnSliderOpenST()
		DebugMessage("MaxMenuStringLengthSlider()")
		int maxMenuStringLength = JMap.getInt(AHMain.objUserSettings, "maxMenuStringLength")
		SetSliderDialogStartValue(maxMenuStringLength)
		SetSliderDialogRange(10, 50)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		JMap.setFlt(AHMain.objUserSettings, "maxMenuStringLength", a_value)
		SetSliderOptionValueST(a_value)
		DebugMessage("MaxMenuStringLengthSlider(): maxMenuStringLength = " + a_value)
	endEvent

	event OnHighlightST()
		SetInfoText("The maximum number of characters in the EquipSet inventory items list before the string is truncated. Default = " + maxMenuValueStringLength)
	endEvent

	event OnDefaultST()
		JMap.setFlt(AHMain.objUserSettings, "maxMenuStringLength", maxMenuValueStringLength)
		SetSliderOptionValueST(maxMenuValueStringLength)
	endEvent
endState

function TraceDebugMessages()
endFunction
state TraceDebugMessages
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "traceDebugMessages")
		JMap.setInt(AHMain.objUserSettings, "traceDebugMessages", theVal as int)
		SetToggleOptionValueST(theVal)
		AHMain.SetTraceDebug(theVal)
		DebugMessage("TraceDebugMessages() = " + theVal)
	endEvent

	event OnDefaultST()
	endEvent

	event OnHighlightST()
		SetInfoText("If checked, debug messages will be printed to the " + AHMain.modName + " log in the Skyrim log directory.")
	endEvent
endState

function DebugLevelMenu()
endFunction
state DebugLevelMenu
	event OnMenuOpenST()
		DebugMessage("DebugLevelMenu()")
		int debugLevel = JMap.getInt(AHMain.objUserSettings, "debugLevel")
		SetMenuDialogStartIndex(debugLevel)
		SetMenuDialogDefaultIndex(debugLevel)
		SetMenuDialogOptions(debugLevelMenuList)
	endEvent

	event OnMenuAcceptST(int menuIndex)
		DebugMessage("DebugLevelMenu(): menuIndex = " + menuIndex)
		JMap.setInt(AHMain.objUserSettings, "debugLevel", menuIndex)
		AHMain.SetDebugLevel(menuIndex)
		ForcePageReset()
	endEvent

	event OnDefaultST()
		;
	endEvent

	event OnHighlightST()
		SetInfoText("Set debugging verbosity level. Order in increasing verbosity: Alerts (0); Errors (1); Notices (2); Debugging (3).")
	endEvent
endState

function TimingBenchmarkTestKey()
endFunction
state TimingBenchmarkTestKey ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("TimingBenchmarkTestKey()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			int oldHotKey = JMap.getInt(AHMain.objUserSettings, "timingBenchmarkTestKey")
			if oldHotKey
				AHMgr.UnregisterModKey(oldHotKey)
			endIf
			JMap.setInt(AHMain.objUserSettings, "timingBenchmarkTestKey", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
	        AHMgr.RegisterModKey(theKeyCode)
	        AHMain.keyPressBenchmarkKey = theKeyCode
			DebugMessage("TimingBenchmarkTestKey() = " + theKeyCode)
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = JMap.getInt(AHMain.objUserSettings, "timingBenchmarkTestKey")
        AHMain.keyPressBenchmarkKey = theKeyCode
        SetKeyMapOptionValueST(theKeyCode)
    endEvent

    event OnHighlightST()
        SetInfoText("Set key to commence timing benchmark test for key presses and EquipSet execution.")
    endEvent
endState

function ActionMenuKey()
endFunction
state ActionMenuKey ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("ActionMenuKey()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			int oldHotKey = JMap.getInt(AHMain.objUserSettings, "actionMenuKey")
			if oldHotKey
				AHMgr.UnregisterModKey(oldHotKey)
			endIf
			JMap.setInt(AHMain.objUserSettings, "actionMenuKey", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
	        AHMgr.RegisterModKey(theKeyCode)
	        AHMain.actionMenuKey = theKeyCode
			DebugMessage("ActionMenuKey() = " + theKeyCode)
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = AHMain.kDefaultActionMenuKey
        SetKeyMapOptionValueST(theKeyCode)
        JMap.setInt(AHMain.objUserSettings, "actionMenuKey", theKeyCode)
        AHMain.actionMenuKey = theKeyCode
    endEvent

    event OnHighlightST()
        SetInfoText("Set key to show the AH Hotkeys Action Menu.")
    endEvent
endState

function FavoritesMenuKey()
endFunction
state FavoritesMenuKey ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("FavoritesMenuKey()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			int oldHotKey = JMap.getInt(AHMain.objUserSettings, "favoritesMenuKey")
			if oldHotKey
				AHMgr.UnregisterModKey(oldHotKey)
			endIf
			JMap.setInt(AHMain.objUserSettings, "favoritesMenuKey", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
	        AHMgr.RegisterModKey(theKeyCode)
	        AHMain.favoritesMenuKey = theKeyCode
			DebugMessage("FavoritesMenuKey() = " + theKeyCode)
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = AHMain.kDefaultFavoritesMenuKey
        SetKeyMapOptionValueST(theKeyCode)
        JMap.setInt(AHMain.objUserSettings, "favoritesMenuKey", theKeyCode)
        AHMain.favoritesMenuKey = theKeyCode
    endEvent

    event OnHighlightST()
        SetInfoText("Set key to show the Favorites Menu.")
    endEvent
endState

function OpenAndCloseMCMKey()
endFunction
state OpenAndCloseMCMKey ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("OpenAndCloseMCMKey()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			int oldHotKey = JMap.getInt(AHMain.objUserSettings, "openAndCloseMCMKey")
			if oldHotKey
				AHMgr.UnregisterModKey(oldHotKey)
			endIf
			JMap.setInt(AHMain.objUserSettings, "openAndCloseMCMKey", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
	        AHMgr.RegisterModKey(theKeyCode)
	        AHMain.openAndCloseMCMKey = theKeyCode
			DebugMessage("OpenAndCloseMCMKey() = " + theKeyCode)
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = 0
        SetKeyMapOptionValueST(theKeyCode)
        JMap.setInt(AHMain.objUserSettings, "openAndCloseMCMKey", theKeyCode)
        AHMain.openAndCloseMCMKey = theKeyCode
    endEvent

    event OnHighlightST()
        SetInfoText("Set key to open and close the AH Hotkeys MCM instantly. Note: you can open and close the MCM of any other mod using a macro ('openMCMByName').")
    endEvent
endState

function CloseMCMKey()
endFunction
state CloseMCMKey ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("CloseMCMKey()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			int oldHotKey = JMap.getInt(AHMain.objUserSettings, "closeMCMKey")
			if oldHotKey
				AHMgr.UnregisterModKey(oldHotKey)
			endIf
			JMap.setInt(AHMain.objUserSettings, "closeMCMKey", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
	        AHMgr.RegisterModKey(theKeyCode)
	        AHMain.closeMCMKey = theKeyCode
			DebugMessage("CloseMCMKey() = " + theKeyCode)
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = 0
        SetKeyMapOptionValueST(theKeyCode)
        JMap.setInt(AHMain.objUserSettings, "closeMCMKey", theKeyCode)
        AHMain.closeMCMKey = theKeyCode
    endEvent

    event OnHighlightST()
        SetInfoText("Set key to close the MCM (and Journal) menu instantly.")
    endEvent
endState

function SaveUserSettingsToFileButton()
endFunction
state SaveUserSettingsToFileButton
	event OnSelectST()
		bool continueWithSave
		bool newFileRequired
		string fullFilePathAndName = modFolderPath + userSettingsFileName + userSettingsExtension
		DebugMessage("SaveUserSettingsToFileButton(): " + fullFilePathAndName)
		if JContainers.fileExistsAtPath(fullFilePathAndName)
			if ShowMessage("A previous user settings file already exists. Replace with current settings?", true, "Replace", "Cancel")
				continueWithSave = true
			else
				continueWithSave = false
			endIf
		else
			continueWithSave = true
			newFileRequired = true
		endIf
		if continueWithSave
			JValue.writeToFile(AHMain.objUserSettings, fullFilePathAndName)
			if newFileRequired
				ForcePageReset()
			endIf
			DebugMessage("SaveUserSettingsToFileButton(): saved.")
			ShowMessage("User settings saved to backup.", false)
		endIf
	endEvent

	event OnHighlightST()
		SetInfoText("Save user settings to file in folder \"" + modFolderPath + "\". This will allow the same user settings to be restored to other saved games.")
	endEvent
endState

function OnBackupRequest(int jMod)
	string fullFilePathAndName = modFolderPath + userSettingsFileName + userSettingsExtension
	JValue.writeToFile(AHMain.objUserSettings, fullFilePathAndName)
endfunction

function ImportPageOptions(int jPage)
	string fullFilePathAndName = modFolderPath + userSettingsFileName + userSettingsExtension
	if JContainers.fileExistsAtPath(fullFilePathAndName)
		int objLoadedUserSettings = JValue.readFromFile(fullFilePathAndName)
		AHMain.objUserSettings = objLoadedUserSettings
		bool traceDebugMessages = JMap.getInt(AHMain.objUserSettings, "traceDebugMessages")
		AHMain.SetTraceDebug(traceDebugMessages)
		AHMgr.UnregisterAllHotKeys()
		AHMgr.RegisterAllHotKeys()
	endIf
endfunction

function LoadUserSettingsFromFileButton()
endFunction
state LoadUserSettingsFromFileButton
	event OnSelectST()
		string fullFilePathAndName = modFolderPath + userSettingsFileName + userSettingsExtension
		DebugMessage("LoadUserSettingsFromFileButton(): " + fullFilePathAndName)
		if JContainers.fileExistsAtPath(fullFilePathAndName)
			if ShowMessage("Restore user settings from file? This will replace the current settings.", true, "Restore", "Cancel")
				int objLoadedUserSettings = JValue.readFromFile(fullFilePathAndName)
				AHMain.objUserSettings = objLoadedUserSettings
				bool traceDebugMessages = JMap.getInt(AHMain.objUserSettings, "traceDebugMessages")
				AHMain.SetTraceDebug(traceDebugMessages)
				ForcePageReset()
				AHMgr.UnregisterAllHotKeys()
				AHMgr.RegisterAllHotKeys()
				DebugMessage("LoadUserSettingsFromFileButton(): loaded.")
				ShowMessage("User settings restored from backup.", false)
			endIf
		endIf
	endEvent

	event OnHighlightST()
		SetInfoText("Restore previously saved user settings from folder \"" + modFolderPath + "\".")
	endEvent
endState

function SetupEquipSetPage()
	SetTitleText("Equip Sets")
	DebugMessage("SetupEquipSetPage(): objCurrentEquipSet = " + objCurrentEquipSet + "; Empty = " + (objCurrentEquipSet == 0))
	if objCurrentEquipSet == 0
		int currentEquipSetHotKeyGroupFilterID = AHMgr.GetHotkeyGroupID(currentEquipSetHotKeyGroupFilterIndex)
		objCurrentEquipSet = AHMgr.FindEquipSetByHotkeyGroupID(currentEquipSetHotKeyGroupFilterID, 0)
	endIf
	if AHMgr.GetHotkeyGroupID(currentEquipSetHotKeyGroupFilterIndex) != 0
		SetHotkeyGroupLastUsedEquipSet(objCurrentEquipSet)
	endIf
	LoadEquipSetPage(objCurrentEquipSet)
endFunction

function SetupConfigPage()
	DebugMessage("SetupConfigPage()")
	if !AHMain.installed || !AHMain.active
		AddTextOptionST("UninstalledText", AHMain.modName + " is deactivated.", "", OPTION_FLAG_DISABLED)
	endIf
	currentMCMPage = kConfigPageTitle
	SetCursorPosition(1)
	SetCursorFillMode(TOP_TO_BOTTOM)
	if AHMain.installed
		AddTextOptionST("UninstallButton", "", "Uninstall")
		if AHMain.active
			AddTextOptionST("DeactivateButton", "", "Deactivate")
			AddTextOptionST("ProgressButton", "", "", OPTION_FLAG_DISABLED)
			AddHeaderOption("Save / Load Hotkey Set")
			int truncateLength = StringUtil.GetLength(hotKeySetExtension)
			AddMenuOptionST("SaveHotKeySetToFileMenu", "Save...", AHUtils.TruncateString(currentHotkeySetFileName, truncateLength, false, true)) ; brings up menu including "Save As" item.
			AddMenuOptionST("LoadHotKeySetFromFileMenu", "Load...", "") ; brings up menu
			AddMenuOptionST("DeleteHotKeySetFromFileMenu", "Delete...", "") ; brings up menu
			AddTextOptionST("ModFolderPathButton", "Mod Folder Path:", GetModFolderPathText())

			AddHeaderOption("Backup / Restore User Settings")
			AddTextOptionST("SaveUserSettingsToFileButton", "Backup User Settings", "")
			string fullFilePathAndName = modFolderPath + userSettingsFileName + userSettingsExtension
			if JContainers.fileExistsAtPath(fullFilePathAndName)
				AddTextOptionST("LoadUserSettingsFromFileButton", "Restore User Settings", "")
			else
				AddTextOptionST("LoadUserSettingsFromFileButton", "Restore User Settings", "", OPTION_FLAG_DISABLED)
			endIf
			if AHMain.getInventoryThreadsStarted
				AddTextOptionST("ProgressButton", "Updating Inventory...", "", OPTION_FLAG_DISABLED)
			endIf
		else
			AddTextOptionST("DeactivateButton", "", "Activate")
			AddTextOptionST("ProgressButton", "", "", OPTION_FLAG_DISABLED)
		endIf
	else
		AddTextOptionST("UninstallButton", "", "Install")
		AddTextOptionST("DeactivateButton", "", "Deactivated", OPTION_FLAG_DISABLED)
		AddTextOptionST("ProgressButton", "", "", OPTION_FLAG_DISABLED)
	endIf
	if AHMain.installed && AHMain.active
		AddHeaderOption("Hotkey Groups")
		AddMenuOptionST("HotkeyGroupMenu", "Hotkey Group", AHMgr.GetHotkeyGroupText(currentConfigHotKeyGroupIndex))
		if currentConfigHotKeyGroupIndex > 0
			AddTextOptionST("RenameHotkeyGroupButton", "Rename Hotkey Group", "")
		else
			AddTextOptionST("RenameHotkeyGroupButton", "Rename Hotkey Group", "", OPTION_FLAG_DISABLED)
		endIf
		AddTextOptionST("AddHotkeyGroupButton", "Add Hotkey Group", "")
		if currentConfigHotKeyGroupIndex > 0
			AddTextOptionST("DeleteHotkeyGroupButton", "Delete Hotkey Group", "")
		else
			AddTextOptionST("DeleteHotkeyGroupButton", "Delete Hotkey Group", "", OPTION_FLAG_DISABLED)
		endIf
		AddHeaderOption("Other Functions")
		AddTextOptionST("UnbindVanillaHotkeysButton", "Unbind vanilla hotkeys 1-8", "")
		AddToggleOptionST("TraceDebugMessages", "Turn on debugging", JMap.getInt(AHMain.objUserSettings, "traceDebugMessages"))
		AddMenuOptionST("DebugLevelMenu", "Debugging Level", debugLevelMenuList[JMap.getInt(AHMain.objUserSettings, "debugLevel", kDefaultDebugLevel)])
		AddKeyMapOptionST("TimingBenchmarkTestKey", "Timing Benchmark Test Key", AHMain.keyPressBenchmarkKey, OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("ActionMenuKey", "AH Hotkeys Action Menu Key", AHMain.actionMenuKey, OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("FavoritesMenuKey", "Favorites Menu Key", AHMain.favoritesMenuKey, OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("OpenAndCloseMCMKey", "Open/Close AH Hotkeys MCM", AHMain.openAndCloseMCMKey, OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("CloseMCMKey", "Close MCM", AHMain.closeMCMKey, OPTION_FLAG_WITH_UNMAP)

		SetCursorPosition(0)
		SetCursorFillMode(TOP_TO_BOTTOM)

		AddHeaderOption("Inventory Items")
		AddToggleOptionST("FilterWeaponFavorites", "Show favourited weapons only", JMap.getInt(AHMain.objUserSettings, "filterWeaponFavorites"))
		AddToggleOptionST("FilterArmorFavorites", "Show favourited armor only", JMap.getInt(AHMain.objUserSettings, "filterArmorFavorites"))
		AddToggleOptionST("FilterSpellFavorites", "Show favourited spells only", JMap.getInt(AHMain.objUserSettings, "filterSpellFavorites"))
		AddToggleOptionST("AutoUpdateInventoryItemsInMenu", "Auto Update Inventory in Menu", JMap.getInt(AHMain.objUserSettings, "autoUpdateInventoryItemsInMenu"))
		AddToggleOptionST("AutoUpdateSpellsInMenu", "Auto Update Spells in Menu", JMap.getInt(AHMain.objUserSettings, "autoUpdateSpellsInMenu"))
		AddToggleOptionST("AskToReplaceAllItemsOnSwitch", "Replace All Items on Swap", JMap.getInt(AHMain.objUserSettings, "askToReplaceAllItemsOnSwitch"))
		AddTextOptionST("UpdateInventoryListButton", "Update Inventory", "")
		AddTextOptionST("RebuildInventoryListButton", "Rebuild Inventory", "")

		AddHeaderOption("Autocasting Spells")
		AddSliderOptionST("SpellStartDelayTimeSlider", "Spell Start Buffer Time (ms)", (JMap.getFlt(AHMain.objUserSettings, "spellStartDelayTime") * 1000))
		AddSliderOptionST("SpellCastFinishTimeSlider", "Spell Finish Buffer Time (ms)", (JMap.getFlt(AHMain.objUserSettings, "spellCastFinishTime") * 1000))
		AddSliderOptionST("SpellCastHoldkeyTriggerTimeSlider", "Spell HoldKey Time (ms)", (JMap.getFlt(AHMain.objUserSettings, "spellCastHoldkeyTriggerTime") * 1000))
		; AddToggleOptionST("UseRightButtonToCancelSpellCast", "Use Right Button to cancel spell cast", JMap.getInt(AHMain.objUserSettings, "useRightButtonToCancelSpellCast"))
		; AddToggleOptionST("UseLeftButtonToCancelSpellCast", "Use Left Button to cancel spell cast", JMap.getInt(AHMain.objUserSettings, "useLeftButtonToCancelSpellCast"))
		AddToggleOptionST("UseJumpKeyToCancelSpellCast", "Use JumpKey to cancel Spell Cast", JMap.getInt(AHMain.objUserSettings, "useJumpKeyToCancelSpellCast"))
		AddKeyMapOptionST("CancelSpellCastKey1", "Cancel SpellCast Key 1", JMap.getInt(AHMain.objUserSettings, "cancelSpellCastKey"), OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("CancelSpellCastKey2", "Cancel SpellCast Key 2", JMap.getInt(AHMain.objUserSettings, "cancelSpellCastKey2"), OPTION_FLAG_WITH_UNMAP)
		; AddSliderOptionST("ShoutCastTimeSlider", "Shout Casting Time (ms)", (JMap.getFlt(AHMain.objUserSettings, "shoutCastTime") * 1000))

		AddHeaderOption("Other Settings")
		float minEquipDelay
		; if AHMain.extraEquippingPaddingRequired
		; 	minEquipDelay = AHMain.kMinEquipDelay
		; else
			minEquipDelay = 0
		; endIf
		AddToggleOptionST("UseAlternateHotkeyMethodToggle", "Use Alternate Hotkey Method", AHMain.useAlternateHotkeyMethod)
		AddSliderOptionST("EquipDelaySlider", "Equipping Delay (ms)", AHUtils.maxFlt(minEquipDelay, JMap.getFlt(AHMain.objUserSettings, "equipDelay")) * 1000)
		AddSliderOptionST("ModifierKeyStickyTimeSlider", "Modifier Key Sticky Time (ms)", JMap.getFlt(AHMain.objUserSettings, "modifierKeyStickyTime") * 1000)
		AddToggleOptionST("SheathHandsWhenEquippingToggle", "Sheathe hands when equipping", JMap.getInt(AHMain.objUserSettings, "sheathHandsWhenEquipping"))
		AddToggleOptionST("SheatheHandsAfterAutoCastToggle", "Sheathe hands after autocast", JMap.getInt(AHMain.objUserSettings, "sheatheHandsAfterAutoCast"))
		AddToggleOptionST("QuickCombatSheathAndRedrawToggle", "Quick combat sheathe and draw", JMap.getInt(AHMain.objUserSettings, "quickCombatSheathAndRedraw"))
		AddToggleOptionST("AutoUnequipAmmoToggle", "Auto Unequip Ammo", JMap.getInt(AHMain.objUserSettings, "autoUnequipAmmo"))
		AddToggleOptionST("AltNotificationToggle", "Alternative Notification Style", JMap.getInt(AHMain.objUserSettings, "altNotification"))
		AddColorOptionST("NotificationTextColour", "Notification Text Colour", JMap.getInt(AHMain.objUserSettings, "notificationTextColour"))
		AddToggleOptionST("DisableInCraftingMenu", "Disable Equipping in Crafting Menu", JMap.getInt(AHMain.objUserSettings, "disableInCraftingMenu"))
		AddToggleOptionST("DisableAllKeysInCraftingMenu", "Disable all hotkeys in Crafting Menu", JMap.getInt(AHMain.objUserSettings, "disableAllKeysInCraftingMenu"))
		AddToggleOptionST("FixUILibShowTextInputBug", "Fix UILib ShowTextInput glitch", JMap.getInt(AHMain.objUserSettings, "fixUILibShowTextInputBug"))
		AddToggleOptionST("AutoRemoveInvalidItems", "Auto Remove Invalid Items", JMap.getInt(AHMain.objUserSettings, "autoRemoveInvalidItems"))
		AddSliderOptionST("MaxMenuStringLengthSlider", "Max Length of Menu Strings", JMap.getInt(AHMain.objUserSettings, "maxMenuStringLength")) ; v2
	endIf
endFunction

;============================= Configuration Page No. 2 =============================

function SetupConfig2Page()
	DebugMessage("SetupConfig2Page()")
	if !AHMain.installed || !AHMain.active
		AddTextOptionST("UninstalledText", AHMain.modName + " is deactivated.", "", OPTION_FLAG_DISABLED)
	endIf
	currentMCMPage = kConfig2PageTitle
	SetCursorPosition(0)
	SetCursorFillMode(TOP_TO_BOTTOM)
	if !AHMain.installed || !AHMain.active
		return
	endIf
	AddHeaderOption("Customise Modifier Keys")
	AddToggleOptionST("UseCustomAltModifierKeyToggle", "Use custom Alt modifier key", JMap.getInt(AHMain.objUserSettings, "useCustomAltModifierKey"))
	AddKeyMapOptionST("CustomAltModifierKeyMap", "Custom Alt modifier key", JMap.getInt(AHMain.objUserSettings, "customAltModifierKey"), OPTION_FLAG_WITH_UNMAP)
	AddToggleOptionST("UseCustomControlModifierKeyToggle", "Use custom Control modifier key", JMap.getInt(AHMain.objUserSettings, "useCustomControlModifierKey"))
	AddKeyMapOptionST("CustomControlModifierKeyMap", "Custom Control modifier key", JMap.getInt(AHMain.objUserSettings, "customControlModifierKey"), OPTION_FLAG_WITH_UNMAP)
	AddToggleOptionST("UseCustomShiftModifierKeyToggle", "Use custom Shift modifier key", JMap.getInt(AHMain.objUserSettings, "useCustomShiftModifierKey"))
	AddKeyMapOptionST("CustomShiftModifierKeyMap", "Custom Shift modifier key", JMap.getInt(AHMain.objUserSettings, "customShiftModifierKey"), OPTION_FLAG_WITH_UNMAP)
	AddToggleOptionST("UseCustomModifierKey4Toggle", "Use custom modifier key 4", JMap.getInt(AHMain.objUserSettings, "useCustomModifierKey4"))
	AddKeyMapOptionST("CustomModifierKey4KeyMap", "Custom modifier key 4", JMap.getInt(AHMain.objUserSettings, "customModifierKey4"), OPTION_FLAG_WITH_UNMAP)
	
	SetCursorPosition(1)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Unequip Item Exclusions")
	AddTextOptionST("AddUnequipItemExclusionButton", "Add to Exclusions List", "")
	int unequipItemExclusionsArraySize = JArray.count(AHMain.objUnequipItemExclusionsArray)
	if unequipItemExclusionsArraySize > 0
		AddTextOptionST("DeleteUnequipItemExclusionButton", "Remove from Exclusions List", "")
	else
		AddTextOptionST("DeleteUnequipItemExclusionButton", "Remove from Exclusions List", "", OPTION_FLAG_DISABLED)
	endIf
	AddTextOptionST("NumUnequipItemExclusionsButton", "No. of Excluded Items: ", unequipItemExclusionsArraySize, OPTION_FLAG_DISABLED)
	AddHeaderOption("Other Options")
	int deviceType = JMap.getInt(AHMain.objUserSettings, "autoCastingDeviceType")
	string deviceTypeString = GetDeviceTypeString(deviceType)
	AddTextOptionST("AutoCastingDeviceTypeButton", "Set auto casting device", deviceTypeString)
endFunction

function AddUnequipItemExclusionButton()
endFunction
state AddUnequipItemExclusionButton
	event OnSelectST()
		int objInventoryItem
		int itemTypeFilterBits = AHMain.kWeaponType + AHMain.kShieldType + AHMain.kArmorType + AHMain.kAmmoType
		int objItemExclusionJMap = JValue.addToPool(JMap.object(), JCTempPoolClearOnKeyDown)
		JMap.setObj(objItemExclusionJMap, "equipSetItemsArray", AHMain.objUnequipItemExclusionsArray)
		JMap.setObj(objItemExclusionJMap, "leftHandItemObject", 0)
		JMap.setObj(objItemExclusionJMap, "rightHandItemObject", 0)
		JMap.setObj(objItemExclusionJMap, "shoutObject", 0)
		int objMenuItem = AHMain.GetInventoryItemFromList("Item to add to unequip exclusions:", "", itemTypeFilterBits, objItemExclusionJMap, 0, false, true)
		JValue.release(objItemExclusionJMap)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			;
		else
			objInventoryItem = JMap.getObj(objMenuItem, "objInventoryItem")
			DebugMessage("UnequipItemExclusionsMenu() selected objInventoryItem = " + JMap.getStr(objInventoryItem, "itemDisplayName"))
			if objInventoryItem
				if JArray.findObj(AHMain.objUnequipItemExclusionsArray, objInventoryItem) == -1
					DebugMessage("UnequipItemExclusionsMenu() adding objInventoryItem = " + JMap.getStr(objInventoryItem, "itemDisplayName"))
					JArray.addObj(AHMain.objUnequipItemExclusionsArray, objInventoryItem)	
					ForcePageReset()
				endIf
			endIf
		endIf
		AHMain.PrintJObject(AHMain.objUnequipItemExclusionsArray, "objUnequipItemExclusionsArray: ", debugLevels_kDebug)
	endEvent
	event OnHighlightST()
		SetInfoText("Add item to exclude from being unequipped by AH Hotkeys (i.e. by using the Unequip Items options in the EquipSet Page) unless specifically overridden in an EquipSet. This could include lanterns, torches etc which should continue to be equipped when switching clothing or armour sets.")
	endEvent
endState

function DeleteUnequipItemExclusionButton()
endFunction
state DeleteUnequipItemExclusionButton
	event OnSelectST()
		int objMenuItem = AHMain.ShowInventoryItemList("Delete unequip item exclusion:", AHMain.objUnequipItemExclusionsArray, false, false)
		AHMain.PrintJObject(objMenuItem, "objMenuItem: ", debugLevels_kDebug)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			;
		else
			int itemObjectIndex = JMap.getInt(objMenuItem, "itemObjectIndex")
			if itemObjectIndex >= 0
				int objInventoryItem = JMap.getObj(objMenuItem, "objInventoryItem")
				string itemName = JMap.getStr(objInventoryItem, "itemDisplayName")
				if ShowMessage("Delete unequip item exclusion: " + itemName + "?", true, "Delete", "Cancel")
					JArray.eraseIndex(AHMain.objUnequipItemExclusionsArray, itemObjectIndex)
					DebugMessage("DeleteUnequipItemExclusionButton() = item " + itemName + " deleted.")
					ForcePageReset()
				endIf
			endIf
		endIf
	endEvent
	event OnHighlightST()
		SetInfoText("Delete unequip item exclusion.")
	endEvent
endState

; string autoCastingDeviceTypeMenu_Keyboard = "Keyboard"
; string autoCastingDeviceTypeMenu_Mouse = "Mouse"
; string autoCastingDeviceTypeMenu_Gamepad = "Gamepad"
; string autoCastingDeviceTypeMenu_AutoDetect = "Auto Detect"

; function AutoCastingDeviceTypeMenu()
; endFunction
; state AutoCastingDeviceTypeMenu
; 	event OnMenuOpenST()
; 		DebugMessage("AutoCastingDeviceTypeMenu()")
; 		JArray.clear(objMenuListStringsArray)
; 		JArray.addStr(objMenuListStringsArray, autoCastingDeviceTypeMenu_Keyboard)
; 		JArray.addStr(objMenuListStringsArray, autoCastingDeviceTypeMenu_Mouse)
; 		JArray.addStr(objMenuListStringsArray, autoCastingDeviceTypeMenu_Gamepad)
; 		JArray.addStr(objMenuListStringsArray, autoCastingDeviceTypeMenu_AutoDetect)
; 		int autoCastingDeviceType = JMap.getInt(AHMain.objUserSettings, "autoCastingDeviceType")
; 		int menuListStartIndex
; 		if autoCastingDeviceType == autoCastingDeviceTypeMenu_Keyboard
; 			menuListDefaultIndex = 0
; 			menuListStartIndex = 0
; 		elseif autoCastingDeviceType == autoCastingDeviceTypeMenu_Mouse
; 			menuListStartIndex = 1
; 		elseif autoCastingDeviceType == autoCastingDeviceTypeMenu_Gamepad
; 			menuListStartIndex = 2
; 		elseif autoCastingDeviceType == autoCastingDeviceTypeMenu_AutoDetect
; 			menuListStartIndex = 3
; 		endIf
; 		string[] menuListStringsArray = JArray.asStringArray(objMenuListStringsArray)
; 		SetMenuDialogStartIndex(menuListStartIndex)
; 		SetMenuDialogDefaultIndex(menuListDefaultIndex)
; 		SetMenuDialogOptions(menuListStringsArray)
; 	endEvent

; 	event OnMenuAcceptST(int menuIndex)
; 		DebugMessage("AutoCastingDeviceTypeMenu(): menuIndex = " + menuIndex)
; 		int autoCastingDeviceType
; 		if menuIndex == 0
; 			autoCastingDeviceType = kDeviceType_Keyboard
; 		elseif menuIndex == 1
; 			autoCastingDeviceType = kDeviceType_Mouse
; 		elseif menuIndex == 2
; 			autoCastingDeviceType = kDeviceType_Gamepad
; 		elseif menuIndex == 3
; 			autoCastingDeviceType = kDeviceType_AutoDetect
; 		endIf
; 		JMap.setInt(AHMain.objUserSettings, "autoCastingDeviceType", autoCastingDeviceType)
; 		SetMenuOptionValueST(JArray.getStr(objMenuListStringsArray, menuIndex))
; 		ForcePageReset()
; 	endEvent

; 	event OnDefaultST()
; 		SetMenuOptionValueST(autoCastingDeviceTypeMenu_Keyboard)
; 	endEvent

; 	event OnHighlightST()
; 		SetInfoText("Set device type for autocasting functions. This can be set to Keyboard (0), Mouse (1), Gamepad (2) or AutoDetect (255). Note that the controlmap.txt file included on the AH Hotkeys Nexus page sets the autocasting function to a keyboard key, so this should be set to 'Keyboard' in most cases. If set to 'AutoDetect', the autocasting functionality may stop working if a gamepad is connected. Defaults to 'Keyboard'.")
; 	endEvent
; endState

function AutoCastingDeviceTypeButton()
endFunction
state AutoCastingDeviceTypeButton
	event OnSelectST()
		int objMenuList = GetDeviceTypeFromList("Set auto casting device:", includeCancel = true, includeBack = false)
		string menuItemString = JMap.getStr(objMenuList, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int deviceType = JMap.getInt(objMenuList, "deviceType")
		JMap.setInt(AHMain.objUserSettings, "autoCastingDeviceType", deviceType)
		AHMain.kDeviceType_AutoCast = deviceType
		SetTextOptionValueST(menuItemString)
		ForcePageReset()
	endEvent
	event OnHighlightST()
		SetInfoText("Set device type for autocasting functions. This can be set to Keyboard (0), Mouse (1), Gamepad (2) or AutoDetect (255). Note that the controlmap.txt file included on the AH Hotkeys Nexus page sets the autocasting function to a keyboard key, so this should be set to 'Keyboard' in most cases. If set to 'AutoDetect', the autocasting functionality may stop working if a gamepad is connected. Defaults to 'Keyboard'.")
	endEvent
endState

string function GetDeviceTypeString(int deviceType)
	string deviceTypeString
	if deviceType == AHMain.kDeviceType_Keyboard
		deviceTypeString = kDeviceType_KeyboardString
	elseif deviceType == AHMain.kDeviceType_Mouse
		deviceTypeString = kDeviceType_MouseString
	elseif deviceType == AHMain.kDeviceType_Gamepad
		deviceTypeString = kDeviceType_GamepadString
	elseif deviceType == AHMain.kDeviceType_AutoDetect
		deviceTypeString = kDeviceType_AutoDetectString
	endIf
	return deviceTypeString
endFunction

;============================= Wizards Page =============================

function SetupWizardsPage()
	DebugMessage("SetupWizardsPage()")
	if !AHMain.installed || !AHMain.active
		AddTextOptionST("UninstalledText", AHMain.modName + " is deactivated.", "", OPTION_FLAG_DISABLED)
	endIf
	currentMCMPage = kWizardsPageTitle
	SetCursorPosition(0)
	SetCursorFillMode(TOP_TO_BOTTOM)
	if !AHMain.installed || !AHMain.active
		return
	endIf
	AddHeaderOption("EquipSets")
	AddTextOptionST("Wizard_BlankEquipSet", "Blank EquipSet", "")
	AddTextOptionST("Wizard_UnequipAllItemsEquipSet", "Unequip Everything EquipSet", "")
	AddTextOptionST("Wizard_CurrentlyWornArmourEquipSet", "Currently-Worn Armour EquipSet", "")
	AddTextOptionST("Wizard_CurrentlyEquippedWeaponsEquipSet", "Currently-Equipped Weapons EquipSet", "")
	AddTextOptionST("Wizard_HealthAutoAddPotionEquipSet", "Auto Add Health Potion EquipSet", "")
	AddTextOptionST("Wizard_StaminaAutoAddPotionEquipSet", "Auto Add Stamina Potion EquipSet", "")
	AddTextOptionST("Wizard_MagickaAutoAddPotionEquipSet", "Auto Add Magicka Potion EquipSet", "")
	AddTextOptionST("Wizard_AutoAddFoodEquipSet", "Auto Add Food EquipSet", "")
	AddTextOptionST("Wizard_AutoAddAmmoEquipSet", "Auto Add Ammo EquipSet", "")

	SetCursorPosition(1)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Macros")
	AddTextOptionST("Wizard_BlankMacro", "Blank Macro", "")
	; AddTextOptionST("Wizard_SetupOpenAHHotkeysMCMMacro", "Setup Macro to Open AH Hotkeys", "")
	AddTextOptionST("Wizard_OpenModMCMMacro", "Open Mod MCM Macro", "")
	AddTextOptionST("Wizard_WalkMacro", "Walk Macro", "")
	AddTextOptionST("Wizard_RunMacro", "Run Macro", "")
endFunction

function Wizard_BlankMacro()
endFunction
state Wizard_BlankMacro
	event OnSelectST()
		string macroName = AHUtils.ShowUILibTextInput("Name of new Macro", "New Macro")
		if macroName == ""
			return
		endIf
		int objMacro = AHMgr.NewMacroObject()
		AHMgr.SaveMacro(objMacro)
		JMap.setStr(objMacro, "name", macroName)
		ShowMacro(objMacro)
		ShowMessage("New blank Macro added.", false, "OK")
		; AHMain.SelectMCMPageIndex(kMacroPageTitle, kMacroPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new blank Macro.")
	endEvent
endState

function Wizard_OpenModMCMMacro()
endFunction
state Wizard_OpenModMCMMacro
	event OnSelectST()
		string macroName = AHUtils.ShowUILibTextInput("Name of new Macro", "Open Mod 'ModName'")
		if macroName == ""
			return
		endIf
		int objMacro = AHMgr.NewMacroObject()
		AHMgr.SaveMacro(objMacro)
		JMap.setStr(objMacro, "name", macroName)
		; string modPositionString = AHUtils.ShowUILibTextInput("Position of mod in MCM list", "0")
		int objMenuItem = AHMain.GetMCMModNameFromList("Open MCM Wizard - select mod:", includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		string macroScriptString = "openMCMByName="+menuItemString
		; int modPosition = modPositionString as int
		; string macroScriptString = "Stopifmenu=Journal Menu;Key=J;WaitForMenu=Journal Menu;Keycode="+KEY_NUM5+";Repeat=5;Keycode="+KEY_DOWN_ARROW+";End;Keycode="+KEY_ENTER+";Repeat=" + modPosition + ";Keycode="+KEY_DOWN_ARROW+";End;Keycode="+KEY_ENTER
		AHMgr.CompileMacroFromString(objMacro, macroScriptString)
		ShowMacro(objMacro)
		ShowMessage("New Macro added to open the mod's MCM menu.", false, "OK")
		; AHMain.SelectMCMPageIndex(kMacroPageTitle, kMacroPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new Macro that opens the MCM mod list in the Journal Menu and selects a particular mod to open. You will need to specify the name of the mod as it appears in the MCM mod list.")
	endEvent
endState

; function Wizard_SetupOpenAHHotkeysMCMMacro()
; endFunction
; state Wizard_SetupOpenAHHotkeysMCMMacro
; 	event OnSelectST()
; 		int objMacro = AHMain.objOpenAHHotkeysMCMMacro
; 		string modPositionString = AHUtils.ShowUILibTextInput("Position of mod in MCM list", "0")
; 		int modPosition = modPositionString as int
; 		string macroScriptString = "Stopifmenu=Journal Menu;Key=J;WaitForMenu=Journal Menu;Keycode="+KEY_NUM5+";Repeat=5;Keycode="+KEY_DOWN_ARROW+";End;Keycode="+KEY_ENTER+";Repeat=" + modPosition + ";Keycode="+KEY_DOWN_ARROW+";End;Keycode="+KEY_ENTER
; 		AHMgr.CompileMacroFromString(objMacro, macroScriptString)
; 		ShowMacro(objMacro)
; 		ShowMessage("The Open AH Hotkeys Macros is set up. Go to the Macro page to view the Macro.", false, "OK")
; 	endEvent
; 	event OnHighlightST()
; 		SetInfoText("Set up the Open AH Hotkeys Macro to the position of AH Hotkeys in the MCM mod list. This macro opens the Journal Menu, navigates to the SkyUI mod menu and scrolls down the mod list to where AH Hotkeys is positioned. You will need to specify the position of AH Hotkeys in the MCM mod list.")
; 	endEvent
; endState

function Wizard_WalkMacro()
endFunction
state Wizard_WalkMacro
	event OnSelectST()
		string macroName = AHUtils.ShowUILibTextInput("Name of new Macro", "Walk Forward")
		if macroName == ""
			return
		endIf
		int objMacro = AHMgr.NewMacroObject()
		AHMgr.SaveMacro(objMacro)
		JMap.setStr(objMacro, "name", macroName)
		string macroScriptString = "mappedkeydown=Forward"
		AHMgr.CompileMacroFromString(objMacro, macroScriptString)
		ShowMacro(objMacro)
		ShowMessage("New Macro added to hold down the walk key.", false, "OK")
		; AHMain.SelectMCMPageIndex(kMacroPageTitle, kMacroPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new Macro that holds down the move forward key. The player won't stop moving forward until the key is pressed again.")
	endEvent
endState

function Wizard_RunMacro()
endFunction
state Wizard_RunMacro
	event OnSelectST()
		string macroName = AHUtils.ShowUILibTextInput("Name of new Macro", "Sprint Forward")
		if macroName == ""
			return
		endIf
		int objMacro = AHMgr.NewMacroObject()
		AHMgr.SaveMacro(objMacro)
		JMap.setStr(objMacro, "name", macroName)
		string macroScriptString = "mappedkeydown=Forward;wait=0.5;mappedkey=Sprint"
		AHMgr.CompileMacroFromString(objMacro, macroScriptString)
		ShowMacro(objMacro)
		ShowMessage("New Macro added to hold down the walk key.", false, "OK")
		; AHMain.SelectMCMPageIndex(kMacroPageTitle, kMacroPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new Macro that holds down the move forward and sprint keys. The player won't stop moving forward until the key is pressed again.")
	endEvent
endState

int function GetDeviceTypeFromList(string menuTitleText = "", bool includeCancel = true, bool includeBack = false)
	DebugMessage("GetDeviceTypeFromList()", debugLevels_kNotice)
	string kBack = AHMain.kBackMenuItemString
	string kCancel = AHMain.kCancelMenuItemString
	if menuTitleText == ""
		menuTitleText = "Select Device:"
	endIf
	int objMenuList
	if !objMenuList
		objMenuList = JArray.object()
	endIf
	if includeBack
		JArray.addStr(objMenuList, kBack)
	endIf
	if includeCancel
		JArray.addStr(objMenuList, kCancel)
	endIf
	JArray.addStr(objMenuList, kDeviceType_AutoDetectString)
	JArray.addStr(objMenuList, kDeviceType_KeyboardString)
	JArray.addStr(objMenuList, kDeviceType_MouseString)
	JArray.addStr(objMenuList, kDeviceType_GamepadString)
	string[] menuList = JArray.asStringArray(objMenuList)
	int menuIndex = AHUtils.ShowUILibListMenu(menuTitleText, menuList, 0, 0)
	string menuItemString = menuList[menuIndex]
	int objMenuItem
	objMenuItem = JMap.object()
	JMap.setStr(objMenuItem, "menuItemString", menuList[menuIndex])
	JMap.setInt(objMenuItem, "menuItemIndex", menuIndex)
	if menuItemString == kDeviceType_AutoDetectString
		JMap.setInt(objMenuItem, "deviceType", kDeviceType_AutoDetect)
	elseif menuItemString == kDeviceType_KeyboardString
		JMap.setInt(objMenuItem, "deviceType", kDeviceType_Keyboard)
	elseif menuItemString == kDeviceType_MouseString
		JMap.setInt(objMenuItem, "deviceType", kDeviceType_Mouse)
	elseif menuItemString == kDeviceType_GamepadString
		JMap.setInt(objMenuItem, "deviceType", kDeviceType_Gamepad)
	endIf
	return objMenuItem
endFunction

int function GetMappedKeyFromList(string menuTitleText = "", string defaultValue, bool includeCancel = true, bool includeBack = false)
	DebugMessage("GetMappedKeyFromList()", debugLevels_kNotice)
	string kBack = AHMain.kBackMenuItemString
	string kCancel = AHMain.kCancelMenuItemString
	if menuTitleText == ""
		menuTitleText = "Select Device:"
	endIf
	int objMenuList = JArray.object()
	if includeBack
		JArray.addStr(objMenuList, kBack)
	endIf
	if includeCancel
		JArray.addStr(objMenuList, kCancel)
	endIf
	int startOfItemObjectList = JArray.count(objMenuList)
	int objMappedKeyArray = JMap.getObj(AHUtils.objKeyMap, "mappedKeyArray")
	JArray.addFromArray(objMenuList, objMappedKeyArray)
	int defaultIndex
	if defaultValue != ""
		defaultIndex = JArray.findStr(objMenuList, defaultValue)
		if defaultIndex == -1
			defaultIndex = 0
		endIf
	endIf
	string[] menuList = JArray.asStringArray(objMenuList)
	int menuIndex = AHUtils.ShowUILibListMenu(menuTitleText, menuList, defaultIndex, 0)
	string menuItemString = menuList[menuIndex]
	int objMenuItem = JMap.object()
	JMap.setStr(objMenuItem, "menuItemString", menuList[menuIndex])
	JMap.setInt(objMenuItem, "menuItemIndex", menuIndex)
	return objMenuItem
endFunction 

function Wizard_BlankEquipSet()
endFunction
state Wizard_BlankEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		ShowEquipSet(objEquipSet)
		ShowMessage("New blank EquipSet added.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new blank EquipSet.")
	endEvent
endState

function Wizard_UnequipAllItemsEquipSet()
endFunction
state Wizard_UnequipAllItemsEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		JMap.setInt(objEquipSet, "unequipLeftHand", 1)
		JMap.setInt(objEquipSet, "unequipRightHand", 1)
		JMap.setInt(objEquipSet, "unequipAllItems", 1)
		JMap.setInt(objEquipSet, "overrideUnequipItemExclusion", 1)
		ShowEquipSet(objEquipSet)
		ShowMessage("New EquipSet added to unequip all items.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new blank EquipSet which unequips all items including hand items, clothing/armour and jewelry (including items that have been added to the Unequip Item Exclusion list - such as lanterns etc).")
	endEvent
endState

function Wizard_CurrentlyWornArmourEquipSet()
endFunction
state Wizard_CurrentlyWornArmourEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		JMap.setInt(objEquipSet, "unequipAllItems", 1)
		int objFormArray = JMap.getObj(objEquipSet, "formArray")
		int objCurrentlyWornItemsArray = JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "currentlyWornItemsArray")
		JArray.addFromArray(objFormArray, objCurrentlyWornItemsArray)
		JMap.setInt(objEquipSet, "itemSortOrder", kSortMenuItem_HighestToLowestMagicEffect)
		ShowEquipSet(objEquipSet)
		ShowMessage("New EquipSet added with currently worn items.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new EquipSet containing your currently worn items (armour, clothing, jewelry etc).")
	endEvent
endState

function Wizard_CurrentlyEquippedWeaponsEquipSet()
endFunction
state Wizard_CurrentlyEquippedWeaponsEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		JMap.setInt(objEquipSet, "unequipLeftHand", 1)
		JMap.setInt(objEquipSet, "unequipRightHand", 1)
		AHMain.UpdateEquippedAndWornItems(leftHand = true, rightHand = true, apparel = true, clearApparelArray = true, objEquipSetItemsArray = 0, apparelItemSlotMask = 0)
		int objLeftHandInventoryItem = JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "leftHandItemObject")
		int objRightHandInventoryItem = JMap.getObj(AHMain.objCurrentlyEquippedInventoryItems, "rightHandItemObject")
		AHMain.SetEquipSetHandInventoryItem(objEquipSet, objLeftHandInventoryItem, kLeftHand)
		AHMain.SetEquipSetHandInventoryItem(objEquipSet, objRightHandInventoryItem, kRightHand)
		ShowEquipSet(objEquipSet)
		ShowMessage("New EquipSet added with currently equipped weapons.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new EquipSet containing your currently equipped hand items (weapons, torch, shield etc).")
	endEvent
endState

function Wizard_HealthAutoAddPotionEquipSet()
endFunction
state Wizard_HealthAutoAddPotionEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		string autoAddItemEffectsString = "Restore Health"
		bool success = AHMgr.AddNewAutoAddItemToEquipSet(objEquipSet, 0, AHMain.kPotionType, autoAddItemEffectsString)
		JMap.setInt(objEquipSet, "itemSortOrder", kSortMenuItem_HighestToLowestMagicEffect)
		JMap.setInt(objEquipSet, "fastEquip", true as int)
		ShowEquipSet(objEquipSet)
		ShowMessage("New EquipSet added to auto-add restore health potions.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new EquipSet which auto-adds Health Potions. You can auto-add different potions with particular magic effects by choosing 'Auto Add Potion' in the potion's menu.")
	endEvent
endState

function Wizard_StaminaAutoAddPotionEquipSet()
endFunction
state Wizard_StaminaAutoAddPotionEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		string autoAddItemEffectsString = "Restore Stamina"
		bool success = AHMgr.AddNewAutoAddItemToEquipSet(objEquipSet, 0, AHMain.kPotionType, autoAddItemEffectsString)
		JMap.setInt(objEquipSet, "itemSortOrder", kSortMenuItem_HighestToLowestMagicEffect)
		JMap.setInt(objEquipSet, "fastEquip", true as int)
		ShowEquipSet(objEquipSet)
		ShowMessage("New EquipSet added to auto-add restore stamina potions.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new EquipSet which auto-adds Stamina Potions. You can auto-add different potions with particular magic effects by choosing 'Auto Add Potion' in the potion's menu.")
	endEvent
endState

function Wizard_MagickaAutoAddPotionEquipSet()
endFunction
state Wizard_MagickaAutoAddPotionEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		string autoAddItemEffectsString = "Restore Magicka"
		bool success = AHMgr.AddNewAutoAddItemToEquipSet(objEquipSet, 0, AHMain.kPotionType, autoAddItemEffectsString)
		JMap.setInt(objEquipSet, "itemSortOrder", kSortMenuItem_HighestToLowestMagicEffect)
		JMap.setInt(objEquipSet, "fastEquip", true as int)
		ShowEquipSet(objEquipSet)
		ShowMessage("New EquipSet added to auto-add magicka potions.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new EquipSet which auto-adds Magicka Potions. You can auto-add different potions with particular magic effects by choosing 'Auto Add Potion' in the potion's menu.")
	endEvent
endState

function Wizard_AutoAddAmmoEquipSet()
endFunction
state Wizard_AutoAddAmmoEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		objMenuItem = GetAutoAddItemTypeFromList(GetAutoAddItemTypeFromList_kAmmoItems, "Create EquipSet to auto add which ammo type?", includeCancel = true, includeBack = false)
		menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		int autoAddItemType = JMap.getInt(objMenuItem, "autoAddItemType")
		string autoAddItemEffectsString = "" ; auto add all ammo of that type. Most ammo don't have magic effects.
		bool success = AHMgr.AddNewAutoAddItemToEquipSet(objEquipSet, 0, autoAddItemType, autoAddItemEffectsString)
		JMap.setInt(objEquipSet, "itemSortOrder", kSortMenuItem_HighestToLowestMagicEffect)
		ShowEquipSet(objEquipSet)
		ShowMessage("New EquipSet added to auto-add ammo.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new EquipSet which auto-adds ammo (arrows or bolts).")
	endEvent
endState

function Wizard_AutoAddFoodEquipSet()
endFunction
state Wizard_AutoAddFoodEquipSet
	event OnSelectST()
		string equipSetName = AHUtils.ShowUILibTextInput("Name of new EquipSet", GetNewEquipSetName())
		if equipSetName == ""
			return
		endIf
		int objMenuItem = AHMain.GetHotkeyGroupFromList("Add new EquipSet to Hotkey Group", 0, includeBack = false, includeCancel = true)
		string menuItemString = JMap.getStr(objMenuItem, "menuItemString")
		if menuItemString == AHMain.kCancelMenuItemString
			return
		endIf
		int hotkeyGroupID = JMap.getInt(objMenuItem, "hotkeyGroupID")
		currentEquipSetHotKeyGroupFilterIndex = AHMgr.GetHotkeyGroupIndexFromID(hotkeyGroupID)
		int objEquipSet = AddNewEquipSet()
		JMap.setStr(objEquipSet, "name", equipSetName)
		JMap.setInt(objEquipSet, "hotkeyGroupID", hotkeyGroupID)
		int autoAddItemType = AHMain.kFoodType
		string autoAddItemEffectsString = "Restore Hunger,!Very Small" ; auto add all ammo of that type. Most ammo don't have magic effects.
		bool success = AHMgr.AddNewAutoAddItemToEquipSet(objEquipSet, 0, autoAddItemType, autoAddItemEffectsString)
		JMap.setInt(objEquipSet, "itemSortOrder", kSortMenuItem_HighestToLowestMagicEffect)
		JMap.setInt(objEquipSet, "fastEquip", true as int)
		ShowEquipSet(objEquipSet)
		ShowMessage("New EquipSet added to auto-add food.", false, "OK")
		; AHMain.SelectMCMPageIndex(kEquipSetPageTitle, kEquipSetPageIndex)
	endEvent
	event OnHighlightST()
		SetInfoText("Create new EquipSet which auto-adds food restoring large, medium and small (excluding very small) amounts of hunger (for CC Survival Mode only).")
	endEvent
endState

int GetAutoAddItemTypeFromList_kAllItems = 1
int GetAutoAddItemTypeFromList_kAmmoItems = 2

int function GetAutoAddItemTypeFromList(int itemsToList, string menuTitleText = "", bool includeCancel = true, bool includeBack = false)
	DebugMessage("GetAutoAddItemTypeFromList()", debugLevels_kNotice)
	string kBack = AHMain.kBackMenuItemString
	string kCancel = AHMain.kCancelMenuItemString
	if menuTitleText == ""
		menuTitleText = "Select auto add item type:"
	endIf
	int objMenuList
	if !objMenuList
		objMenuList = JValue.addToPool(JArray.object(), JCTempPoolClearOnCloseMCM)
	endIf
	if includeBack
		JArray.addStr(objMenuList, kBack)
	endIf
	if includeCancel
		JArray.addStr(objMenuList, kCancel)
	endIf
	string kPotionTypeText
	string kPoisonTypeText
	string kFoodTypeText
	string kArrowTypeText
	string kBoltTypeText
	if itemsToList == GetAutoAddItemTypeFromList_kAllItems
		kPotionTypeText = AHMain.GetItemTypeText(AHMain.kPotionType)
		kPoisonTypeText = AHMain.GetItemTypeText(AHMain.kPoisonType)
		kFoodTypeText = AHMain.GetItemTypeText(AHMain.kFoodType)
		JArray.addStr(objMenuList, kPotionTypeText)
		JArray.addStr(objMenuList, kPoisonTypeText)
		JArray.addStr(objMenuList, kFoodTypeText)
	endIf
	kArrowTypeText = AHMain.GetItemTypeText(AHMain.kArrowType)
	kBoltTypeText = AHMain.GetItemTypeText(AHMain.kBoltType)
	JArray.addStr(objMenuList, kArrowTypeText)
	JArray.addStr(objMenuList, kBoltTypeText)
	string[] menuList = JArray.asStringArray(objMenuList)
	int menuIndex = AHUtils.ShowUILibListMenu(menuTitleText, menuList, 0, 0)
	string menuItemString = menuList[menuIndex]
	int objMenuItem
	objMenuItem = JMap.object()
	JMap.setStr(objMenuItem, "menuItemString", menuList[menuIndex])
	JMap.setInt(objMenuItem, "menuItemIndex", menuIndex)
	if menuItemString == kPotionTypeText
		JMap.setInt(objMenuItem, "autoAddItemType", AHMain.kPotionType)
	elseif menuItemString == kPoisonTypeText
		JMap.setInt(objMenuItem, "autoAddItemType", AHMain.kPoisonType)
	elseif menuItemString == kFoodTypeText
		JMap.setInt(objMenuItem, "autoAddItemType", AHMain.kFoodType)
	elseif menuItemString == kArrowTypeText
		JMap.setInt(objMenuItem, "autoAddItemType", AHMain.kArrowType)
	elseif menuItemString == kBoltTypeText
		JMap.setInt(objMenuItem, "autoAddItemType", AHMain.kBoltType)
	endIf
	return objMenuItem
endFunction

;============================= Settings Page No. 2 =============================

function UseCustomAltModifierKeyToggle()
endFunction
state UseCustomAltModifierKeyToggle
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "useCustomAltModifierKey")
		JMap.setInt(AHMain.objUserSettings, "useCustomAltModifierKey", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("UseCustomAltModifierKeyToggle() = " + theVal)
		AHMgr.SetupAltModifierKey()
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "useCustomAltModifierKey", (theVal as int))
		SetToggleOptionValueST(theVal)
		AHMgr.SetupAltModifierKey()
	endEvent

	event OnHighlightST()
		SetInfoText("Use custom modifier key instead of Alt.")
	endEvent
endState

function CustomAltModifierKeyMap()
endFunction
state CustomAltModifierKeyMap ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("CustomAltModifierKeyMap()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			JMap.setInt(AHMain.objUserSettings, "customAltModifierKey", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
			DebugMessage("CustomAltModifierKeyMap() = " + theKeyCode)
			AHMgr.SetupAltModifierKey()
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = JMap.getInt(AHMain.objUserSettings, "customAltModifierKey")
        SetKeyMapOptionValueST(theKeyCode)
        AHMgr.SetupAltModifierKey()
    endEvent

    event OnHighlightST()
        SetInfoText("Set modifier key to use instead of Alt.")
    endEvent
endState

function UseCustomControlModifierKeyToggle()
endFunction
state UseCustomControlModifierKeyToggle
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "useCustomControlModifierKey")
		JMap.setInt(AHMain.objUserSettings, "useCustomControlModifierKey", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("UseCustomControlModifierKeyToggle() = " + theVal)
		AHMgr.SetupControlModifierKey()
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "useCustomControlModifierKey", (theVal as int))
		SetToggleOptionValueST(theVal)
		AHMgr.SetupControlModifierKey()
	endEvent

	event OnHighlightST()
		SetInfoText("Use custom modifier key instead of Control.")
	endEvent
endState

function CustomControlModifierKeyMap()
endFunction
state CustomControlModifierKeyMap ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("CustomControlModifierKeyMap()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			JMap.setInt(AHMain.objUserSettings, "customControlModifierKey", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
			DebugMessage("CustomControlModifierKeyMap() = " + theKeyCode)
			AHMgr.SetupControlModifierKey()
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = JMap.getInt(AHMain.objUserSettings, "customControlModifierKey")
        SetKeyMapOptionValueST(theKeyCode)
        AHMgr.SetupControlModifierKey()
    endEvent

    event OnHighlightST()
        SetInfoText("Set modifier key to use instead of Control.")
    endEvent
endState

function UseCustomShiftModifierKeyToggle()
endFunction
state UseCustomShiftModifierKeyToggle
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "useCustomShiftModifierKey")
		JMap.setInt(AHMain.objUserSettings, "useCustomShiftModifierKey", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("UseCustomShiftModifierKeyToggle() = " + theVal)
		AHMgr.SetupShiftModifierKey()
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "useCustomShiftModifierKey", (theVal as int))
		SetToggleOptionValueST(theVal)
		AHMgr.SetupShiftModifierKey()
	endEvent

	event OnHighlightST()
		SetInfoText("Use custom modifier key instead of Shift.")
	endEvent
endState

function CustomShiftModifierKeyMap()
endFunction
state CustomShiftModifierKeyMap ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("CustomShiftModifierKeyMap()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			JMap.setInt(AHMain.objUserSettings, "customShiftModifierKey", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
			DebugMessage("CustomShiftModifierKeyMap() = " + theKeyCode)
			AHMgr.SetupShiftModifierKey()
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = JMap.getInt(AHMain.objUserSettings, "customShiftModifierKey")
        SetKeyMapOptionValueST(theKeyCode)
        AHMgr.SetupShiftModifierKey()
    endEvent

    event OnHighlightST()
        SetInfoText("Set modifier key to use instead of Shift.")
    endEvent
endState

function UseCustomModifierKey4Toggle()
endFunction
state UseCustomModifierKey4Toggle
	event OnSelectST()
		bool theVal = !JMap.getInt(AHMain.objUserSettings, "useCustomModifierKey4")
		JMap.setInt(AHMain.objUserSettings, "useCustomModifierKey4", theVal as int)
		SetToggleOptionValueST(theVal)
		DebugMessage("UseCustomModifierKey4Toggle() = " + theVal)
		AHMgr.SetupModifierKey4()
	endEvent

	event OnDefaultST()
		bool theVal = false
		JMap.setInt(AHMain.objUserSettings, "useCustomModifierKey4", (theVal as int))
		SetToggleOptionValueST(theVal)
		AHMgr.SetupModifierKey4()
	endEvent

	event OnHighlightST()
		SetInfoText("Use a 4th modifier key.")
	endEvent
endState

function CustomModifierKey4KeyMap()
endFunction
state CustomModifierKey4KeyMap ; KEYMAP
    event OnKeyMapChangeST(int theKeyCode, string conflictControl, string conflictName)
    	DebugMessage("CustomModifierKey4KeyMap()")
		bool acceptKey = true
    	if (conflictControl != "")
    		if StringUtil.find(conflictControl, "hotkey") == -1 ; Don't report conflict if for keys or keypad keys 1-8 (i.e. "hotkey1" to "hotkey8")
	            string msg
	            if (conflictName != "")
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
	            else
	                msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
	            endIf
	            if !ShowMessage(msg, true, "$Yes", "$No")
	            	acceptKey = false
	            endIf
			endIf
        endIf		
		if acceptKey
			JMap.setInt(AHMain.objUserSettings, "customModifierKey4", theKeyCode)
	        SetKeyMapOptionValueST(theKeyCode)
			DebugMessage("CustomModifierKey4KeyMap() = " + theKeyCode)
			AHMgr.SetupModifierKey4()
		endIf
    endEvent

    event OnDefaultST()
        int theKeyCode = JMap.getInt(AHMain.objUserSettings, "customModifierKey4")
        SetKeyMapOptionValueST(theKeyCode)
        AHMgr.SetupModifierKey4()
    endEvent

    event OnHighlightST()
        SetInfoText("Set a custom 4th modifier key to use.")
    endEvent
endState

; function SetupSettings2Page()
; 	DebugMessage("SetupSettings2Page()")
; 	currentMCMPage = kSettings2PageTitle
; 	if !AHMain.installed || !AHMain.active
; 		AddTextOptionST("UninstalledText", AHMain.modName + " is deactivated.", "", OPTION_FLAG_DISABLED)
; 	endIf
; 	SetCursorPosition(0)
; 	SetCursorFillMode(TOP_TO_BOTTOM)
; 	if AHMain.installed && AHMain.active
; 		AddHeaderOption("Customise Modifier Keys")
; 		AddToggleOptionST("UseCustomAltModifierKeyToggle", "Use custom Alt modifier key", JMap.getInt(AHMain.objUserSettings, "useCustomAltModifierKey"))
; 		AddKeyMapOptionST("CustomAltModifierKeyMap", "Custom Alt modifier key", JMap.getInt(AHMain.objUserSettings, "customAltModifierKey"), OPTION_FLAG_WITH_UNMAP)
; 		AddToggleOptionST("UseCustomControlModifierKeyToggle", "Use custom Control modifier key", JMap.getInt(AHMain.objUserSettings, "useCustomControlModifierKey"))
; 		AddKeyMapOptionST("CustomControlModifierKeyMap", "Custom Control modifier key", JMap.getInt(AHMain.objUserSettings, "customControlModifierKey"), OPTION_FLAG_WITH_UNMAP)
; 		AddToggleOptionST("UseCustomShiftModifierKeyToggle", "Use custom Shift modifier key", JMap.getInt(AHMain.objUserSettings, "useCustomShiftModifierKey"))
; 		AddKeyMapOptionST("CustomShiftModifierKeyMap", "Custom Shift modifier key", JMap.getInt(AHMain.objUserSettings, "customShiftModifierKey"), OPTION_FLAG_WITH_UNMAP)
; 		AddToggleOptionST("UseCustomModifier4KeyToggle", "Use custom modifier 4 key", JMap.getInt(AHMain.objUserSettings, "useCustomModifier4Key"))
; 		AddKeyMapOptionST("CustomModifier4KeyMap", "Custom modifier 4 key", JMap.getInt(AHMain.objUserSettings, "customModifier4Key"), OPTION_FLAG_WITH_UNMAP)
; 	endIf
; endFunction

function SetupTitlePage()
	SetCursorPosition(0)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("AH Hotkeys")
	AddEmptyOption()
endFunction

function SetupInformationPage()
	DebugMessage("SetupInformationPage()")
	if !AHMain.installed || !AHMain.active
		AddTextOptionST("UninstalledText", AHMain.modName + " is deactivated.", "", OPTION_FLAG_DISABLED)
		return
	endIf
	currentMCMPage = kInformationPageTitle
	int numEquipSets = JArray.count(AHMain.objEquipSetArray)
	int objHotkeyGroupIDArray = JMap.getObj(AHMain.objHotkeyGroups, "hotkeyGroupIDArray")
	SetCursorPosition(0)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("HotKey Set info")
	AddTextOptionST("VersionText", "Version:", "v." + AHMain.GetMajorVersion() + "." + AHMain.GetMinorVersion() + "." + AHMain.GetSubVersion(), OPTION_FLAG_DISABLED)
	AddTextOptionST("NumEquipSetsText", "Number of EquipSets:", numEquipSets, OPTION_FLAG_DISABLED)
	AddTextOptionST("NumHotkeyGroupsText", "Number of Hotkey Groups:", JArray.count(objHotkeyGroupIDArray), OPTION_FLAG_DISABLED)
	AddTextOptionST("NumInventoryItems", "Number of Inventory Items:", JArray.count(AHMain.objInventoryItemArray), OPTION_FLAG_DISABLED)
	AddTextOptionST("ItemCacheSize", "Size of Item Cache:", JFormMap.count(AHMain.objItemFormCache), OPTION_FLAG_DISABLED)
	AddTextOptionST("ItemIDCacheSize", "Size of ItemID Cache:", JMap.count(AHMain.objItemIDCache), OPTION_FLAG_DISABLED)
	AddTextOptionST("NumMacros", "Number of Macros:", JArray.count(AHMain.objMacroArray), OPTION_FLAG_DISABLED)
endFunction

int kDevPage_DisplayFormFromIDButton
int kDevPage_UpdateHotKeySet
int kDevPage_WriteDebugJDB
int kDevPage_PrintItemFormCache
int kDevPage_PrintInventoryArray
int kDevPage_JCAPIDebugging
int kDevPage_InventoryArrayFormsTest

function SetupDevPage()
	currentMCMPage = kDevPageTitle
	SetCursorPosition(0)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("***Dev***")
	kDevPage_WriteDebugJDB = AddTextOption("Write Debug JDB File", "")
	kDevPage_JCAPIDebugging = AddToggleOption("JC API Debug", AHMain.bJCAPIDebugging)
	kDevPage_PrintItemFormCache = AddTextOption("Print Debug ItemFormCache", "")
	kDevPage_PrintInventoryArray = AddTextOption("Print Debug InventoryArray", "")
	kDevPage_UpdateHotKeySet = AddTextOption("Update HotKeySet", "")
	kDevPage_DisplayFormFromIDButton = AddTextOption("Display form from formID", "")
	kDevPage_InventoryArrayFormsTest = AddTextOption("Inventory Array Forms Test", "")
endFunction

function OnOptionSelect_DevPage(int optionID)
	if optionID == kDevPage_DisplayFormFromIDButton
		int formID = AHUtils.ShowUILibTextInput("Display form from formID", "") as int
		form theForm = Game.GetFormEx(formID)
		string itemName
		if theForm
			itemName = theForm.GetName()
		endIf
		Debug.MessageBox("Form = "+theForm+" ("+itemName+")")
	elseif optionID == kDevPage_UpdateHotKeySet
		AHMain.UpdateHotKeySetTo40()
		Debug.MessageBox("Hotkeyset updated.")
	elseif optionID == kDevPage_InventoryArrayFormsTest
		Dev_InventoryArrayFormsTest()
	elseif optionID == kDevPage_WriteDebugJDB
		AHMain.WriteDebugJDBFile()
		Debug.MessageBox("Done.")
	elseif optionID == kDevPage_PrintItemFormCache
		AHMain.PrintJObject(AHMain.objItemFormCache, "ItemFormCache:")
		Debug.MessageBox("Check Log for print output.")
	elseif optionID == kDevPage_PrintInventoryArray
		AHMain.PrintInventoryItemArray(AHMain.objInventoryItemArray, "Inventory Array:")
		JLua.evalLuaInt("AH_Hotkeys.PrintItemArray2(args.objInventoryItemArray)", JLua.setObj("objInventoryItemArray", AHMain.objInventoryItemArray))
		Debug.MessageBox("Check Log for print output.")
	elseif optionID == kDevPage_JCAPIDebugging
		AHMain.bJCAPIDebugging = !AHMain.bJCAPIDebugging
		SetToggleOptionValue(optionID, AHMain.bJCAPIDebugging)
	endIf
endFunction

int property objInventoryFormTestArray auto hidden
function Dev_InventoryArrayFormsTest()
	if !objInventoryFormTestArray
		AHMain.inventoryFormList.Revert()
		playerREF.GetAllForms(AHMain.inventoryFormList)
		objInventoryFormTestArray = JArray.object()
		JValue.retain(objInventoryFormTestArray)
		JArray.addFromFormList(objInventoryFormTestArray, AHMain.inventoryFormList)
		DebugMessage("Dev_InventoryArrayFormsTest(): objInventoryFormTestArray object created and filled with inventory. Count = "+JArray.count(objInventoryFormTestArray))
	endIf
	int numItems = JArray.count(objInventoryFormTestArray)
	JLua.evalLuaInt("AH_Hotkeys.InventoryFormArrayTest(args.formArray)", JLua.setObj("formArray", objInventoryFormTestArray))
	Debug.MessageBox("Check Log for print output.")
endFunction

string property lastHotKeyEditorMCMPage auto hidden
string property currentMCMPage auto hidden
event OnPageReset(string page)
	; DebugMessage("OnPageReset(): page = " + page + "; objInventoryFormArray empty = " + JValue.empty(AHMain.objInventoryFormArray) + "; objInventoryFormArray count = " + JValue.count(AHMain.objInventoryFormArray) + "; AHHotkeys installed = " + AHMain.installed)
	OnPageResetInProgress = true
	if (page == "")
		if lastHotKeyEditorMCMPage == kMacroPageTitle
			SetupMacroPage(objCurrentMacro)
		else ; lastHotKeyEditorMCMPage == kEquipSetPageTitle
			SetupEquipSetPage()
		endIf
	elseif page == kEquipSetPageTitle
		SetupEquipSetPage()
	elseif page == kMacroPageTitle
		SetupMacroPage(objCurrentMacro)
	elseif page == kConfigPageTitle
		SetupConfigPage()
	elseif page == kConfig2PageTitle
		SetupConfig2Page()
	elseif page == kWizardsPageTitle
		SetupWizardsPage()
	; elseif page == "Settings 2"
	; 	SetupSettings2Page()
	elseif page == kInformationPageTitle
		SetupInformationPage()
	elseif page == kDevPageTitle
		SetupDevPage()
	endIf
	OnPageResetInProgress = false
endEvent

event OnConfigOpen()
	AHMain.disableMacros = true
	enableQuickExitMCM = true
	quickExitMCMStartCooldownTime = Utility.GetCurrentRealTime()
	DebugMessage("OnConfigOpen(): objInventoryItemArray empty = " + JValue.empty(AHMain.objInventoryItemArray) + "; objInventoryItemArray count = " + JValue.count(AHMain.objInventoryItemArray) + "; AHHotkeys installed = " + AHMain.installed)
	; DebugMessage("objInventoryFormArray count = " + JArray.count(AHMain.objInventoryFormArray))
	if !AHMain.installed || !AHMain.modInstalledCorrectly
		string theString
		if AHMain.modInstalledCorrectly
			theString = "AH Hotkeys is not installed and is currently deactivated. Go to the Configuration Page to complete installation."
		else
			theString = "ERROR: AH Hotkeys has not been installed correctly. Go to the Nexus page to review the installation instructions for help."
		endIf
		ShowMessage(theString, false)
	elseif AHMain.installed && !AHMain.active
		; DoInitialConfigMenuSetup()
		string theString = "This is the " + AHMain.modName + " configuration menu where you can set up EquipSets as well as change various settings.\n\n" + "To begin, go to the Configuration menu to Activate the mod and then scan your inventory. Inventory lists will not be populated until you do. Note this will not pick up shouts. Shouts must be equipped first in order to show in the inventory lists."
		ShowMessage(theString, false)
	elseif AHMain.installed
		float startTime = Utility.GetCurrentRealTime()
		ClearMCMTempVars()
		if objCurrentEquipSet
			BackupEquipSet(objCurrentEquipSet)
		endIf
		if objCurrentMacro
			BackupMacro(objCurrentMacro)
		endIf
		; objAutoAddEquipSetsUpdatedArray = JValue.addToPool(JArray.object(), AHMain.JCTempPoolClearOnCloseMCM)
		; AHMain.PrintJObject(AHMain.objItemFormCache, "OnConfigOpen(): objItemFormCache before", debugLevels_kDebug)
		bool autoUpdateInventoryItemsInMenu = JMap.getInt(AHMain.objUserSettings, "autoUpdateInventoryItemsInMenu") as bool
		bool autoUpdateSpellsInMenu = JMap.getInt(AHMain.objUserSettings, "autoUpdateSpellsInMenu") as bool
		AHMain.GetAllInventoryItems(false, false, autoUpdateInventoryItemsInMenu, autoUpdateSpellsInMenu, false)
		; AHMain.PrintJObject(AHMain.objItemFormCache, "OnConfigOpen(): objItemFormCache after", debugLevels_kDebug)
		float startUpdateWornItemsTime = Utility.GetCurrentRealTime()

		; AHMain.UpdateEquippedAndWornItems_Threaded(leftHand = true, rightHand = true, apparel = true, clearApparelArray = true, objEquipSetItemsArray = 0, apparelItemSlotMask = 0)
		
		; AHMain.WaitUntilGetInventoryThreadsFinish()
		bool filterWeaponFavorites = JMap.getInt(AHMain.objUserSettings, "filterWeaponFavorites") as bool
		bool filterArmorFavorites = JMap.getInt(AHMain.objUserSettings, "filterArmorFavorites") as bool
		bool filterSpellFavorites = JMap.getInt(AHMain.objUserSettings, "filterSpellFavorites") as bool

		RegisterForModEvent("AHHotkeys_UpdateFavoritesEvent", "UpdateFavoritesEvent")
		int updateFavoritesEventHandle
		; Set number of all threads to 1 each. There is no discernible speed increase from multiple threads due to the papyrus inventory functions being bottlenecked by accessing the same shared player inventory object.
		updateFavoritesThreadsStarted = true
		DebugMessage("Updating favorited items: creating threads for weapons, armour and spells...")
		if filterWeaponFavorites
			updateFavoritesEventHandle = ModEvent.Create("AHHotkeys_UpdateFavoritesEvent")
			ModEvent.PushBool(updateFavoritesEventHandle, filterWeaponFavorites)
			ModEvent.PushBool(updateFavoritesEventHandle, false)
			ModEvent.PushBool(updateFavoritesEventHandle, false)
			ModEvent.Send(updateFavoritesEventHandle)
		endIf
		if filterArmorFavorites
			updateFavoritesEventHandle = ModEvent.Create("AHHotkeys_UpdateFavoritesEvent")
			ModEvent.PushBool(updateFavoritesEventHandle, false)
			ModEvent.PushBool(updateFavoritesEventHandle, filterArmorFavorites)
			ModEvent.PushBool(updateFavoritesEventHandle, false)
			ModEvent.Send(updateFavoritesEventHandle)
		endIf
		if filterSpellFavorites
			updateFavoritesEventHandle = ModEvent.Create("AHHotkeys_UpdateFavoritesEvent")
			ModEvent.PushBool(updateFavoritesEventHandle, false)
			ModEvent.PushBool(updateFavoritesEventHandle, false)
			ModEvent.PushBool(updateFavoritesEventHandle, filterSpellFavorites)
			ModEvent.Send(updateFavoritesEventHandle)
		endIf
		; UpdateFavoritesEvent(filterWeaponFavorites, filterArmorFavorites, filterSpellFavorites)
		float endTime = Utility.GetCurrentRealTime()
		float elapsedTime = endTime - startTime
		DebugMessage("OnConfigOpen(): UpdateEquippedAndWornItems time = " + (endTime - startUpdateWornItemsTime) + " s; total time taken = " + elapsedTime + " s.")
	endIf
endEvent

event OnConfigClose()
	if AHMain.installed && AHMain.active
		AHMain.disableMacros = false
		enableQuickExitMCM = false
		AHMain.jumpKey = Input.GetMappedKey("Jump", 0xFF)
		AHSpells.rightHandAttackKey = Input.GetMappedKey("Right Attack/Block", AHMain.kDeviceType_AutoCast)
		AHSpells.leftHandAttackKey = Input.GetMappedKey("Left Attack/Block", AHMain.kDeviceType_AutoCast)

		float startTime = Utility.GetCurrentRealTime()
		JLua.evalLuaInt("return AH_Hotkeys.CheckAndAutoAddAllItemsToAllEquipSets(args.objEquipSetArray, args.objInventoryArray)", JLua.setObj("objEquipSetArray", AHMain.objEquipSetArray, JLua.setObj("objInventoryArray", AHMain.objInventoryItemArray)))
		float endTime = Utility.GetCurrentRealTime()
		float elapsedTime = endTime - startTime
		DebugMessage("CheckAndAutoAddAllItemsToEquipSet: time taken = " + elapsedTime)
	endIf
	ClearMCMTempVars()
EndEvent

function ClearMCMTempVars()
	JValue.cleanPool(JCTempPoolClearOnCloseMCM)	
	JValue.cleanPool(JCTempPoolClearOnKeyDown)
	JValue.cleanPool(JCTempLocalPool)
	objIngredientItemsUpdatedArray = 0
	objMacroItemOptionIDArray = 0
	JArray.clear(objAutoAddEquipSetsUpdatedArray)
endFunction

; event OnKeyDown(int keyCode)
; 	if !AHMain.loaded
; 		return
; 	endIf
; 	; DebugMessage("ConfigMenu: OnKeyDown()")
; endEvent

	; Container Property AHHContainerObject auto; populated by CK
	; ObjectReference Property AHHContainerObjectReference auto ; populated by script
	; ReferenceAlias Property AHHContainerAlias auto ; populated by CK, but Alias is filled by script, not by CK

; function Dev_RunInventoryTest()
; endFunction
; state Dev_RunInventoryTest
; 	event OnSelectST()
; 		AHHContainerObjectReference = playerREF.PlaceAtMe(AHHContainerObject)
; 		; AHHContainerAlias.ForceRefTo(AHHContainerObjectReference)
; 		DebugMessage("Dev_RunInventoryTest(): AH Hotkeys container = " + AHHContainerObjectReference.GetDisplayName())
; 		bool aBool = AHHContainerObjectReference.Activate(AHHContainerObjectReference, true)
; 		DebugMessage("AHHContainerObjectReference.Activate = " + aBool)
; 		DebugMessage("IsMenuOpen(configpanel): " + UI.IsMenuOpen("configpanel"))
; 		; AHHContainerObjectReference.Disable()
; 	    ; AHHContainerObjectReference.Delete()
; 	endEvent
; endState

; function Dev_InitialiseConfigMenu()
; endFunction
; state Dev_InitialiseConfigMenu
; 	event OnSelectST()
; 		InitialiseVariables()
; 	endEvent
; endState

; function Dev_DoFunction()
; endFunction
; state Dev_DoFunction
; 	event OnSelectST()
; 		; Test storing and retrieving of objectReferences in JArray and returned values.
; 		int testArray = JArray.object()
; 		DebugMessage("Dev_DoFunction(): testObjectRef before placeAtMe = " + testObjectRef)
; 		ObjectReference testObjectRef = playerREF.PlaceAtMe(AHUtils.AHHMesgObject)
; 		DebugMessage("Dev_DoFunction(): testObjectRef after placeAtMe = " + testObjectRef)
; 		JArray.setForm(testArray, 0, testObjectRef)
; 		ObjectReference returnedObjectRef = JArray.getForm(testArray, 0) as ObjectReference
; 		Form returnedForm = JArray.getForm(testArray, 0)
; 		DebugMessage("Dev_DoFunction(): JArray.getForm(0); returnedObjectRef = " + returnedObjectRef)
; 		DebugMessage("Dev_DoFunction(): JArray.getForm(0); returnedForm = " + returnedForm)

; 		testObjectRef.Disable()
; 	    testObjectRef.Delete()
; 		returnedObjectRef = JArray.getForm(testArray, 0) as ObjectReference
; 		returnedForm = JArray.getForm(testArray, 0)
; 		DebugMessage("Dev_DoFunction(): testObjectRef after Delete() = " + testObjectRef)
; 		DebugMessage("Dev_DoFunction(): JArray.getForm(0) after object deleted; returnedObjectRef = " + returnedObjectRef)
; 		DebugMessage("Dev_DoFunction(): JArray.getForm(0) after object deleted; returnedForm = " + returnedForm)
; 	endEvent
; endState

; function Dev_InitialiseAHHotkeys()
; endFunction
; state Dev_InitialiseAHHotkeys
; 	event OnSelectST()
; 		AHMain.Initialise()
; 		DebugMessage("Done.", false, true)
; 	endEvent
; endState

; function Dev_TestJContainerFunction()
; endFunction
; state Dev_TestJContainerFunction
; 	event OnSelectST()
; 		int objJMap = JMap.object()
; 		DebugMessage("JMap.object(objJMap): = " + objJMap + "; empty = " + (objJMap == 0))
; 		JMap.setStr(objJMap, "key1", "Some String")
; 		DebugMessage("JMap.setStr(objJMap, 'key1', 'Some String'); empty = " + (objJMap == 0))
; 		JValue.clear(objJMap)
; 		DebugMessage("JValue.clear(objJMap); empty = " + (objJMap == 0))
; 		DebugMessage("Done.", false, true)
; 	endEvent
; endState

; function Dev_PrintInventoryAndItemCacheArrays()
; endFunction
; state Dev_PrintInventoryAndItemCacheArrays
; 	event OnSelectST()
; 		AHMain.PrintInventoryAndItemCacheArrays()
; 	endEvent
; endState

; function Dev_ClearAllJObjects()
; endFunction
; state Dev_ClearAllJObjects
; 	event OnSelectST()
; 		DebugMessage("Dev_ClearAllJObjects()")
; 		bool contineLoop
; 		int maxObjectCountAfterEmpty = 100
; 		int i
; 		int jObjectNum = 0
; 		int maxIterations = 20
; 		int numIteration
; 		int maxSize
; 		string theJDBKey

; 		; Clear JDB objects
; 		int objJDBKeysArray = JDB.allKeys()
; 		maxSize = JArray.count(objJDBKeysArray)
; 		DebugMessage("Dev_ClearAllJObjects(): delete all JDB objects; number of objects = " + maxSize)
; 		while i < maxSize
; 			theJDBKey = JArray.getStr(objJDBKeysArray, i)
; 			JDB.setObj(theJDBKey, 0)
; 			i += 1
; 		EndWhile
; 		; Delete non-JDB objects
; 		jObjectNum = 0
; 		i = maxObjectCountAfterEmpty
; 		while i > 0
; 			if (jObjectNum == 0)
; 				i -= 1
; 				; DebugMessage("jObjectNum " + jObjectNum + " empty. i = " + i)
; 			else
; 				numIteration = 0
; 				while !JValue.empty(jObjectNum) && (numIteration <= maxIterations)
; 					numIteration += 1
; 					JValue.release(jObjectNum)
; 					; DebugMessage("jObjectNum " + jObjectNum + " not empty. Released. i = " + i)
; 				EndWhile
; 				i = maxObjectCountAfterEmpty
; 			endIf
; 			jObjectNum += 1
; 		EndWhile
; 		DebugMessage("Dev_ClearAllJObjects(): delete all non-JDB objects finished; last jObjectNum checked = " + jObjectNum)
; 		DebugMessage("Done.", false, true)
; 	endEvent
; endState

; bool eventFinished
; event GetInventoryItemsEvent(int objFormMap, int startIndex, int endIndex)
; 	; DebugMessage("GetInventoryItemsEvent(): objFormMap = " + objFormMap + "; startIndex = " + startIndex + "; endIndex = " + endIndex)
; 	float startTime = utility.GetCurrentRealTime()
; 	form itemForm
; 	int i = startIndex
; 	While i <= endIndex
; 		eventFinished = false
; 		itemForm = AHMain.inventoryFormList.GetAt(i)
; 		JFormMap.setObj(objFormMap, itemForm, AHMain.NewItemObject(itemForm))
; 		; DebugMessage("while: itemForm = " + itemForm + "; objInventoryForm name = " + JMap.getStr(JFormMap.getObj(objFormMap, itemForm), "itemName"))
; 		i += 1
; 	EndWhile
; 	float endTime = utility.GetCurrentRealTime()
; 	float elapsedTime = endTime - startTime
; 	DebugMessage("GetInventoryItemsEvent(): " + startIndex + "-" + endIndex + "; elapsed = " + elapsedTime + "; startTime = " + startTime + "; endTime = " + endTime)
; 	eventFinished = true
; endEvent

; Function Dev_TestTimings()
; EndFunction
; State Dev_TestTimings
; 	Event OnSelectST()
; 		float startTime
; 		float endTime
; 		float elapsedTime
; 		form itemForm
; 		string itemName
; 		int itemType
; 		int numMagicEffects
; 		int i
; 		int getInventoryItemsEventHandle
; 		int startIndex
; 		int endIndex
; 		SetTextOptionValueST("Running Test...")

; 		playerREF.GetAllForms(AHMain.inventoryFormList)
; 		int arraySize = AHMain.inventoryFormList.GetSize()
; 		int numThreads = 4
; 		int threadArraySize = arraySize / numThreads
; 		int objTestFormMap = JValue.addToPool(JFormMap.object(), "AH_Hotkeys_Temp")
; 		GetInventoryItemsEvent(objTestFormMap, 0, (arraySize - 1))
; 		form randomForm = playerREF.GetNthForm(234)
; 		int objInventoryItem = JFormMap.getObj(objTestFormMap, randomForm)
; 		DebugMessage("RandomForm name = " + randomForm.getName() + "; returned objInventoryItem name = " + JMap.getStr(objInventoryItem, "itemName"))

; 		startTime = utility.GetCurrentRealTime()

; 		DebugMessage("Test cycle through JFormMap: numItems = " + JValue.count(objTestFormMap))
; 		int objTestFormValueArray = JValue.addToPool(JFormMap.allValues(objTestFormMap), "AH_Hotkeys_Temp")
; 		i = 0

; 		endTime = utility.GetCurrentRealTime()
; 		elapsedTime = endTime - startTime
; 		DebugMessage("Dev_TestTimings(objTestFormValueArray): elapsed time = " + elapsedTime)

; 		JValue.cleanPool("AH_Hotkeys_Temp")
; 		SetTextOptionValueST("Test completed")
; 	EndEvent
; EndState

; function Dev_TestTimings_Old1()
; endFunction
; state Dev_TestTimings_Old1
; 	event OnSelectST()
; 		float startTime
; 		float endTime
; 		float elapsedTime

; 		int theObject = JValue.objectFromPrototype("[1,2,3,4,5,6]")
; 		int foundValue = JValue.solveInt(theObject, "return count(jobject, less(7))");  should return 5 
; 		DebugMessage("Minor LUA find = " + foundValue)

; 		; TEST JC LUA FIND FUNCTIONS VS PAPYRUS
; 		; foundIndex = JValue.solveInt(objInventoryItemArray, "return find(jobject, function(x) return x.itemForm == " + itemForm + " end)")
; 		int objTestArray = JValue.objectFromPrototype("[100,200,300,400,500,600]")

; 		int numItems = JArray.count(objTestArray)
; 		int foundIndex
; 		int foundInt
; 		int intToFind = 200
; 		string stringToFind = "hello3"
; 		string foundString
; 		int numIteration = 0
; 		int maxIterations = 100
; 		SetTextOptionValueST("Running Test...")
; 		DebugMessage("Dev_TestTimings(): papyrus find vs LUA for " + maxIterations + " iterations. numItems = " + numItems + "; int = " + intToFind)
; 		startTime = utility.GetCurrentRealTime()
; 		while numIteration < maxIterations
; 			int i = 0
; 			while i < numItems
; 				foundInt = JArray.getInt(objTestArray, i)
; 				if foundInt == intToFind
; 					foundIndex = i
; 				endIf
; 				i += 1
; 			EndWhile
; 			numIteration += 1
; 		EndWhile
; 		endTime = utility.GetCurrentRealTime()
; 		elapsedTime = endTime - startTime
; 		DebugMessage("Dev_TestTimings(): papyrus find index #" + foundIndex + "; elapsed time = " + elapsedTime)

; 		foundIndex = -2
; 		numIteration = 0
; 		startTime = utility.GetCurrentRealTime()
; 		while numIteration < maxIterations
; 			foundValue = JValue.solveInt(objTestArray, "return count(jobject, less(600))")
; 			numIteration += 1
; 		EndWhile
; 		endTime = utility.GetCurrentRealTime()
; 		elapsedTime = endTime - startTime
; 		DebugMessage("Dev_TestTimings(): LUA find index #" + foundIndex + "; count equals = " + foundValue + "; elapsed time = " + elapsedTime)

; 		SetTextOptionValueST("Test completed")
; 	endEvent
; endState

function Uninstall()
	DebugMessage("ConfigMenu: Uninstall()")
	filterByMagicEffectMenuList = none
	filterByItemTypeMenuList = none
	filterByMagicEffectMenuList = none
	optionsMenuList = none
	cycleEquipModeMenuList = none
	sortMenuList = none
	equipModeMenuList = none
	equipModeDisplayStrings = none
	numShoutWordsDisplayStrings = none
	equipModeStrings = none
endFunction

function InitialiseMenuStringsArrayObject()
	if objMenuListStringsArray == 0 
		objMenuListStringsArray = JArray.object()
		DebugMessage("InitialiseEquipSetQueueObject(): new objMenuListStringsArray = " + objMenuListStringsArray)
	endIf
endFunction


function InitialiseAutoAddEquipSetsUpdatedArray()
	if !objAutoAddEquipSetsUpdatedArray
		objAutoAddEquipSetsUpdatedArray = JArray.object()
		if AHMain.debugLevel >= AHMain.debugLevels_kNotice
			DebugMessage("InitialiseTempArrayObject(): new objAutoAddEquipSetsUpdatedArray = " + objAutoAddEquipSetsUpdatedArray, AHMain.debugLevels_kNotice)
		endIf
	endIf
	JArray.clear(objAutoAddEquipSetsUpdatedArray)
endfunction

function InitialiseVariables()
	kMCMTitle = AHMain.modName
	ModName = kMCMTitle
	DebugMessage("ConfigMenu: InitialiseVariables(): " + ModName)
	kEquipSetPageTitle = "EquipSets"
	kMacroPageTitle = "Macros"
	kConfigPageTitle = "Configuration"
	kConfig2PageTitle = "Configuration 2"
	kWizardsPageTitle = "Wizards"
	kSettings2PageTitle = "Settings 2"
	kInformationPageTitle = "Information"
	kDevPageTitle = "**Dev**"
	kEquipSetPageIndex = 0
	kMacroPageIndex = 1
	kConfigPageIndex = 2
	kConfig2PageIndex = 3
	kWizardsPageIndex = 4
	kInformationPageIndex = 5
	kDevPageIndex = 6
	pages = new string[7]
	pages[0] = kEquipSetPageTitle
	pages[1] = kMacroPageTitle
	pages[2] = kConfigPageTitle
	pages[3] = kConfig2PageTitle
	pages[4] = kWizardsPageTitle
	; pages[2] = "Settings 2"
	pages[5] = kInformationPageTitle
	if AHMain.devOptions
		pages[6] = kDevPageTitle
	endIf
	lastHotKeyEditorMCMPage = ""

	kDeviceType_AutoDetectString = "Auto Detect"
	kDeviceType_KeyboardString = "Keyboard"
	kDeviceType_MouseString = "Mouse"
	kDeviceType_GamepadString = "Gamepad"

	healthEffectString = "health"
	magickaEffectString = "magicka"
	staminaEffectString = "stamina"
	hungerEffectString = "hunger"

	filterByMagicEffectMenuList = new string[7]
	;All, Health only, Magicka only, Stamina only, Other only
	filterByMagicEffectMenuList[0] = "All Effects"
	filterByMagicEffectMenuList[1] = "Health Effects"
	filterByMagicEffectMenuList[2] = "Magicka Effects"
	filterByMagicEffectMenuList[3] = "Stamina Effects"
	filterByMagicEffectMenuList[4] = "Hunger Effects"
	filterByMagicEffectMenuList[5] = "Other Effects"
	filterByMagicEffectMenuList[6] = "Custom filter..."
	kAllMagicEffects = 0
	kHealthEffect = 1
	kMagickaEffect = 2
	kStaminaEffect = 3
	kHungerEffect = 4
	kOtherEffect = 5
	kCustomEffect = 6

	filterByItemTypeMenuList = new string[12]
	filterByItemTypeMenuList[0] = "All"
	filterByItemTypeMenuList[1] = "Weapons"
	filterByItemTypeMenuList[2] = "Armor"
	filterByItemTypeMenuList[3] = "Spells"
	filterByItemTypeMenuList[4] = "Scrolls"
	filterByItemTypeMenuList[5] = "Potions"
	filterByItemTypeMenuList[6] = "Food"
	filterByItemTypeMenuList[7] = "Ingredients"
	filterByItemTypeMenuList[8] = "Poisons"
	filterByItemTypeMenuList[9] = "Ammo"
	filterByItemTypeMenuList[10] = "Other Items"
	filterByItemTypeMenuList[11] = "EquipSets"

	kFilterByAllTypes = 0
	kFilterByWeapons = 1
	kFilterByArmor = 2
	kFilterBySpells = 3
	kFilterByScrolls = 4
	kFilterByPotions = 5
	kFilterByFood = 6
	kFilterByIngredients = 7
	kFilterByPoisons = 8
	kFilterByAmmo = 9
	kFilterByOther = 10
	kFilterByEquipSets = 11

	optionsMenuList = new string[9]
	optionsMenuList[0] = "Cancel"
	optionsMenuList[1] = "Go Back to Previous Equipset"
	optionsMenuList[2] = "Get All Equipped Items"
	optionsMenuList[3] = "New Auto Add Item"
	optionsMenuList[4] = "Remove All Items"
	optionsMenuList[5] = "Remove Invalid Items"
	optionsMenuList[6] = "Remove All Auto Add Items"
	optionsMenuList[7] = "Convert All Items to Generic"
	optionsMenuList[8] = "Convert All Items to Specific"
	kOptionsMenuItem_Cancel = 0
	kOptionsMenuItem_GoBackToPreviousEquipset = 1
	kOptionsMenuItem_GetAllEquippedItems = 2
	kOptionsMenuItem_NewAutoAddItem = 3
	kOptionsMenuItem_RemoveAllItems = 4
	kOptionsMenuItem_RemoveInvalidItems = 5
	kOptionsMenuItem_RemoveAllAutoAddItems = 6
	kOptionsMenuItem_ConvertAllItemsToGeneric = 7
	kOptionsMenuItem_ConvertAllItemsToSpecific = 8

	cycleEquipModeMenuList = new string[4]
	cycleEquipModeMenuList[0] = "Cycle to next item"
	cycleEquipModeMenuList[1] = "Reset to last item if different"
	cycleEquipModeMenuList[2] = "Reset cycle if different"
	cycleEquipModeMenuList[3] = "Reset cycle on timeout"
	kCycleEquipMode_NoReset = 0
	kCycleEquipMode_ResetToPrevItemIfDifferent = 1
	kCycleEquipMode_ResetToFirstItemIfDifferent = 2
	kCycleEquipMode_ResetToFirstItemOnTimeOut = 3
	kCycleEquipMode_defaultTimeout = 5.0

	sortMenuList = new string[3]
	sortMenuList[0] = "Custom"
	sortMenuList[1] = "Highest to Lowest Effect"
	sortMenuList[2] = "Lowest to Highest Effect"
	kSortMenuItem_Cancel = 0
	kSortMenuItem_HighestToLowestMagicEffect = 1
	kSortMenuItem_LowestToHighestMagicEffect = 2

	equipModeMenuList = new string[5]
	equipModeMenuList[0] = "Equip all items with single keypress"
	equipModeMenuList[1] = "Equip all, but toggle last equipped items"
	equipModeMenuList[2] = "Cycle through and equip items one at a time"
	equipModeMenuList[3] = "Equip all, but toggle between equip/unequip"
	equipModeMenuList[4] = "Drop all items in EquipSet"

	equipModeDisplayStrings = new string[5]
	equipModeStrings = equipModeDisplayStrings ; duplicated variable into property to avoid papyrus errors.
	equipModeDisplayStrings[0] = "All items"
	equipModeDisplayStrings[1] = "Toggle last equipped"
	equipModeDisplayStrings[2] = "Cycle one at a time"
	equipModeDisplayStrings[3] = "Toggle equip/unequip"
	equipModeDisplayStrings[4] = "Drop all items"

	kEquipMode_None = -1
	kEquipMode_AllAtOnce = 0 ; equip all items
	kEquipMode_AllWithToggle = 1 ; equip all items, but toggle with last equipped item
	kEquipMode_OneAtATime = 2 ; step through the EquipSet items, one per hotkey press
	kEquipMode_AllToggleEquipUnequip = 3 ; equip all items, but toggle between equipped and unequipped states
	kEquipMode_DropAll = 4 ; drop all items
	kDropAllEquipMode_defaultThrowMagnitudePercent = 0.15 ; default dropItem havok impulse magnitude as percentage of maximum
	kDropAllEquipMode_maxThrowMagnitude = 35 ; default dropItem havok impulse magnitude as percentage of maximum

	numShoutWordsDisplayStrings = new string[3]
	numShoutWordsDisplayStrings[0] = "1 word"
	numShoutWordsDisplayStrings[1] = "2 words"
	numShoutWordsDisplayStrings[2] = "3 words (max)"

	debugLevelMenuList = new string[4]
	debugLevelMenuList[0] = "Alerts (0)"
	debugLevelMenuList[1] = "Errors (1)"
	debugLevelMenuList[2] = "Notices (2)"
	debugLevelMenuList[3] = "Debugging (3)"

	InitialiseMenuStringsArrayObject()
	; objCurrentUnequipItemExclusionItem = 0

	modFolderPathType = modFolderPathType ; see property definition. Also sets modFolderPath.
	debugLevels_kAlert = AHMain.debugLevels_kAlert
	debugLevels_kError = AHMain.debugLevels_kError
	debugLevels_kNotice = AHMain.debugLevels_kNotice
	debugLevels_kDebug = AHMain.debugLevels_kDebug
	kDefaultDebugLevel = AHMain.kDefaultDebugLevel

	InitialiseAutoAddEquipSetsUpdatedArray()
	kColour_Normal = "#FFFFFF"
	kColour_Disabled = "#999999"
	kColour_AutoAddedItem = "#B88454"
	; kColour_MenuButton = 1684081
	kColour_MenuButton = "#19B271"

	DebugMessage("ConfigMenu: InitialiseVariables(): modFolderPath = " + modFolderPath)
	DebugMessage("ConfigMenu: hotKeySetExtension = " + hotKeySetExtension)
endFunction

function Initialise(); Called from main AH_Hotkeys script
	;Check if data structures from any previous installation still present
	; DebugMessage("ConfigMenu: Initialise()")
endFunction

function Load()
	DebugMessage("ConfigMenu: Load()")
	InitialiseVariables()
	if objCurrentEquipSet != 0
		BackupEquipSet(objCurrentEquipSet)
	endIf
endFunction

; event OnConfigOpen()
; 	; Do nothing
; endEvent

; event OnConfigClose()
; 	; Do nothing
; endEvent

; Event OnConfigInit()
; 	;DebugMessage("ConfigMenu: OnConfigInit()")
; EndEvent

; Skyrim constants
int Property kNone =	0 AutoReadOnly
int Property kSpell = 22 AutoReadOnly
int Property kScrollItem = 23 AutoReadOnly
int Property kArmor = 26 AutoReadOnly
int Property kIngredient = 30 AutoReadOnly
int Property kLight = 31 AutoReadOnly
int Property kWeapon = 41 AutoReadOnly
int Property kAmmo = 42 AutoReadOnly
int Property kPotion = 46 AutoReadOnly
int Property kProjectile = 50 AutoReadOnly
int Property kSoulGem = 52 AutoReadOnly
int Property kMissile = 63 AutoReadOnly
int Property kArrow = 64 AutoReadOnly
int Property kGrenade = 65 AutoReadOnly
int Property kLeveledSpell = 82 AutoReadOnly
int Property kVoiceType = 98 AutoReadOnly
int Property kWordOfPower = 118 AutoReadOnly
int Property kShout = 119 AutoReadOnly
int Property kEquipSlot = 120 AutoReadOnly
int Property kOutfit = 124 AutoReadOnly

; Keycodes
; http://www.creationkit.com/Input_Script#DXScanCodes
int property KEY_ESCAPE = 0x01 autoreadonly
int property KEY_1 = 0x02 autoreadonly
int property KEY_2 = 0x03 autoreadonly
int property KEY_3 = 0x04 autoreadonly
int property KEY_4 = 0x05 autoreadonly
int property KEY_5 = 0x06 autoreadonly
int property KEY_6 = 0x07 autoreadonly
int property KEY_7 = 0x08 autoreadonly
int property KEY_8 = 0x09 autoreadonly
int property KEY_9 = 0x0A autoreadonly
int property KEY_0 = 0x0B autoreadonly
int property KEY_MINUS = 0x0C autoreadonly
int property KEY_EQUALS = 0x0D autoreadonly
int property KEY_BACKSPACE = 0x0E autoreadonly
int property KEY_TAB = 0x0F autoreadonly
int property KEY_Q = 0x10 autoreadonly
int property KEY_W = 0x11 autoreadonly
int property KEY_E = 0x12 autoreadonly
int property KEY_R = 0x13 autoreadonly
int property KEY_T = 0x14 autoreadonly
int property KEY_Y = 0x15 autoreadonly
int property KEY_U = 0x16 autoreadonly
int property KEY_I = 0x17 autoreadonly
int property KEY_O = 0x18 autoreadonly
int property KEY_P = 0x19 autoreadonly
int property KEY_LEFT_BRACKET = 0x1A autoreadonly
int property KEY_RIGHT_BRACKET = 0x1B autoreadonly
int property KEY_ENTER = 0x1C autoreadonly
int property KEY_LEFT_CONTROL = 0x1D autoreadonly
int property KEY_A = 0x1E autoreadonly
int property KEY_S = 0x1F autoreadonly
int property KEY_D = 0x20 autoreadonly
int property KEY_F = 0x21 autoreadonly
int property KEY_G = 0x22 autoreadonly
int property KEY_H = 0x23 autoreadonly
int property KEY_J = 0x24 autoreadonly
int property KEY_K = 0x25 autoreadonly
int property KEY_L = 0x26 autoreadonly
int property KEY_SEMICOLON = 0x27 autoreadonly
int property KEY_APOSTROPHE = 0x28 autoreadonly
int property KEY_TILDE = 0x29 autoreadonly
int property KEY_LEFT_SHIFT = 0x2A autoreadonly
int property KEY_BACK_SLASH = 0x2B autoreadonly
int property KEY_Z = 0x2C autoreadonly
int property KEY_X = 0x2D autoreadonly
int property KEY_C = 0x2E autoreadonly
int property KEY_V = 0x2F autoreadonly
int property KEY_B = 0x30 autoreadonly
int property KEY_N = 0x31 autoreadonly
int property KEY_M = 0x32 autoreadonly
int property KEY_COMMA = 0x33 autoreadonly
int property KEY_PERIOD = 0x34 autoreadonly
int property KEY_FORWARD_SLASH = 0x35 autoreadonly
int property KEY_RIGHT_SHIFT = 0x36 autoreadonly
int property KEY_NUM_MULTIPLY = 0x37 autoreadonly
int property KEY_LEFT_ALT = 0x38 autoreadonly
int property KEY_SPACEBAR = 0x39 autoreadonly
int property KEY_CAPS_LOCK = 0x3A autoreadonly
int property KEY_F1 = 0x3B autoreadonly
int property KEY_F2 = 0x3C autoreadonly
int property KEY_F3 = 0x3D autoreadonly
int property KEY_F4 = 0x3E autoreadonly
int property KEY_F5 = 0x3F autoreadonly
int property KEY_F6 = 0x40 autoreadonly
int property KEY_F7 = 0x41 autoreadonly
int property KEY_F8 = 0x42 autoreadonly
int property KEY_F9 = 0x43 autoreadonly
int property KEY_F10 = 0x44 autoreadonly
int property KEY_NUM_LOCK = 0x45 autoreadonly
int property KEY_SCROLL_LOCK = 0x46 autoreadonly
int property KEY_NUM7 = 0x47 autoreadonly
int property KEY_NUM8 = 0x48 autoreadonly
int property KEY_NUM9 = 0x49 autoreadonly
int property KEY_NUM_MINUS = 0x4A autoreadonly
int property KEY_NUM4 = 0x4B autoreadonly
int property KEY_NUM5 = 0x4C autoreadonly
int property KEY_NUM6 = 0x4D autoreadonly
int property KEY_NUM_PLUS = 0x4E autoreadonly
int property KEY_NUM1 = 0x4F autoreadonly
int property KEY_NUM2 = 0x50 autoreadonly
int property KEY_NUM3 = 0x51 autoreadonly
int property KEY_NUM0 = 0x52 autoreadonly
int property KEY_NUM_DOT = 0x53 autoreadonly
int property KEY_F11 = 0x57 autoreadonly
int property KEY_F12 = 0x58 autoreadonly
int property KEY_NUM_ENTER = 0x9C autoreadonly
int property KEY_RIGHT_CONTROL = 0x9D autoreadonly
int property KEY_NUM_DIVIDE = 0xB5 autoreadonly
int property KEY_RIGHT_ALT = 0xB8 autoreadonly
int property KEY_HOME = 0xC7 autoreadonly
int property KEY_UP_ARROW = 0xC8 autoreadonly
int property KEY_PG_UP = 0xC9 autoreadonly
int property KEY_LEFT_ARROW = 0xCB autoreadonly
int property KEY_RIGHT_ARROW = 0xCD autoreadonly
int property KEY_END = 0xCF autoreadonly
int property KEY_DOWN_ARROW = 0xD0 autoreadonly
int property KEY_PG_DOWN = 0xD1 autoreadonly
int property KEY_INSERT = 0xD2 autoreadonly
int property KEY_DELETE = 0xD3 autoreadonly
int property KEY_LEFT_MOUSE_BUTTON = 0x100 autoreadonly
int property KEY_RIGHT_MOUSE_BUTTON = 0x101 autoreadonly
int property KEY_MIDDLE_MOUSE_BUTTON = 0x102 autoreadonly
int property KEY_MOUSE_BUTTON3 = 0x103 autoreadonly
int property KEY_MOUSE_BUTTON4 = 0x104 autoreadonly
int property KEY_MOUSE_BUTTON5 = 0x105 autoreadonly
int property KEY_MOUSE_BUTTON6 = 0x106 autoreadonly
int property KEY_MOUSE_BUTTON7 = 0x107 autoreadonly
int property KEY_MOUSE_WHEEL_UP = 0x108 autoreadonly
int property KEY_MOUSE_WHEEL_DOWN = 0x109 autoreadonly