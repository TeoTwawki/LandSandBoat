-----------------------------------
-- Area: Bastok Markets
--  NPC: HomePoint#2
-- !pos -328 -12 -33 235
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8701
local hpIndex = 12

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
