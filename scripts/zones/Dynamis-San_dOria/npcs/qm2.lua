-----------------------------------
-- Area: Dynamis-San_dOria
--  NPC: ??? (qm2)
-- Note: Spawns Steelshank Kratzvatz
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
