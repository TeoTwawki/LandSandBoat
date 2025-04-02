-----------------------------------
-- Area: La Theine Plateau
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Refresh
-- !pos 400.026 70.700 365.002 102
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_REGEN)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_REGEN)
end

return entity
