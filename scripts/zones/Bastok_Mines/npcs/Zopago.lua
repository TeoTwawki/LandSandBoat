-----------------------------------
-- Area: Bastok Mines
--  NPC: Zopago
-- Type: VCS Chocobo Trainer
-- !pos 51.706 -0.126 -109.065 234
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.chocoboRaising.onTradeVCSTrainer(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.chocoboRaising.onTriggerVCSTrainer(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.chocoboRaising.onEventUpdateVCSTrainer(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.chocoboRaising.onEventFinishVCSTrainer(player, csid, option, npc)
end

return entity
