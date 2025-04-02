-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Slip
-- !pos 10.804 -0.031 -18.927 195
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_SLIP)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_SLIP)
end

return entity
