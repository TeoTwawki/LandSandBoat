-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Treasure Casket
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.caskets.onTrigger(player, npc)
end

entity.onTrade = function(player, npc, trade)
    invaderXim.caskets.onTrade(player, npc, trade)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.caskets.onEventFinish(player, csid, option, npc)
end

return entity
