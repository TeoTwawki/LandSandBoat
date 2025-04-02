-----------------------------------
-- Area: Caedarva Mire
--  NPC: Logging Point
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.helm.onTrade(player, npc, trade, invaderXim.helmType.LOGGING, 139)
end

entity.onTrigger = function(player, npc)
    invaderXim.helm.onTrigger(player, invaderXim.helmType.LOGGING)
end

return entity
