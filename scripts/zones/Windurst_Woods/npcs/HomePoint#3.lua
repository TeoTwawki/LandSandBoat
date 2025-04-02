-----------------------------------
-- Area: Windurst Woods
--  NPC: HomePoint#3
-- !pos -92 -5 62 241
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8702
local hpIndex = 27

entity.onTrigger = function(player, npc)
    invaderXim.homepoint.onTrigger(player, hpEvent, hpIndex)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.homepoint.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.homepoint.onEventFinish(player, csid, option, hpEvent)
end

return entity
