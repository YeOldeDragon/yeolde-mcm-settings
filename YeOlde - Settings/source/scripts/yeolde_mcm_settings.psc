scriptname yeolde_mcm_settings extends SKI_ConfigBase

import StringUtil

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Respawn  ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int property YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID = 0x08005902 autoreadonly
int property YEOLDE_VAR_RESPAWN_STONES_ACTIVATED_ID = 0x0800CABE autoreadonly
int property YEOLDE_VAR_RESPAWN_CITIES_ACTIVATED_ID = 0x0800CABF autoreadonly
int property YEOLDE_VAR_RESPAWN_UNKNOWN_LOCATION_ID = 0x08010297 autoreadonly

int property YEOLDE_VAR_RESPAWN_BLEEDOUT_TIME_ID = 0x08005903 autoreadonly
int property YEOLDE_VAR_RESPAWN_INVISIBILITY_ACTIVATED_ID = 0x0800CAC1 autoreadonly

int property YEOLDE_VAR_RESPAWN_GOLD_PENALTY_ID = 0x0800D025 autoreadonly
int property YEOLDE_VAR_RESPAWN_XP_PENALTY_ID = 0x0800D026 autoreadonly
int property YEOLDE_VAR_RESPAWN_XP_PENALTY_DURATION_ID = 0x0800D027 autoreadonly

GlobalVariable yeolde_var_respawn_none_activated
GlobalVariable yeolde_var_respawn_stones_activated
GlobalVariable yeolde_var_respawn_cities_activated
GlobalVariable yeolde_var_respawn_unknown_location

GlobalVariable yeolde_var_respawn_bleedout_time
GlobalVariable yeolde_var_respawn_invisibility_activated

GlobalVariable yeolde_var_respawn_gold_penalty
GlobalVariable yeolde_var_respawn_xp_penalty
GlobalVariable yeolde_var_respawn_xp_penalty_duration


float property DEFAULT_BLEEDOUT_TIME = 5.0 autoreadonly
float property DEFAULT_INVULNERABILITY_DELAY = 20.0 autoreadonly
float property DEFAULT_SEARCH_RANGE = 15000.0 autoreadonly
float property DEFAULT_XP_PENALTY_DURATION = 30.0 autoreadonly

bool respawnActivated
string[] XPDebuffStr
int XPDebufIndex

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Hybrid Loot  ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
yeolde_loot loot_script = none
GlobalVariable yeolde_var_autoloot_mode
GlobalVariable yeolde_var_autoloot_range
GlobalVariable yeolde_var_autoloot_interval
GlobalVariable yeolde_var_autoloot_max_loot_items
int property YEOLDE_VAR_AUTOLOOT_MODE_ID = 0x0800FB1A autoreadonly
int property YEOLDE_VAR_AUTOLOOT_RANGE_ID = 0x0800FB1B autoreadonly
int property YEOLDE_VAR_AUTOLOOT_INTERVAL_ID = 0x0800FB1C autoreadonly
int property YEOLDE_VAR_AUTOLOOT_MAX_LOOT_ITEMS_ID = 0x0801EE24 autoreadonly
int property YEOLDE_QUEST_HYBRID_LOOT_ID = 0x08014C21 autoreadonly

int property YEOLDE_RESPAWN_ACTIVATED_ID = 0x01005902 autoreadonly

int property AUTOLOOT_MODE_MANUAL = 0 autoreadonly
int property AUTOLOOT_MODE_HYBRID = 1 autoreadonly
int property AUTOLOOT_MODE_AUTOLOOT = 2 autoreadonly
string property AUTOLOOT_MODE_MANUAL_STR = "Manual" autoreadonly
string property AUTOLOOT_MODE_HYBRID_STR = "Hybrid" autoreadonly
; string AUTOLOOT_MODE_AUTOLOOT_STR = "Autoloot"

float property DEFAULT_AUTOLOOT_SEARCH_RANGE = 500.0 autoreadonly
float property DEFAULT_AUTOLOOT_INTERVAL = 1.0 autoreadonly
int property DEFAULT_AUTOLOOT_MAX_LOOT_ITEMS = 5 autoreadonly

