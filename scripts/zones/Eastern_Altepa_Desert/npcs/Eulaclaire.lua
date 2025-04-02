-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Eulaclaire
-- Type: Chocobo Renter
-- !pos -55.715 3.949 232.524 114
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventSucceed = 6
local eventFail    = 7

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
