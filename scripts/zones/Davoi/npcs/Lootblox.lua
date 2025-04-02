-----------------------------------
-- Area: Davoi
--  NPC: Lootblox
-- !pos 218.073 -0.982 -20.746 149
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
