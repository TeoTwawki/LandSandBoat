-----------------------------------
-- Area: Windurst Woods
--  NPC: HomePoint#4
-- !pos 74 -7.5 -139 241
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8703
local hpIndex = 28

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
