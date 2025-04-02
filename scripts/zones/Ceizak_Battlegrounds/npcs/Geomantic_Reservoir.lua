-----------------------------------
-- Area: Ceizak Battlegrounds
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Frailty
-- !pos -450.391 0.001 -0.491 261
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_FRAILTY)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_FRAILTY)
end

return entity
