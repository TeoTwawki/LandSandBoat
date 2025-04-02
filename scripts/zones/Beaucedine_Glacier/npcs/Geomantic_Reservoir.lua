-----------------------------------
-- Area: Beaucedine Glacier
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-INT
-- !pos 8.527 -59.729 -104.909 111
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_INT)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_INT)
end

return entity
