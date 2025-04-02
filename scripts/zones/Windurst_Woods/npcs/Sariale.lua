-----------------------------------
-- Area: Windurst Woods
--  NPC: Sariale
-- Type: Chocobo Renter
-- !pos 133.24 -5.250 -126.76 241
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventSucceed = 10003
local eventFail    = 10006

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
