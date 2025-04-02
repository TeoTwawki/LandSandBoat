-----------------------------------
-- Area: Port San d'Oria
--  NPC: Dealer Moogle
-- !pos 13.026 -4.000 -87.403 232
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.dealerMoogle.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.dealerMoogle.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.dealerMoogle.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.dealerMoogle.onEventFinish(player, csid, option, npc)
end

return entity
