-----------------------------------
-- Area: Port Jeuno
--  NPC: HomePoint#2
-- !pos -155 -1 -4 246
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8701
local hpIndex = 38

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
