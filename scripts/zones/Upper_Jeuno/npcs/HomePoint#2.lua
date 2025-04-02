-----------------------------------
-- Area: Upper Jeuno
--  NPC: HomePoint#2
-- !pos 32 -1 -44 244
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8701
local hpIndex = 33

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
