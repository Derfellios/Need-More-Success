function Client_SaveConfigureUI(alert)
	Mod.Settings.AttacksNeeded = math.min(math.max(1, AttacksNeededSlider.GetValue()), 20);
end