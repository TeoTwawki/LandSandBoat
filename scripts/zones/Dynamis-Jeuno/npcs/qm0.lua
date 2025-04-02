-----------------------------------
-- Area: Dynamis-Jeuno
--  NPC: ??? (qm0)
-- Note: Spawns Goblin Golem / Arch Goblin Golem
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
