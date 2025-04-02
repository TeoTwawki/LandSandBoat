-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Delivery Crate
-- NPC used in magian trials
-- !pos -11.844 3.099 120.421 243
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.magian.deliveryCrateOnTrade(player, npc, trade)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.magian.deliveryCrateOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.magian.deliveryCrateOnEventFinish(player, csid, option, npc)
end

return entity
