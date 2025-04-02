-----------------------------------
-- Area: Morimar Basalt Fields
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Malaise
-- !pos -166.764 -1.377 -49.194 265
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_MALAISE)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_MALAISE)
end

return entity
