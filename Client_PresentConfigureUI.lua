function Client_PresentConfigureUI(rootParent)
    if Mod.Settings.AttacksNeeded == nil then initial0 = 1; else initial0 = Mod.Settings.AttacksNeeded end
    local vert = UI.CreateVerticalLayoutGroup(rootParent);
    local horz = UI.CreateHorizontalLayoutGroup(vert);
	UI.CreateLabel(horz).SetText('Number of Successful attacks needed to avoid getting sanctioned.');
    AttacksNeededSlider = UI.CreateNumberInputField(horz)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initial0);
end