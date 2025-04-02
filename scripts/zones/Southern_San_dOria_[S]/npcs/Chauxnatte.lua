-----------------------------------
-- Area: Southern Sand'Oria [S]
--  NPC: Chauxnatte
-- Type: Chocobo Renter
-- !pos 85 1 -51 80
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventSucceed = 106
local eventFail    = 107

entity.onTrigger = function(player, npc)
    invaderXim.chocobo.renterOnTrigger(player, npc, eventSucceed, eventFail)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end

return entity
