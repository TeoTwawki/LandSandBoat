-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Paurelde
-- Type: Chocobo Renter
-- !pos -273.301 0.300 -149.800 124
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventSucceed = 12
local eventFail    = 13

entity.onTrade = function(player, npc, trade)
    invaderXim.chocobo.renterOnTrade(player, npc, trade, eventSucceed, eventFail)
end

entity.onTrigger = function(player, npc)
    invaderXim.chocobo.renterOnTrigger(player, npc, eventSucceed, eventFail)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end

return entity
