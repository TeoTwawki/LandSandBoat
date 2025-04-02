-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Harvesting Point
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.helm.onTrade(player, npc, trade, invaderXim.helmType.HARVESTING, 11)
end

entity.onTrigger = function(player, npc)
    invaderXim.helm.onTrigger(player, invaderXim.helmType.HARVESTING)
end

return entity
