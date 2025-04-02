-----------------------------------
-- Area: Gusgen Mines
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Focus
-- !pos -20.869 -59.736 -180.233 196
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_FOCUS)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_FOCUS)
end

return entity
