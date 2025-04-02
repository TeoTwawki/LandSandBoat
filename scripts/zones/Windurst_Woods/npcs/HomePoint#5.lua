-----------------------------------
-- Area: Windurst Woods
--  NPC: HomePoint#5
-- !pos -43.5 0 -145 241
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8704
local hpIndex = 119

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
