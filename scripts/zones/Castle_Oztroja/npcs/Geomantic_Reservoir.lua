-----------------------------------
-- Area: Castle Oztroja
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-AGI
-- !pos -210.032 -16.000 95.255 151
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_AGI)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_AGI)
end

return entity
