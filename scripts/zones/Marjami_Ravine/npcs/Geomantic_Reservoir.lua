-----------------------------------
-- Area: Marjami Ravine
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Haste
-- !pos 189.015 -40.000 241.025 266
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_HASTE)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_HASTE)
end

return entity
