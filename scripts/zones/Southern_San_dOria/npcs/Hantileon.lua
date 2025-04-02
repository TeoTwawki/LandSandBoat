-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Hantileon
-- Type: VCS Chocobo Trainer
-- !pos -2.675 -1.1 -105.287 230
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
