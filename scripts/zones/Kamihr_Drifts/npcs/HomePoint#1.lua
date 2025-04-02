-----------------------------------
-- Area: Kamihr Drifts
--  NPC: HomePoint#1
-- !pos 210 20.299 315 267
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8700
local hpIndex = 51

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