bool hybridLootActivated
int maxLootItems
string lootValue
float autoloot_range
float autoloot_interval

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Crafting Bag  ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GlobalVariable yeolde_var_craftingbag_activated
int property YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID = 0x07000802 autoreadonly
int property YEOLDE_CRAFTINGBAG_QUEST_ID = 0x050A7986 autoreadonly
Quest yeolde_craftingbag_quest

bool craftingbag_activated = false
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Actor _playerRef

bool _crafting_bag_mod_activated
bool _hybrid_loot_mod_activated
bool _respawn_mod_activated

; @overrides SKI_ConfigBase
event OnConfigInit()  
    _crafting_bag_mod_activated = self.IsPluginInstalled("YeOlde - Crafting Bag.esp", YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID)
    _hybrid_loot_mod_activated = self.IsPluginInstalled("YeOlde - Hybrid Loot.esp", YEOLDE_VAR_AUTOLOOT_MODE_ID)
    _respawn_mod_activated = self.IsPluginInstalled("YeOlde - Respawn.esp", YEOLDE_RESPAWN_ACTIVATED_ID)
    DebugMsg("OnConfigInit", "Crafting bag:" + _crafting_bag_mod_activated)
    DebugMsg("OnConfigInit", "Hybrid Loot:" + _hybrid_loot_mod_activated)
    DebugMsg("OnConfigInit", "Respawn:" + _respawn_mod_activated)
    ;Pages = new String[1]
    ; string pagesArrayStr = ""
    ; if (_crafting_bag_mod_activated)
    ;     pagesArrayStr += ";Crafting Bag"
    ;     yeolde_var_craftingbag_activated = Game.GetFormFromFile(YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID, "YeOlde - Crafting Bag.esp") as GlobalVariable
    ;     DebugMsg("OnConfigInit", "yeolde_var_craftingbag_activated:" + yeolde_var_craftingbag_activated)
    ;     craftingbag_activated = yeolde_var_craftingbag_activated.GetValueInt() as bool
    ; endif
    ; if _hybrid_loot_mod_activated
    ;     pagesArrayStr += ";Hybrid Loot"
    ;     yeolde_var_autoloot_mode = Game.GetFormFromFile(YEOLDE_VAR_AUTOLOOT_MODE_ID, "YeOlde - Hybrid Loot.esp") as GlobalVariable
    ;     yeolde_var_autoloot_range = Game.GetFormFromFile(YEOLDE_VAR_AUTOLOOT_RANGE_ID, "YeOlde - Hybrid Loot.esp") as GlobalVariable
    ;     yeolde_var_autoloot_interval = Game.GetFormFromFile(YEOLDE_VAR_AUTOLOOT_INTERVAL_ID, "YeOlde - Hybrid Loot.esp") as GlobalVariable
    ;     yeolde_var_autoloot_max_loot_items = Game.GetFormFromFile(YEOLDE_VAR_AUTOLOOT_MAX_LOOT_ITEMS_ID, "YeOlde - Hybrid Loot.esp") as GlobalVariable

    ;     Quest hybrid_loot_quest = Game.GetFormFromFile(YEOLDE_QUEST_HYBRID_LOOT_ID, "YeOlde - Hybrid Loot.esp") as Quest
    ;     loot_script = hybrid_loot_quest.GetAlias(0) as yeolde_loot
    ; endif
    ; if _respawn_mod_activated
    ;     pagesArrayStr += ";Respawn"

    ;     XPDebuffStr = new String[4]
    ;     XPDebuffStr[0] = "No XP penalty"
    ;     XPDebuffStr[1] = "10% penalty"
    ;     XPDebuffStr[2] = "20% penalty"
    ;     XPDebuffStr[3] = "40% penalty"

    ;     yeolde_craftingbag_quest = Game.GetFormFromFile(YEOLDE_CRAFTINGBAG_QUEST_ID, "YeOlde - Respawn.esp") as Quest
    ;     yeolde_var_respawn_none_activated = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ;     yeolde_var_respawn_stones_activated = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_STONES_ACTIVATED_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ;     yeolde_var_respawn_cities_activated = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_CITIES_ACTIVATED_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ;     yeolde_var_respawn_unknown_location = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_UNKNOWN_LOCATION_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ;     yeolde_var_respawn_bleedout_time = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_BLEEDOUT_TIME_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ;     yeolde_var_respawn_invisibility_activated = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_INVISIBILITY_ACTIVATED_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ;     yeolde_var_respawn_gold_penalty = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_GOLD_PENALTY_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ;     yeolde_var_respawn_xp_penalty = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_XP_PENALTY_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ;     yeolde_var_respawn_xp_penalty_duration = Game.GetFormFromFile(YEOLDE_VAR_RESPAWN_XP_PENALTY_DURATION_ID, "YeOlde - Respawn.esp") as GlobalVariable
    ; endif
    ; pagesArrayStr = Substring(pagesArrayStr, 1) ; Remove first ";"

    ; if GetLength(pagesArrayStr) > 0
    ;     Pages = Split(pagesArrayStr, ";")
    ; endif
    
