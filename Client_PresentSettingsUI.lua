 function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	local AttacksNeeded = Mod.Settings.AttacksNeeded;
	
    UI.CreateLabel(vert).SetText('Complete '..Mod.Settings.AttacksNeeded..' successful attacks to avoid getting sanctioned');
end
