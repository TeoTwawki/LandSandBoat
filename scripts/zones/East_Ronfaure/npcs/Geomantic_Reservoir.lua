-----------------------------------
-- Area: East Ronfaure
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Poison
-- !pos 379.572 -39.057 57.502 101
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_POISON)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_POISON)
end

return entity
