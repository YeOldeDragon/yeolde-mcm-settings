scriptname yeolde_mcm_settings extends SKI_ConfigBase

; import StringUtil

SKI_ConfigManager property manager auto
string[] property _modNames auto
bool[] property _modEnableFlags auto
int[] property _modMenuToggle auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Respawn  ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int property YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID = 0x08005902 autoreadonly


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Hybrid Loot  ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int property YEOLDE_VAR_AUTOLOOT_MODE_ID = 0x0800FB1A autoreadonly

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;  YeOlde - Crafting Bag  ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
int property YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID = 0x07000802 autoreadonly

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Actor _playerRef

bool _crafting_bag_mod_activated
bool _hybrid_loot_mod_activated
bool _respawn_mod_activated

; @overrides SKI_ConfigBase
event OnConfigInit()  
    _modMenuToggle = new int[128]

    ; _crafting_bag_mod_activated = self.IsPluginInstalled("YeOlde - Crafting Bag.esp", YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID)
    ; _hybrid_loot_mod_activated = self.IsPluginInstalled("YeOlde - Hybrid Loot.esp", YEOLDE_VAR_AUTOLOOT_MODE_ID)
    ; _respawn_mod_activated = self.IsPluginInstalled("YeOlde - Respawn.esp", YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID)
    ; Log("OnConfigInit->Crafting bag:" + _crafting_bag_mod_activated)
    ; Log("OnConfigInit->Hybrid Loot:" + _hybrid_loot_mod_activated)
    ; Log("OnConfigInit->Respawn:" + _respawn_mod_activated)
endEvent  

bool function IsPluginInstalled(string pluginName, int formID)
    return (Game.GetFormFromFile(formID, pluginName) != none) as bool
endfunction

; @implements SKI_QuestBase
event OnGameReload()
	parent.OnGameReload()
	_playerRef = Game.GetPlayer()
endEvent

; @implements SKI_ConfigBase
event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}

    ; if a_page == ""
	; 	self.LoadCustomContent("yeolde/settings_splash.dds", 0.000000, 0.000000)
	; 	return 
	; else
	; 	self.UnloadCustomContent()
    ; endIf

    _modNames = manager.GetAllModNames()
    _modEnableFlags = manager.GetAllEnabledModFlags()

    SetCursorFillMode(TOP_TO_BOTTOM)
    AddHeaderOption("Available MCM Menus")
    int index = 0
    while (index < _modNames.Length)
        if (_modNames[index] != "")
            int flag = OPTION_FLAG_NONE

            if (_modNames[index] == self.ModName)
                flag = OPTION_FLAG_DISABLED
            endif

            _modMenuToggle[index] = AddToggleOption(_modNames[index], _modEnableFlags[index], flag)           
        endif
        index += 1
    endwhile  

endEvent

; @implements SKI_ConfigBase
event OnOptionSelect(int a_option)
    {Called when the user selects a non-dialog option}
    
    int i = 0
    while (i<_modMenuToggle.Length)
        if (a_option == _modMenuToggle[i])
            int result = 0
            bool newState = !_modEnableFlags[i]

            if (newState)
                result = manager.EnableModByName(_modNames[i])
            else
                result = manager.DisableModByName(_modNames[i])
            endif

            if(result > -1)
                _modEnableFlags[i] = newState
                SetToggleOptionValue(a_option, newState)
            else
                Log("SkyUI is busy, please try again...")
            endif
            return
        endif
        i += 1
    endwhile
endEvent


function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction