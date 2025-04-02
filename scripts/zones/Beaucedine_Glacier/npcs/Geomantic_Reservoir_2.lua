-----------------------------------
-- Area: Beaucedine Glacier
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Acumen
-- !pos 275.620 -0.137 247.116 111
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_ACUMEN)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_ACUMEN)
end

return entity
