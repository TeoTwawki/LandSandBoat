-----------------------------------
-- Area: Castle Oztroja
--  NPC: Antiqix
-- Type: Dynamis Vendor
-- !pos -207.835 -0.751 -25.498 151
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.dynamis.hourglassAndCurrencyExchangeNPCOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.dynamis.hourglassAndCurrencyExchangeNPCOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.dynamis.hourglassAndCurrencyExchangeNPCOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.dynamis.hourglassAndCurrencyExchangeNPCOnEventFinish(player, csid, option, npc)
end

return entity
