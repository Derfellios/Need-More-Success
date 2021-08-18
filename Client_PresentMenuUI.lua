function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)	
    if game.Us ~= nil then
	
		AttacksNeeded = 1;
		if Mod.Settings.AttacksNeeded ~= nil then
			AttacksNeeded = Mod.Settings.AttacksNeeded;
		end
	
		local vert = UI.CreateVerticalLayoutGroup(rootParent);
		
		UI.CreateLabel(vert).SetText('Complete '..Mod.Settings.AttacksNeeded..' successful attacks to avoid getting sanctioned');
	end
end


