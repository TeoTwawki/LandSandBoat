-----------------------------------
-- Area: La Theine Plateau
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Regen
-- !pos -5.052 54.625 -405.673 102
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_REFRESH)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_REFRESH)
end

return entity
