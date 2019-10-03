scriptname yeolde_mcm_settings extends SKI_ConfigBase

import Game
import StringUtil

SKI_ConfigManager property manager auto
string[] property _modNames auto
bool[] property _modEnableFlags auto
int[] property _modMenuToggle auto

; ;  YeOlde - Respawn 
; int property YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID = 0x08005902 autoreadonly

; ;  YeOlde - Hybrid Loot  
; int property YEOLDE_VAR_AUTOLOOT_MODE_ID = 0x0800FB1A autoreadonly

; ;  YeOlde - Crafting Bag  
; int property YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID = 0x07000802 autoreadonly

; bool _crafting_bag_mod_activated
; bool _hybrid_loot_mod_activated
; bool _respawn_mod_activated


Actor _playerRef

; @overrides SKI_ConfigBase
event OnConfigInit()  
    _modMenuToggle = new int[128]

    ; string pagesArrayStr = "MCM Menu Settings"
    
    Pages = new String[1]
    Pages[0] = "MCM Menu Settings"

    ; if self.IsPluginInstalled("YeOlde - Crafting Bag.esp", YEOLDE_VAR_CRAFTINGBAG_ACTIVATED_ID)
    ;     pagesArrayStr += ";YeOlde - Crafting Bag"
    ;     Log("OnConfigInit->Crafting bag installed")
    ; endif
    
    ; if self.IsPluginInstalled("YeOlde - Hybrid Loot.esp", YEOLDE_VAR_AUTOLOOT_MODE_ID)
    ;     pagesArrayStr += ";YeOlde - Hybrid Loot"
    ;     Log("OnConfigInit->Hybrid Loot installed")
    ; endif
    
    ; if self.IsPluginInstalled("YeOlde - Respawn.esp", YEOLDE_VAR_RESPAWN_NONE_ACTIVATED_ID)
    ;     pagesArrayStr += ";YeOlde - Respawn"
    ;     Log("OnConfigInit->Respawn installed")
    ; endif

    ; if GetLength(pagesArrayStr) > 0
    ;     Pages = Split(pagesArrayStr, ";")
    ; endif
endEvent  

; bool function IsPluginInstalled(string pluginName, int formID)
;     return (Game.GetFormFromFile(formID, pluginName) != none) as bool
; endfunction

; @implements SKI_QuestBase
event OnGameReload()
	parent.OnGameReload()
	_playerRef = Game.GetPlayer()
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

    _modNames = manager.GetAllModNames()
    _modEnableFlags = manager.GetAllEnabledModFlags()
    
    if a_page == "MCM Menu Settings"
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

        SetCursorPosition(1)
        AddHeaderOption("Debug / Panic button")
        AddTextOptionST("ForceMCMReset", "Press to reset MCM menus", "Press to reset")    

    ; elseif a_page == "YeOlde - Crafting Bag"
    ;     SetCursorFillMode(TOP_TO_BOTTOM)
    ;     AddHeaderOption("YeOlde - Crafting Bag")
    ;     ; TODO something!
    ; elseif a_page == "YeOlde - Hybrid Loot"
    ;     SetCursorFillMode(TOP_TO_BOTTOM)
    ;     AddHeaderOption("YeOlde - Hybrid Loot")
    ;     ; TODO something!
    ; elseif a_page == "YeOlde - Respawn"
    ;     SetCursorFillMode(TOP_TO_BOTTOM)
    ;     AddHeaderOption("YeOlde - Respawn")
    ;     ; TODO something!
    endif

endEvent

; @implements SKI_ConfigBase
event OnOptionSelect(int a_option)
    {Called when the user selects a non-dialog option}
    
    if (CurrentPage == Pages[0])
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
    endif
endEvent

state ForceMCMReset
    event OnSelectST()
        SetTextOptionValueST("reseting...")
        manager.ForceResetFromMCMMenu()
		SetTextOptionValueST("Press to reset")
	endEvent

	event OnDefaultST()
		SetTextOptionValueST("Press to reset")
	endEvent

	event OnHighlightST()
		SetInfoText("Press the button, leave the menu and wait a minute or so. Every MCM menus will reset to default.")
	endEvent
endState

function Log(string a_msg)
	Debug.Trace(self + ": " + a_msg)
endFunction