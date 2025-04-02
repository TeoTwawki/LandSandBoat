-----------------------------------
-- Area: Bastok Markets [S]
--  NPC: Melina
-- Type: Chocobo Renter
-- !pos -210.667 0.000 75.819 87
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
