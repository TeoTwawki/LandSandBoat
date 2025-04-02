-----------------------------------
-- Area: Batallia Downs
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Barrier
-- !pos -677.645 -32.000 157.981 105
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_BARRIER)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_BARRIER)
end

return entity
