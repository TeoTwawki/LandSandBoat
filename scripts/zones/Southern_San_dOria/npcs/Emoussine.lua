-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Emoussine
-- Type: Chocobo Renter
-- !pos -12.3 1.4 -98 230
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventSucceed = 600
local eventFail    = 603

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
