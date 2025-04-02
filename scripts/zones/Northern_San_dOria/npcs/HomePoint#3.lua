-----------------------------------
-- Area: Northern San dOria
--  NPC: HomePoint#3
-- !pos 70 -0.2 10 231
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8702
local hpIndex = 5

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
