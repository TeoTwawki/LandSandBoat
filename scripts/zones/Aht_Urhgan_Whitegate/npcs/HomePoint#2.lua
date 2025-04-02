-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: HomePoint#2
-- !pos -130 0.001 -16 50
-----------------------------------
---@type TNpcEntity
local entity = {}

local hpEvent = 8701
local hpIndex = 106

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
