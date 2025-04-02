-----------------------------------
-- Area: Foret de Hennetiel
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Gravity
-- !pos 232.687 -0.500 152.658 262
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_GRAVITY)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_GRAVITY)
end

return entity
