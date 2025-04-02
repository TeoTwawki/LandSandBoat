-----------------------------------
-- Area: Dynamis-Buburimu
--  NPC: ??? (qm0)
-- Note: Spawns Apocalyptic Beast / Arch Apocalyptic Beast
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
