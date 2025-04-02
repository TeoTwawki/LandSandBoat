-----------------------------------
-- Area: RaKaznar_Inner_Court
--  NPC: HomePoint#1
-- !pos 757 120 17.5 276
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8700
local hpIndex = 116

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
