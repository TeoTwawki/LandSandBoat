-----------------------------------
-- Area: Rolanberry Fields
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-MND
-- !pos 243.900 -31.194 -255.254 110
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_MND)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_MND)
end

return entity
