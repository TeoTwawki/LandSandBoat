-----------------------------------
-- Area: Sauromugue Champaign
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Fury
-- !pos 384.047 45.466 384.224 120
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_FURY)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_FURY)
end

return entity
