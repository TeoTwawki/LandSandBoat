-----------------------------------
-- Area: Xarcabard
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Torpor
-- !pos -141.138 -34.642 127.197 112
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_TORPOR)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_TORPOR)
end

return entity
