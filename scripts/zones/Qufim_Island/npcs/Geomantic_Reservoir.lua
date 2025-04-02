-----------------------------------
-- Area: Qufim Island
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Attunement
-- !pos 185.136 20.528 -208.424 126
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_ATTUNEMENT)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_ATTUNEMENT)
end

return entity
