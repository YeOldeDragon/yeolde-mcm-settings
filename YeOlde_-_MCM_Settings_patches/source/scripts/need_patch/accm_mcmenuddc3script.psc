Scriptname accm_MCMenuDDC3Script extends SKI_ConfigBase
{This script builds an MCM menu. For players that don't have SkyUI/MCM, the script will just fail to load, which is no concern since they will have a spell menu instead.}

FormList Property accm_MenuPages  Auto  
{This FormList must contain all generic ACCM pages, in the order that pages will be used. Cannot exceed 127 Pages.}

accm_ControlDDC3script Property Control Auto
{A link to the Control. Used to request resplices when exiting the menu.}

FormList Property accm_AllOptions Auto
{A link to a FormList containing all Options. Used for the Disable All and Enable All buttons.}

FormList Property accm_AllSplicers Auto
{A link to a FormList containing all Splicers. Used for the LeveledActor browsing system.}

GlobalVariable Property accm_Deleveled Auto
{A link to a GlobalVariable that is used to prevent Creature levels from being used -- when enabled, they are spliced at lv1 instead.}

accm_MCMextensionDDC3script Property Ext Auto
{A link to the extension script which should be attached to this same object. It allows users to add custom content to the menu without editing this code, preventing issues during future updates.}

Spell Property SpellMenu Auto
{A link to the SpellMenu spell. Used to remove the spell once ACCM has successfully registered in the MCM.}



int[] ButtonIDs;
int OpenCount = 0; Keeps track of how many windows have been opened (to prevent race conditions when the script is busy)
FISSInterface FISS;


int AllDefaultOID = -1;
int AllDisableOID = -1;
int AllEnableOID = -1;
int DeleveledOID = -1;
int SaveOptionsOID = -1;
int LoadOptionsOID = -1;
int RevertLAsOID = -1;
bool RespliceLAs = false;
int RespliceLAsOID = -1;
bool RevertLAs = false;
int LAHeaderOID = -1;
int LASelectOID = -1;
int LASelect = -1;
int LABrowseOID = -1;


; YeOlde - flag to know if we need to Resplice or not.
bool _restoreRequest = false



;Empty State
;====================================================================


; When the menu is installed for the first time, create a int[128] array to store the IDs for buttons for the currently active page. Then wait for Control to finish installing.
event OnConfigInit()
	GoToState("Busy");
	
	; Create button ID array.
	ButtonIDs = Utility.CreateIntArray(128, -1);

	; Initialize FISS
	FISS = FISSFactory.getFISS();

	; Let the custom script run.
	Ext.CustomConfigInit();
	
	; Wait for Control to finish installation.
	Control.WaitForInstall();

	GoToState("");
endEvent

; When Config successfully registers, remove the spell menu from the player
; 	Actually, I moved that to OnConfig Open, since the menus seem to register successfully no matter what
event OnConfigRegister()
	GoToState("Busy");

	; Let the custom script run.
	Ext.CustomConfigRegister();

	GoToState("");
endEvent

; When the game loads, we need to rebuild the Pages array, in case it changed during an update.
;   Potential issue if this is loaded for the first time before OnConfigInit. Resolved on reload though.
event OnGameReload()
	GoToState("Busy");

	; Rebuild the Pages array
	if (accm_MenuPages.GetSize() > 127)
		Debug.MessageBox("Error in " + ModName + ": ACCM: MCM: OnGameReload: more than 127 Pages. Please report to mod author.");
		Pages = Utility.CreateStringArray(128);
		Pages[0] = "Control";
		int p = 127;
		while (p > 0)
			p -= 1;
			Pages[p + 1] = (accm_MenuPages.GetAt(p) as accm_PageDDC3script).Name;
		endWhile
	else
		Pages = Utility.CreateStringArray(accm_MenuPages.GetSize() + 1);
		Pages[0] = "Control";
		int p = accm_MenuPages.GetSize();
		while (p > 0)
			p -= 1;
			Pages[p + 1] = (accm_MenuPages.GetAt(p) as accm_PageDDC3script).Name;
		endWhile
	endIf

	; Initialize FISS
	if (!FISS) 
		FISS = FISSFactory.getFISS();
	endIf

	; Call the parent event. Very very important
	parent.OnGameReload();
	
	GoToState("");
endEvent

; Keep track of the number of times it's opened to prevent race conditions when busy. Remove the spell menu from the player once the menu opens also.
event OnConfigOpen()
	GoToState("Busy");
	
	OpenCount += 1;

	
	; Remove the spell menu from the player
	Game.GetPlayer().RemoveSpell(SpellMenu);
	
	; Let the custom script run.
	Ext.CustomConfigOpen();

	GoToState("");
endEvent


; This fills the menu page with its buttons whenever a page is opened
event OnPageReset(string page)
	GoToState("Busy");

	; First we need to identify the page.
	int pg = IdentifyPage(page);

	; Let's clear out the ButtonIDs before filling them with their new values
	;	Actually this isn't necessary, since I save the values of every index, even Empty. It's just important to iterate from 0 up to 128 (never the other way around) when identifying buttons.
	;		Actually it might be necessary, at least for the info text in OnOptionHighlight.
	int b = 128;
	while (b > 0)
		b -= 1;
		ButtonIDs[b] = -1;
	endWhile

	; Now we can fill the page with the appropriate menu items.
	SetCursorFillMode(LEFT_TO_RIGHT);
	SetCursorPosition(0);
	if (pg == 0) ; Control page
		int bnum = 16; NOTE TO SELF - update this number when adding any core control options

		AddHeaderOption("ACCM Tools"); 
		AddHeaderOption("");
		AllDefaultOID = AddTextOption("Restore Default For All Creatures", "");
		AddEmptyOption();
		AllDisableOID = AddTextOption("Disable All Creatures", "");
		AllEnableOID = AddTextOption("Enable All Creatures", "");
		DeleveledOID = AddToggleOption("Delevel All Creatures", (accm_Deleveled.GetValue() > 0));
		AddEmptyOption();
		if (FISS)
			SaveOptionsOID = AddTextOption("Save Options", "");
			LoadOptionsOID = AddTextOption("Load Options", "");
			bnum += 2;
		endIf
		;RevertLAsOID = AddToggleOption("Revert LAs on next exit", RevertLAs);
		;RespliceLAsOID = AddToggleOption("Resplice LAs on next exit", RespliceLAs);
		LAHeaderOID = AddHeaderOption("Preview leveled lists:");
		AddEmptyOption();
		LASelectOID = AddMenuOption("Choose LeveledActor:", "");
		LABrowseOID = AddMenuOption("View contents", "");
		AddHeaderOption(""); 
		AddHeaderOption("");
		AddEmptyOption();
		AddEmptyOption();

		; Add the extension script's custom options. The parameter is the current cursor position -- adjust it when adding/removing options from the control page.
		Ext.AddYourCustomButtons(bnum);

	else ; Creature pages
		accm_PageDDC3script ourPage = accm_MenuPages.GetAt(pg - 1) as accm_PageDDC3script;
		int on = ourPage.PageItems.GetSize();
		if (on > 64)
			Debug.MessageBox("Error in " + ModName + ": ACCM: MCM: OnPageReset: " + page + ": More than 64 MenuItems. Please report to mod author.");
			on = 64;
		endIf
		int o = 0;
		while (o < on)
			string type = (ourPage.PageItems.GetAt(o) as accm_MenuItemDDC3script_Parent).GetItemType();
			if (type == "Option")
				ButtonIDs[o*2] = AddToggleOption((ourPage.PageItems.GetAt(o) as accm_MenuItemDDC3script_Parent).Name, !(ourPage.PageItems.GetAt(o) as accm_MenuItemDDC3script_Parent).Disabled);
				int i = (o*2) + 1;
				ButtonIDs[i] = AddTextOption("Test spawn", "");  For some reason, if I put the arithmetic inside the index, it tries to access the wrong memory location...
			elseif (type == "Header")
				ButtonIDs[o*2] = AddHeaderOption((ourPage.PageItems.GetAt(o) as accm_MenuItemDDC3script_Parent).Name);
				int i = (o*2) + 1;
				ButtonIDs[i] = AddHeaderOption("");
			elseif (type == "Empty")
				ButtonIDs[o*2] = AddEmptyOption();
				int i = (o*2) + 1;
				ButtonIDs[i] = AddEmptyOption();
			elseif (type == "Preset")
				ButtonIDs[o*2] = AddTextOption((ourPage.PageItems.GetAt(o) as accm_MenuItemDDC3script_Parent).Name, "");
				int i = (o*2) + 1;
				ButtonIDs[i] = AddMenuOption("See details", "");
			endIf
			o += 1;
		endWhile
	endIf
	
	GoToState("");
endEvent


int function OnBackupRequest(int jMod)
    fiss.BeginSave("YeOlde-Settings-" + ModName + ".xml", ModName)
	int o = accm_AllOptions.GetSize()
	while (o > 0)
		o -= 1
		fiss.SaveBool((accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Name, (accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Disabled)
	endWhile
	Ext.CustomFISSSave()
	fiss.EndSave()
	return RESULT_SUCCESS
endfunction

int function OnRestoreRequest(int jMod)
    fiss.BeginLoad("YeOlde-Settings-" + ModName + ".xml");
	int o = accm_AllOptions.GetSize()
	while (o > 0)
		o -= 1
		if (fiss.LoadBool((accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Name))
			(accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Disable()
		else
			(accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Enable()
		endIf
	endWhile
	Ext.CustomFISSLoad()
	fiss.EndLoad()
	
	; Execute code from OnCloseConfig().

	_restoreRequest = true
	RegisterForSingleUpdate(0.5) 
	return RESULT_SUCCESS	
endfunction


event OnUpdate()

	if (_restoreRequest)
		GoToState("Busy");
		_restoreRequest = false

		; Apply certain options that don't take effect until exit
		if (RespliceLAs)
			Control.DontRevertNextTime = true;
			RespliceLAs = false;
		elseIf (RevertLAs)
			Control.DontSpliceNextTime = true;
			RevertLAs = false;
		endIf

		;Request a resplice from Control
		Control.RespliceIfNecessary();

		; Let the custom script run.
		Ext.CustomConfigOpen();
		
		GoToState("");
	endif
endevent

; Respond to button presses
event OnOptionSelect(int oid)
	GoToState("Busy");

	; Identify page
	int p = IdentifyPage(CurrentPage);
	
	if (p > 0) ; Generic page
		; Identify button
		int b = IdentifyButton(oid);
		
		; Find MenuItem
		int mi = Math.floor(b/2.0);
		accm_MenuItemDDC3script_Parent item = (accm_MenuPages.GetAt(p - 1) as accm_PageDDC3script).PageItems.GetAt(mi) as accm_MenuItemDDC3script_Parent;

		; Request a response
		
		; Even numbers are primary buttons
		if (mi == Math.floor((b+1)/2.0))
			if (item.GetItemType() == "Option")
				bool s = item.Toggle();
				SetToggleOptionValue(oid, !s);
			elseif (item.GetItemType() == "Preset")
				if (ShowMessage("Change your options to match this preset? (See details button for exact changes.)"))
					SetTitleText("===PLEASE WAIT===");
					item.RespondToToggle();
					SetTitleText(CurrentPage);
					GoToState("");
					ForcePageReset();
					GoToState("Busy");
				endIf
			endIf
		
		; Odd numbers are secondary buttons
		else
			if (item.GetItemType() == "Option")
				; Options have a test spawner as their secondary button
				if (ShowMessage("Test this creature by spawning one now? (If there are multiple creatures controlled by this option, one will be randomly selected.)"))
					(item as accm_OptionDDC3script).SpawnRandom();
				endIf
			endIf
			; Presets have a Details window as their secondary button -- these are found in OnOptionMenuOpen event instead.
		endIf

	else
		; Control page options
		if (oid == AllDefaultOID) ; Default all
			if (ShowMessage("Revert all your creature settings to their default?"))
				SetTitleText("===PLEASE WAIT===");
				int o = accm_AllOptions.GetSize();
				while (o > 0)
					o -= 1;
					(accm_AllOptions.GetAt(o) as accm_OptionDDC3script).RestoreDefault();
				endWhile
				Ext.CustomDefaultAll();
				SetTitleText(CurrentPage);
			endIf
		elseif (oid == AllDisableOID) ; Disable all
			if (ShowMessage("Set all creature options to disabled?"))
				SetTitleText("===PLEASE WAIT===");
				int o = accm_AllOptions.GetSize();
				while (o > 0)
					o -= 1;
					(accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Disable();
				endWhile
				Ext.CustomDisableAll();
				SetTitleText(CurrentPage);
			endIf
		elseif (oid == AllEnableOID) ; Enable all
			if (ShowMessage("Set all creature options to enabled?"))
				SetTitleText("===PLEASE WAIT===");
				int o = accm_AllOptions.GetSize();
				while (o > 0)
					o -= 1;
					(accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Enable();
				endWhile
				Ext.CustomEnableAll();
				SetTitleText(CurrentPage);
			endIf
		elseif (oid == DeleveledOID) ; Deleveled
			if (accm_Deleveled.GetValue() > 0)
				accm_Deleveled.SetValue(0);
			else
				accm_Deleveled.SetValue(1);
			endIf
			SetToggleOptionValue(oid, accm_Deleveled.GetValue());
			Control.RespliceRequired = true;
		elseif (oid == SaveOptionsOID) ; Save options with FISS
			if (ShowMessage("Save all creature options with FISS? This will overwrite any previously saved configurations."))
				SetTitleText("===PLEASE WAIT===");
				fiss.BeginSave("ACCM - " + ModName + ".xml", ModName);
				int o = accm_AllOptions.GetSize();
				while (o > 0)
					o -= 1;
					fiss.SaveBool((accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Name, (accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Disabled);
				endWhile
				Ext.CustomFISSSave();
				string err = fiss.EndSave();
				if (err != "")
					ShowMessage(ModName + ": FISS Save Error: " + err);
				endIf
				SetTitleText(CurrentPage);
			endIf
		elseif (oid == LoadOptionsOID) ; Load options with FISS
			if (ShowMessage("Load configuration from a previous save with FISS? This will overwrite all current creature options."))
				SetTitleText("===PLEASE WAIT===");
				fiss.BeginLoad("ACCM - " + ModName + ".xml");
				int o = accm_AllOptions.GetSize();
				while (o > 0)
					o -= 1;
					if (fiss.LoadBool((accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Name))
						(accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Disable();
					else
						(accm_AllOptions.GetAt(o) as accm_OptionDDC3script).Enable();
					endIf
				endWhile
				Ext.CustomFISSLoad();
				string err = fiss.EndLoad();
				if (err != "")
					ShowMessage(ModName + ": FISS Load Error: " + err);
				endIf
				SetTitleText(CurrentPage);
			endIf
		elseif ((oid == RevertLAsOID) && (!RespliceLAs)) ; Revert LAs
			if (ShowMessage("Revert all LeveledActor lists on next exit? (SEE IMPORTANT WARNING BELOW)"))
				RevertLAs = !RevertLAs;
				SetToggleOptionValue(oid, RevertLAs);
			endIf
		elseif ((oid == RespliceLAsOID) && (!RevertLAs)) ; Resplice LAs
			if (ShowMessage("Splice without reverting for all LeveledActor lists on next exit? (SEE IMPORTANT WARNING BELOW)"))
				RespliceLAs = !RespliceLAs;
				SetToggleOptionValue(oid, RespliceLAs);
			endIf
		
		else
			; Custom options
			Ext.CustomOptionSelect(oid);
		
		endIf
	endIf
	
	GoToState("");
endEvent

; Respond to default requests
event OnOptionDefault(int oid)
	GoToState("Busy");

	; Identify page
	int p = IdentifyPage(CurrentPage);
	
	if (p > 0)
		; Identify button
		int b = IdentifyButton(oid);
		
		; Find MenuItem
		int mi = Math.floor(b/2.0);
		accm_MenuItemDDC3script_Parent item = (accm_MenuPages.GetAt(p - 1) as accm_PageDDC3script).PageItems.GetAt(mi) as accm_MenuItemDDC3script_Parent;
		
		; Even numbers are primary buttons
		if (mi == Math.floor((b+1)/2.0))
			if (item.GetItemType() == "Option")
				bool s = item.RestoreDefault();
				SetToggleOptionValue(oid, s);
			endIf
		endIf

	else
		; Control
		
		; Custom options
		Ext.CustomOptionDefault(oid);

	endIf
	
	GoToState("");
endEvent

; Display subtext when highlighted
event OnOptionHighlight(int oid)
	GoToState("Busy");

	; Identify page
	int p = IdentifyPage(CurrentPage);
	
	if (p > 0)
		; Identify button
		int b = IdentifyButton(oid);
		
		; Find MenuItem
		int mi = Math.floor(b/2.0);
		accm_MenuItemDDC3script_Parent item = (accm_MenuPages.GetAt(p - 1) as accm_PageDDC3script).PageItems.GetAt(mi) as accm_MenuItemDDC3script_Parent;
		SetInfoText(item.Subtext);
	else
		; Control page options
		if (oid == AllDefaultOID) ; Default all
			SetInfoText("Restore default setting for all creatures in this mod.");
		elseif (oid == AllDisableOID) ; Disable all
			SetInfoText("Disable all creatures in this mod.");
		elseif (oid == AllEnableOID) ; Enable all
			SetInfoText("Enable all creatures in this mod.");
		elseif (oid == DeleveledOID) ; Delevel
			SetInfoText("Place all creatures into the leveled lists at Level 1 instead of their appropriate level.\nUse this if you use other mods that delevel the vanilla LeveledActor lists. Otherwise this is not recommended.");
		elseif (oid == SaveOptionsOID) ; Save options with FISS
			SetInfoText("Save all creatures options to a FISS file.\nYou can only have one config saved at a time; this will overwrite any previous saves.");
		elseif (oid == LoadOptionsOID) ; Load options with FISS
			SetInfoText("Load all creatures options from a previously saved FISS file.\nThis will overwrite all current creature options.");
		elseif (oid == RevertLAsOID) ; Revert LAs
			SetInfoText("This is for advanced use. If you don't know what you're doing, DON'T USE IT.\nIf you select this, when you exit this menu, all effected LeveledActor lists will be reverted to their plugin state. Creatures added by other mods' scripts could be permanently lost if used incorrectly.");
		elseif (oid == RespliceLAsOID) ; Resplice LAs
			SetInfoText("This is for advanced use. If you don't know what you're doing, DON'T USE IT.\nIf you select this, when you exit this menu, all creatures in this mod will be spliced into their LeveledActor lists without doing a revert first. Could result in duplicates in leveled lists if used incorrectly.");
		elseif (oid == LAHeaderOID) ; Header for the LA Browser options
			SetInfoText("Use these buttons to view the current contents of any LeveledActor list effected by this mod. You can also spawn any actor.\nNote that if you change your options, these lists won't be updated until you exit the MCM menu.");
		elseif (oid == LASelectOID) ; Menu to choose the LA to view
			SetInfoText("Use this to choose which LeveledActor list you would like to view.\nNote that if you change your options, these lists won't be updated until you exit the MCM menu.");
		elseif (oid == LABrowseOID) ; Menu to actually view (and potentially spawn) the contents of an LA
			SetInfoText("After choosing a LeveledActor with the left menu, use this to view its contents. You can also select an actor to spawn it.\nNote that if you change your options, these lists won't be updated until you exit the MCM menu.");
		
		else	
			SetInfoText("");
			; Custom options
			Ext.CustomOptionHighlight(oid);
		
		endIf
	endIf
	
	GoToState("");
endEvent

; Respond to OptionMenu opening (used for secondary button of Preset MenuItems)
event OnOptionMenuOpen(int oid)
	GoToState("Busy");

	; Identify page
	int p = IdentifyPage(CurrentPage);
	
	if (p > 0)
		; Identify button
		int b = IdentifyButton(oid);

		; Find MenuItem
		int mi = Math.floor(b/2.0);
		accm_MenuItemDDC3script_Parent item = (accm_MenuPages.GetAt(p - 1) as accm_PageDDC3script).PageItems.GetAt(mi) as accm_MenuItemDDC3script_Parent;

		; Even numbers are primary buttons
		if (mi != Math.floor((b+1)/2.0))
			if (item.GetItemType() == "Preset")
				;SetMenuDialogStartIndex(0);				

				; This is a Details menu for a Preset item; fill it with a list of controlled options
				FormList enable_options = (item as accm_PresetDDC3script).EnableOptionsList;
				FormList disable_options = (item as accm_PresetDDC3script).DisableOptionsList;
				string[] menu_options = Utility.CreateStringArray(enable_options.GetSize() + disable_options.GetSize() + 2);
				int s = menu_options.Length;
				while (s > 0)
					s -= 1;
					if (s == 0)
						menu_options[s] = "==Enable==";
					elseIf (s < enable_options.GetSize() + 1)
						menu_options[s] = (enable_options.GetAt(s - 1) as accm_OptionDDC3script).Name;
					elseIf (s == enable_options.GetSize() + 1)
						menu_options[s] = "==Disable==";
					else
						menu_options[s] = (disable_options.GetAt(s - enable_options.GetSize() - 2) as accm_OptionDDC3script).Name;
					endIf
				endWhile
				SetMenuDialogOptions(menu_options);
			endIf
		endIf
	else
		if (oid == LASelectOID) ; Menu to choose the LA to view
			string[] menu_options = Utility.CreateStringArray(accm_AllSplicers.GetSize());
			int s = menu_options.Length;
			while (s > 0)
				s -= 1;
				menu_options[s] = (accm_AllSplicers.GetAt(s) as accm_SplicerDDC3script).DestLAName + ", " + ((accm_AllSplicers.GetAt(s) as accm_SplicerDDC3script).DestLA as LeveledActor).GetNumForms() + "/255";
			endWhile
			SetMenuDialogOptions(menu_options);
		elseif (oid == LABrowseOID) ; Menu to actually view (and potentially spawn) the contents of an LA
			LeveledActor la = (accm_AllSplicers.GetAt(LASelect) as accm_SplicerDDC3script).DestLA;
			string[] menu_options = Utility.CreateStringArray(la.GetNumForms() + 1);
			int s = menu_options.Length - 1;
			while (s > 0)
				s -= 1;
				menu_options[s] = la.GetNthForm(s).GetName() + ", lv." + la.GetNthLevel(s);
				if ((la.GetNthForm(s) as ActorBase) == None)
					menu_options[s] = "<Leveled List>";
				endIf
			endWhile
			menu_options[menu_options.Length - 1] = "<Spawn random (leveled)>";			
			SetMenuDialogOptions(menu_options);			
			
		else
			; Custom options
			Ext.CustomOptionMenuOpen(oid);
	
		endIf
	endIf

	GoToState("");
endEvent

; Respond to OptionMenu option selection (used for LA Browser)
event OnOptionMenuAccept(int oid, int i)
	GoToState("Busy");

	; Identify page
	int p = IdentifyPage(CurrentPage);

	if (p == 0)
		if (oid == LASelectOID) ; Menu to choose the LA to view
			LASelect = i;
			SetMenuOptionValue(oid, (accm_AllSplicers.GetAt(i) as accm_SplicerDDC3script).DestLAName);
		elseIf (oid == LABrowseOID) ; Menu to actually view (and potentially spawn) the contents of an LA
			if (ShowMessage("Would you like to spawn this creature now?"))
				if (i < ((accm_AllSplicers.GetAt(LASelect) as accm_SplicerDDC3script).DestLA as LeveledActor).GetNumForms()) 
					Game.GetPlayer().PlaceAtMe(((accm_AllSplicers.GetAt(LASelect) as accm_SplicerDDC3script).DestLA as LeveledActor).GetNthForm(i));
				else
					Game.GetPlayer().PlaceAtMe((accm_AllSplicers.GetAt(LASelect) as accm_SplicerDDC3script).DestLA as LeveledActor);
				endIf
			endIf
		
		else
			; Custom options
			Ext.CustomOptionMenuAccept(oid, i);

		endIf
	endIf

	GoToState("");
endEvent

; When the MCM closes, request a resplice
event OnConfigClose()	
	OpenCount -= 1;

	GoToState("Busy");

	; Apply certain options that don't take effect until exit
	if (RespliceLAs)
		Control.DontRevertNextTime = true;
		RespliceLAs = false;
	elseIf (RevertLAs)
		Control.DontSpliceNextTime = true;
		RevertLAs = false;
	endIf

	;Request a resplice from Control
	Control.RespliceIfNecessary();

	; Let the custom script run.
	Ext.CustomConfigOpen();
	
	GoToState("");
endEvent





; Returns the selected page. 0 = Control; 1-127 = MenuPages 0-126. 128 = error.
int function IdentifyPage(string page)
	if ((page == "Control") || (page == "")) 
		return 0;
	else
		int pn = accm_MenuPages.GetSize();
		int p = 0;
		while (p < pn)
			p += 1;
			;if (Pages[p] == (accm_MenuPages.GetAt(p - 1) as accm_PageDDC3script).Name)
			if (Pages[p] == page)
				return p;
			endIf
		endWhile
	endIf
	
	Debug.Trace("Error in " + ModName + ": ACCM: MCM: IdentifyPage: " + page + ": Couldn't find page.");
	return 128;
endFunction


; Returns the selected button. -1 = error. Note that each MenuItem takes up two button slots. Math.floor(b/2) gives you the MenuItem index. If b is even, it's the primary button for that MenuItem (such as a creature toggler); if b is odd, it's the secondary button (such as the Test Spawn button).
int function IdentifyButton(int oid)
	int o = 0;
	while (o < 128)
		if (ButtonIDs[o] == oid)
			return o;
		endIf
		o += 1;
	endWhile

	Debug.Trace("Error in " + ModName + ": ACCM: MCM: IdentifyButton: " + oid + ": Couldn't find button.");
	return -1;
endFunction





;The following events currently don't have any use for the main script, but are needed to call the extension script's versions.

event OnOptionSliderOpen(int oid)
	GoToState("Busy");
	Ext.CustomOptionSliderOpen(oid);
	GoToState("");
endEvent

event OnOptionSliderAccept(int oid, float value)
	GoToState("Busy");
	Ext.CustomOptionSliderAccept(oid, value);
	GoToState("");
endEvent

event OnOptionColorOpen(int oid)
	GoToState("Busy");
	Ext.CustomOptionColorOpen(oid);
	GoToState("");
endEvent

event OnOptionColorAccept(int oid, int color)
	GoToState("Busy");
	Ext.CustomOptionColorAccept(oid, color);
	GoToState("");
endEvent

event OnOptionKeyMapChange(int oid, int keyb, string conflictControl, string conflictName)
	GoToState("Busy");
	Ext.CustomOptionKeyMapChange(oid, keyb, conflictControl, conflictName);
	GoToState("");
endEvent

event OnOptionInputOpen(int oid)
	GoToState("Busy");
	Ext.CustomOptionInputOpen(oid);
	GoToState("");
endEvent

event OnOptionInputAccept(int oid, string kinput)
	GoToState("Busy");
	Ext.CustomOptionInputAccept(oid, kinput);
	GoToState("");
endEvent



; The following functions are called the custom extension script for FISS saving and loading.
; MCM.CustomFISSSave*(string var, * val)
; MCM.CustomFISSLoad*(string var)
; Where the * can be Bool, String, Float, or Int.
; (CustomFISSLoad* returns the retrieved value; CustomFISSSave* has no return value.)

function CustomFISSSaveBool(string var, bool val)
	fiss.SaveBool(var, val);
endFunction
function CustomFISSSaveString(string var, string val)
	fiss.SaveString(var, val);
endFunction
function CustomFISSSaveFloat(string var, float val)
	fiss.SaveFloat(var, val);
endFunction
function CustomFISSSaveInt(string var, int val)
	fiss.SaveInt(var, val);
endFunction

bool function CustomFISSLoadBool(string var)
	return fiss.LoadBool(var);
endFunction
string function CustomFISSLoadString(string var)
	return fiss.LoadString(var);
endFunction
float function CustomFISSLoadFloat(string var)
	return fiss.LoadFloat(var);
endFunction
int function CustomFISSLoadInt(string var)
	return fiss.LoadInt(var);
endFunction




;====================================================================



;Busy State
;====================================================================
State Busy



; These functions do need to run every time; postpone until not busy.

event OnGameReload()
	while (GetState() == "Busy")
		Utility.WaitMenuMode(0.001);
	endWhile

	OnGameReload();
endEvent

event OnConfigOpen()
	while (GetState() == "Busy")
		Utility.WaitMenuMode(0.1);
	endWhile

	OnConfigOpen();
endEvent

event OnConfigRegister()
	while (GetState() == "Busy")
		Utility.WaitMenuMode(0.001);
	endWhile

	OnConfigRegister();
endEvent

event OnConfigClose()
	while (GetState() == "Busy")
		Utility.WaitMenuMode(0.1);
	endWhile
	
	if (OpenCount == 1)
		OnConfigClose();
	else
		OpenCount -= 1;
	endIf
endEvent



; These functions can be ignored when busy.

event OnPageReset(string page)
endEvent

event OnOptionSelect(int oid)
endEvent

event OnOptionDefault(int oid)
endEvent

event OnOptionHighlight(int oid)
endEvent

event OnOptionMenuOpen(int oid)
endEvent

event OnOptionMenuAccept(int oid, int i)
endEvent

event OnOptionSliderOpen(int oid)
endEvent

event OnOptionSliderAccept(int oid, float value)
endEvent

event OnOptionColorOpen(int oid)
endEvent

event OnOptionColorAccept(int oid, int color)
endEvent

event OnOptionKeyMapChange(int oid, int keyb, string conflictControl, string conflictName)
endEvent

event OnOptionInputOpen(int oid)
endEvent

event OnOptionInputAccept(int oid, string kinput)
endEvent


endState
;====================================================================