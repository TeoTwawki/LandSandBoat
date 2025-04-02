-----------------------------------
-- Area: Grauberg [S]
--  NPC: Harvesting Point
-----------------------------------
local ID = zones[invaderXim.zone.GRAUBERG_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.helm.onTrade(player, npc, trade, invaderXim.helmType.HARVESTING, 901)
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.HARVESTING_IS_POSSIBLE_HERE, 1020)
end

return entity
