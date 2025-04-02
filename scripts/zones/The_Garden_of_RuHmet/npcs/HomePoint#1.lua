-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: HomePoint#1
-- !pos -426 0 368 35
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8700
local hpIndex = 89

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
