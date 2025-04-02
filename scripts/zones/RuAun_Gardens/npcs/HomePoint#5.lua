-----------------------------------
-- Area: RuAun_Gardens
--  NPC: HomePoint#5
-- !pos 305 -42 -427 130
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8704
local hpIndex = 63

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
