-----------------------------------
-- Area: Port Jeuno
--  NPC: Caffie
-- Type: Chocobo Renter
-- !pos -2.51 8 -1 246
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventSucceed = 10002
local eventFail    = 10005

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
