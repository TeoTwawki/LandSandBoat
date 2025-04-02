-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Magian Moogle (Orange Bobble)
-- Type: Magian Trials NPC (Weapons)
-- !pos -11 2.453 118 64
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.magian.magianOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.magian.magianOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.magian.magianEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.magian.magianOnEventFinish(player, csid, option, npc)
end

return entity
