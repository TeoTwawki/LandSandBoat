-----------------------------------
-- Area: Yahse Hunting Grounds
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Wilt
-- !pos 412.263 4.161 111.199 260
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.geomanticReservoir.onTrigger(player, npc, invaderXim.magic.spell.GEO_WILT)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.geomanticReservoir.onEventFinish(player, csid, invaderXim.magic.spell.GEO_WILT)
end

return entity
