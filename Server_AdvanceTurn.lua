function Server_AdvanceTurn_Start(game, addNewOrder)
	local privateGameData = Mod.PrivateGameData
	local Players = {};
	for playerID, _ in pairs(game.ServerGame.Game.Players) do
		Players[playerID] = 0;
	end
	privateGameData.TerritoriesTaken = Players;
	Mod.PrivateGameData = privateGameData;
end

function Server_AdvanceTurn_Order(game, order, result, skipThisOrder, addNewOrder)
	local proxtype = order.proxyType
	if proxtype == 'GameOrderAttackTransfer' then
		if result.IsSuccessful and result.IsAttack then
			local AttackerTeam = game.ServerGame.Game.Players[order.PlayerID].Team;
			if AttackerTeam == -1 or game.ServerGame.LatestTurnStanding.Territories[Order.To].IsNeutral or AttackerTeam ~= game.ServerGame.Game.Players[game.ServerGame.LatestTurnStanding.Territories[Order.To].OwnerPlayerID].Team then
				local privateGameData = Mod.PrivateGameData
				Players = privateGameData.TerritoriesTaken
				Players[order.PlayerID] = Players[order.PlayerID] + 1
				privateGameData.TerritoriesTaken = Players;
				Mod.PrivateGameData = privateGameData;
			end
		end 
	end
end

function Server_AdvanceTurn_End(game, addNewOrder)
    for PlayerID, _ in pairs(game.ServerGame.Game.Players) do
		local NumberTaken = Mod.PrivateGameData.TerritoriesTaken[PlayerID]
		if NumberTaken < Mod.Settings.AttacksNeeded then
			local Cards =  game.ServerGame.Settings.Cards;
			for CardID, _ in pairs(Cards) do
				if CardID == WL.CardID.Sanctions then
					addNewOrder(WL.GameOrderEvent.Create(PlayerID, "You get sanctioned because you did not conquer enough territories.", {}, {}));
					local NewSanctions = WL.NoParameterCardInstance.Create(WL.CardID.Sanctions)
					addNewOrder(WL.GameOrderReceiveCard.Create(PlayerID, {NewSanctions}));
					addNewOrder(WL.GameOrderPlayCardSanctions.Create(NewSanctions.ID, PlayerID, PlayerID));
				end
			end
		end
	end
end