endEvent  

bool function IsPluginInstalled(string pluginName, int formID)
    return (Game.GetFormFromFile(formID, pluginName) != none) as bool
endfunction

; @implements SKI_QuestBase
event OnGameReload()
	parent.OnGameReload()
	_playerRef = Game.GetPlayer()

    if _respawn_mod_activated
        respawnActivated = _playerRef.IsEssential()
    endif

    if _hybrid_loot_mod_activated
        ; lootModeIndex = yeolde_var_autoloot_mode.GetValueInt()
        hybridLootActivated = yeolde_var_autoloot_mode.GetValueInt() as bool
        maxLootItems = yeolde_var_autoloot_max_loot_items.GetValueInt()
        autoloot_range = yeolde_var_autoloot_range.GetValue()
        autoloot_interval = yeolde_var_autoloot_interval.GetValue()

        if hybridLootActivated
            lootValue = AUTOLOOT_MODE_HYBRID_STR
        else
            lootValue = AUTOLOOT_MODE_MANUAL_STR
        endif
    endif
endEvent

; @implements SKI_ConfigBase
event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}

    if a_page == ""
		self.LoadCustomContent("yeolde/settings_splash.dds", 0.000000, 0.000000)
		return 
	else
		self.UnloadCustomContent()
    endIf
    ;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Respawn  ;;;;;;;;;;;;;;;;;;;;;;;;;
    if a_page == "Respawn"    
        XPDebufIndex = yeolde_var_respawn_xp_penalty.GetValueInt()

        if XPDebuffStr.Length == 0
            ; Got an  issue with SE not initializing the array, so I've also initialized it here. 
            ; Bad bad coding... :(
            XPDebuffStr = new String[4]
            XPDebuffStr[0] = "No XP penalty"
            XPDebuffStr[1] = "10% penalty"
            XPDebuffStr[2] = "20% penalty"
            XPDebuffStr[3] = "40% penalty"
        endif

        ;; 1st column
        SetCursorFillMode(TOP_TO_BOTTOM)
        AddHeaderOption("General")
        AddToggleOptionST("RespawnActivation", "Activate 'Respawn mode'", respawnActivated)
        AddSliderOptionST("Bleedout", "Default bleedout time", yeolde_var_respawn_bleedout_time.GetValue(), "{1} sec")
        AddEmptyOption()
        
        AddHeaderOption("Respawn Locations")
        AddToggleOptionST("RespawnLocNone", "Respawn on place (no teleport)", yeolde_var_respawn_none_activated.GetValueInt() as bool)
        AddToggleOptionST("RespawnLocStones", "Respawn to nearest Standing Stone", yeolde_var_respawn_stones_activated.GetValueInt() as bool)
        AddToggleOptionST("RespawnLocCities", "Respawn to nearest City", yeolde_var_respawn_cities_activated.GetValueInt() as bool)
        AddEmptyOption()
        
        AddHeaderOption("Respawn Options")
        AddToggleOptionST("RespawnUnknown", "Respawn to unknown locations", yeolde_var_respawn_unknown_location.GetValueInt() as bool)

        ;; 2nd column
        SetCursorPosition(1)
        AddHeaderOption("Respawn Invulnerability")
        AddToggleOptionST("InvulnerabilityDelay", "15s of invisibility after death", yeolde_var_respawn_invisibility_activated.GetValueInt() as bool)
        AddEmptyOption()

        AddHeaderOption("Respawn Penalties")        
        AddSliderOptionST("GoldPenalty", "Gold per player level", yeolde_var_respawn_gold_penalty.GetValue(), "{0} golds")
        AddTextOptionST("XPPenalty", "XP debuff percentage", XPDebuffStr[XPDebufIndex])
        AddSliderOptionST("XPPenaltyDuration", "XP debuff duration", yeolde_var_respawn_xp_penalty_duration.GetValue(), "{0} minutes")
    endIf
    ;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Hybrid Loot  ;;;;;;;;;;;;;;;;;;;;;
    if a_page == "Hybrid Loot"
        ;; 1st column
        SetCursorFillMode(TOP_TO_BOTTOM)
        AddHeaderOption("General")
        AddTextOptionST("LootMode", "Loot Mode", lootValue)
        self.AddEmptyOption()

        AddHeaderOption("Hybrid Loot")
        AddSliderOptionST("LootRange", "Loot Range", autoloot_range)
        AddSliderOptionST("MaxLootItems", "Max Items per loot", maxLootItems)
        self.AddEmptyOption()
        
        ; AddHeaderOption("Auto Loot")
        ; AddSliderOptionST("LootInterval", "Loot Interval (Auto Mode)", autoloot_interval, "{1}")
	endIf
    ;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Crafting Bag  ;;;;;;;;;;;;;;;;;;;;
    if a_page == "Crafting Bag"
        ;; 1re colonne
        SetCursorFillMode(TOP_TO_BOTTOM)
        AddHeaderOption("Crafting Bag")  
        AddToggleOptionST("CraftingBag", "Enable crafting bag", craftingbag_activated)
        AddEmptyOption()
    endif

endEvent

;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Crafting Bag  ;;;;;;;;;;;;;;;;;;;;
state CraftingBag
	event  OnSelectST()
        craftingbag_activated = !craftingbag_activated
        yeolde_var_craftingbag_activated.SetValueInt(craftingbag_activated as int)
        SetToggleOptionValueST(craftingbag_activated)
        yeolde_craftingbag_player playeralias = yeolde_craftingbag_quest.GetAlias(0) as yeolde_craftingbag_player

        if craftingbag_activated
            playeralias.EnableCraftingBag()     
        else
            playeralias.DisableCraftingBag()     
        endif
	endEvent

	event OnDefaultST()
        SetToggleOptionValueST(false)
        yeolde_var_craftingbag_activated.SetValueInt(0)
        
        yeolde_craftingbag_player playeralias = yeolde_craftingbag_quest.GetAlias(0) as yeolde_craftingbag_player
        playeralias.DisableCraftingBag()     
    endEvent

	event OnHighlightST()
        SetInfoText("Activate a crafting bag to store unlimited crafting and alchemy materials")
	endEvent
endState

;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Hybrid Loot  ;;;;;;;;;;;;;;;;;;;;;
state LootMode

    event OnSelectST() ; TEXT
        ; TODO: Autoloot mode is disable for now, will debug it later
        ; lootValue = AUTOLOOT_MODE_MANUAL_STR
        hybridLootActivated = !hybridLootActivated

        if hybridLootActivated
            lootValue = AUTOLOOT_MODE_HYBRID_STR
        else
            lootValue = AUTOLOOT_MODE_MANUAL_STR
        endif
        
        ; if (lootModeIndex < 2)
		; 	lootModeIndex += 1
        ;     if lootModeIndex > 1
        ;         lootValue = AUTOLOOT_MODE_AUTOLOOT_STR
        ;     else
        ;         lootValue = AUTOLOOT_MODE_HYBRID_STR
        ;     endif
		; else
		; 	lootModeIndex = 0
		; endif
		SetTextOptionValueST(lootValue)
        yeolde_var_autoloot_mode.SetValueInt(hybridLootActivated as int)
        loot_script.SetLootMode(hybridLootActivated as int)
        ; yeolde_var_autoloot_mode.SetValueInt(lootModeIndex)
        ; loot_script.SetLootMode(lootModeIndex)
    endEvent

	event OnDefaultST()
        ; lootModeIndex = AUTOLOOT_MODE_MANUAL
        lootValue = AUTOLOOT_MODE_MANUAL_STR
		SetTextOptionValueST(lootValue)
        yeolde_var_autoloot_mode.SetValueInt(hybridLootActivated as int)
        loot_script.SetLootMode(hybridLootActivated as int)
        ; yeolde_var_autoloot_mode.SetValueInt(lootModeIndex)
        ; loot_script.SetLootMode(lootModeIndex)
	endEvent

	event OnHighlightST()
		SetInfoText("Choose between MANUAL, AUTO and HYBRID (auto loot around you when you manually loot something")
	endEvent
endState

state MaxLootItems 
	event  OnSliderOpenST()
		SetSliderDialogStartValue(maxLootItems)
		SetSliderDialogDefaultValue(DEFAULT_AUTOLOOT_MAX_LOOT_ITEMS)
		SetSliderDialogRange(1, 10)
		SetSliderDialogInterval(1)
	endEvent

	event  OnSliderAcceptST(float value)
        maxLootItems = value as int
		SetSliderOptionValueST(maxLootItems, "{0}")
        loot_script.SetNbMaxItems(maxLootItems)
        yeolde_var_autoloot_max_loot_items.SetValueInt(maxLootItems)
	endEvent

	event OnDefaultST()
        maxLootItems = DEFAULT_AUTOLOOT_MAX_LOOT_ITEMS
		SetSliderOptionValueST(maxLootItems, "{0}")
        loot_script.SetNbMaxItems(maxLootItems)
        yeolde_var_autoloot_max_loot_items.SetValueInt(maxLootItems)
	endEvent

	event OnHighlightST()
		SetInfoText("Maximum number of items looted per try")
	endEvent
endState

state LootRange 
	event  OnSliderOpenST()
		SetSliderDialogStartValue(autoloot_range)
		SetSliderDialogDefaultValue(DEFAULT_AUTOLOOT_SEARCH_RANGE)
		SetSliderDialogRange(300, 2000)
		SetSliderDialogInterval(100)
	endEvent

	event  OnSliderAcceptST(float value)
        autoloot_range = value
		SetSliderOptionValueST(autoloot_range, "{0}")
        loot_script.SetLootRange(autoloot_range)
        yeolde_var_autoloot_range.SetValue(autoloot_range)
	endEvent

	event OnDefaultST()
        autoloot_range = DEFAULT_AUTOLOOT_SEARCH_RANGE
		SetSliderOptionValueST(autoloot_range, "{0}")
        loot_script.SetLootRange(autoloot_range)
        yeolde_var_autoloot_range.SetValue(autoloot_range)
	endEvent

	event OnHighlightST()
		SetInfoText("Loot range around player for AUTO and HYBRID modes")
	endEvent
endState

state LootInterval
	event  OnSliderOpenST()
		SetSliderDialogStartValue(autoloot_interval)
		SetSliderDialogDefaultValue(DEFAULT_AUTOLOOT_INTERVAL)
		SetSliderDialogRange(0.5, 10)
		SetSliderDialogInterval(0.5)
	endEvent

	event  OnSliderAcceptST(float value)
        autoloot_interval = value
		SetSliderOptionValueST(autoloot_interval, "{1}")
        loot_script.SetLootInterval(autoloot_interval)
        yeolde_var_autoloot_interval.SetValue(autoloot_interval)
	endEvent

	event OnDefaultST()
        autoloot_interval = DEFAULT_AUTOLOOT_INTERVAL
		SetSliderOptionValueST(autoloot_interval, "{1}")
        loot_script.SetLootInterval(autoloot_interval)
        yeolde_var_autoloot_interval.SetValue(autoloot_interval)
	endEvent

	event OnHighlightST()
		SetInfoText("Intervals between loot attemps in AUTO mode")
	endEvent
endState



;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Respawn  ;;;;;;;;;;;;;;;;;;;;;;;;;
state RespawnUnknown
	event  OnSelectST()
        bool value = !(yeolde_var_respawn_unknown_location.GetValueInt() as bool)
        SetToggleOptionValueST(value)
        yeolde_var_respawn_unknown_location.SetValueInt(value as int)
	endEvent

	event OnDefaultST()
        SetToggleOptionValueST(false)
        yeolde_var_respawn_unknown_location.SetValueInt(0)
    endEvent

	event OnHighlightST()
        SetInfoText("Allow or avoid respawn to unknown locations (cities or standing stones)")
	endEvent
endState

state XPPenalty

    event OnSelectST() ; TEXT
       
        if (XPDebufIndex < 3)
			XPDebufIndex += 1
		else
			XPDebufIndex = 0
		endif
		SetTextOptionValueST(XPDebuffStr[XPDebufIndex])
        yeolde_var_respawn_xp_penalty.SetValueInt(XPDebufIndex)
    endEvent

	event OnDefaultST()
        XPDebufIndex = 0
		SetTextOptionValueST(XPDebuffStr[XPDebufIndex])
        yeolde_var_respawn_xp_penalty.SetValueInt(XPDebufIndex)
	endEvent

	event OnHighlightST()
		SetInfoText("How much XP debuff will have the player after death.")
	endEvent
endState


state GoldPenalty
	event  OnSliderOpenST()
		SetSliderDialogStartValue(yeolde_var_respawn_gold_penalty.GetValue())
		SetSliderDialogDefaultValue(DEFAULT_XP_PENALTY_DURATION)
		SetSliderDialogRange(0.0, 250.0)
		SetSliderDialogInterval(10.0)
	endEvent

	event  OnSliderAcceptST(float value)
		SetSliderOptionValueST(value, "{0} golds")
        yeolde_var_respawn_gold_penalty.SetValue(value)
	endEvent

	event OnDefaultST()
		SetSliderOptionValueST(DEFAULT_XP_PENALTY_DURATION, "{0} golds")
        yeolde_var_respawn_gold_penalty.SetValue(DEFAULT_XP_PENALTY_DURATION)
	endEvent

	event OnHighlightST()
		SetInfoText("The gold amount will be remove from your inventory (if you have some). Set to 0 to disable.")
	endEvent
endState


state XPPenaltyDuration
	event  OnSliderOpenST()
		SetSliderDialogStartValue(yeolde_var_respawn_xp_penalty_duration.GetValue())
		SetSliderDialogDefaultValue(DEFAULT_XP_PENALTY_DURATION)
		SetSliderDialogRange(0.0, 60)
		SetSliderDialogInterval(1.0)
	endEvent

	event  OnSliderAcceptST(float value)
		SetSliderOptionValueST(value, "{0} minutes")
        yeolde_var_respawn_xp_penalty_duration.SetValue(value)
	endEvent

	event OnDefaultST()
		SetSliderOptionValueST(DEFAULT_XP_PENALTY_DURATION, "{0} minutes")
        yeolde_var_respawn_xp_penalty_duration.SetValue(DEFAULT_XP_PENALTY_DURATION)
	endEvent

	event OnHighlightST()
		SetInfoText("The duration is not cumulative in case of multiple deaths. Set to 0 to disable.")
	endEvent
endState

state InvulnerabilityDelay
	event  OnSelectST()
        bool value = !(yeolde_var_respawn_invisibility_activated.GetValueInt() as bool)
        SetToggleOptionValueST(value)
        yeolde_var_respawn_invisibility_activated.SetValueInt(value as int)
	endEvent

	event OnDefaultST()
        SetToggleOptionValueST(false)
        yeolde_var_respawn_invisibility_activated.SetValueInt(0)
    endEvent

	event OnHighlightST()
        SetInfoText("Gives you a small delay to flee from last combat")
	endEvent
endState

state RespawnLocNone
	event  OnSelectST()
        bool value = !(yeolde_var_respawn_none_activated.GetValueInt() as bool)
        SetToggleOptionValueST(value)
        yeolde_var_respawn_none_activated.SetValueInt(value as int)
        if value
            ; we need to disable all other options
            SetToggleOptionValueST(0, false, "RespawnLocStones")
            SetToggleOptionValueST(0, false, "RespawnLocCities")
            yeolde_var_respawn_stones_activated.SetValueInt(0)
            yeolde_var_respawn_cities_activated.SetValueInt(0)
        endif
	endEvent

	event OnDefaultST()
        SetToggleOptionValueST(false)
        yeolde_var_respawn_stones_activated.SetValueInt(0)
    endEvent

	event OnHighlightST()
        SetInfoText("Activate respawning where you died")
	endEvent
endState

state RespawnLocStones
	event  OnSelectST()
        bool value = !(yeolde_var_respawn_stones_activated.GetValueInt() as bool)
        SetToggleOptionValueST(value)
        yeolde_var_respawn_stones_activated.SetValueInt(value as int)

        if value
            ; we need to disable the "no teleport" option
            SetToggleOptionValueST(0, false, "RespawnLocNone")
            yeolde_var_respawn_none_activated.SetValueInt(0)
        endif
	endEvent

	event OnDefaultST()
        SetToggleOptionValueST(false)
        yeolde_var_respawn_stones_activated.SetValueInt(0)
    endEvent

	event OnHighlightST()
        SetInfoText("Activate respawning to the nearest Standing Stone")
	endEvent
endState

state RespawnLocCities
	event  OnSelectST()
        bool value = !(yeolde_var_respawn_cities_activated.GetValueInt() as bool)
        SetToggleOptionValueST(value)
        yeolde_var_respawn_cities_activated.SetValueInt(value as int)
        
        if value
            ; we need to disable the "no teleport" option
            SetToggleOptionValueST(0, false, "RespawnLocNone")
            yeolde_var_respawn_none_activated.SetValueInt(0)
        endif
	endEvent

	event OnDefaultST()
        SetToggleOptionValueST(false)
        yeolde_var_respawn_cities_activated.SetValueInt(0)
    endEvent

	event OnHighlightST()
        SetInfoText("Activate respawning to the nearest City")
	endEvent
endState

state RespawnActivation
	event  OnSelectST()
        respawnActivated = !_playerRef.IsEssential()
        SetToggleOptionValueST(respawnActivated)
        _playerRef.GetActorBase().SetEssential(respawnActivated)
		_playerRef.SetNoBleedoutRecovery(respawnActivated)
	endEvent

	event OnDefaultST()
        respawnActivated = false
        SetToggleOptionValueST(respawnActivated)
        _playerRef.GetActorBase().SetEssential(respawnActivated)
		_playerRef.SetNoBleedoutRecovery(respawnActivated)   
    endEvent

	event OnHighlightST()
        SetInfoText("Activate the respawn on death")
	endEvent
endState

state Bleedout
	event  OnSliderOpenST()
		SetSliderDialogStartValue(yeolde_var_respawn_bleedout_time.GetValue())
		SetSliderDialogDefaultValue(DEFAULT_BLEEDOUT_TIME)
		SetSliderDialogRange(0.5, 15)
		SetSliderDialogInterval(0.5)
	endEvent

	event  OnSliderAcceptST(float value)
		SetSliderOptionValueST(value, "{1} sec")
        yeolde_var_respawn_bleedout_time.SetValue(value)
	endEvent

	event OnDefaultST()
		SetSliderOptionValueST(DEFAULT_BLEEDOUT_TIME, "{1} sec")
        yeolde_var_respawn_bleedout_time.SetValue(DEFAULT_BLEEDOUT_TIME)
	endEvent

	event OnHighlightST()
		SetInfoText("Time elapse between death and respawn")
	endEvent
endState



function DebugMsg(String functionName, String msg = "", int stackIndent = 0) global
    String sBaseIndent = ""
    While stackIndent>0
        result = result + "  "
        stackIndent -= 1        
    EndWhile
    
    String result = sBaseIndent + "yeolde_mcm_settings::" + functionName
   
    if msg != ""
        result = result + " -> "
    endif

    Debug.Trace(result + msg)
endfunction