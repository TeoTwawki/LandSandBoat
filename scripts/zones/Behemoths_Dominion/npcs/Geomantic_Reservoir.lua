-----------------------------------
-- Area: Behemoth's Dominion
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-DEX
-- !pos -232.162 -20.199 4.927 127
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_DEX)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_DEX)
end

return entity
