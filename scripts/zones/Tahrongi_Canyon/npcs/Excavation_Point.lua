-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Excavation Point
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.helm.onTrade(player, npc, trade, invaderXim.helmType.EXCAVATION, 901)
end

entity.onTrigger = function(player, npc)
    invaderXim.helm.onTrigger(player, invaderXim.helmType.EXCAVATION)
end

return entity
