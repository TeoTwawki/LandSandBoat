-----------------------------------
-- Area: Garlaige Citadel
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-VIT
-- !pos -83.898 5.568 139.600 200
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_VIT)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_VIT)
end

return entity
