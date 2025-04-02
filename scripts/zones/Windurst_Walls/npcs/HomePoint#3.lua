-----------------------------------
-- Area: Windurst Walls
--  NPC: HomePoint#3
-- !pos 31 -6.5 -40 239
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8702
local hpIndex = 21

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
