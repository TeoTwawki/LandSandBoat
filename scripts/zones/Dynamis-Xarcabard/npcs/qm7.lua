-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm7)
-- Note: Spawns Animated Longsword
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.dynamis.qmOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.dynamis.qmOnTrigger(player, npc)
end

return entity
