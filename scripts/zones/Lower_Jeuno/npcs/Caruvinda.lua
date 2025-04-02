-----------------------------------
-- Area: Lower Jeuno
--  NPC: Caruvinda
-- Armor Storage NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.armorStorage.onTrade(player, trade, 10046)
end

entity.onTrigger = function(player, npc)
    invaderXim.armorStorage.onTrigger(player, 10045)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventUpdate(player, csid, option, 10045)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventFinish(player, csid, option, 10046, 10045)
end

return entity
