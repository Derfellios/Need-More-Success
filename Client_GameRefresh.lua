function Client_GameRefresh(game)

	if game.Us == nil or (not Mod.PlayerGameData.InitialPopupDisplayed and not (game.Game.TurnNumber > 1 or (game.Game.TurnNumber == 1 and not game.Settings.AutomaticTerritoryDistribution))) then

		local message = Mod.Settings.AttacksNeeded;

		UI.Alert("This game includes More Success Needed. Complete " .. message .. " attacks to avoid being sanctioned.")
		if game.Us ~= nil then
			local payload = {};
			payload.Message = "InitialPopupDisplayed";
			game.SendGameCustomMessage("Please wait... ", payload, function(reply)end);
		end
	end
end