-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Yasmina
-- Type: Chocobo Renter
-- !pos -34.972 -5.815 221.845 94
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventSucceed = 6
local eventFail    = 7

entity.onTrigger = function(player, npc)
    invaderXim.chocobo.renterOnTrigger(player, npc, eventSucceed, eventFail)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end

return entity
