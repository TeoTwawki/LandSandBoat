-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Ratonne
-- Armor Storage NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.armorStorage.onTrade(player, trade, 510)
end

entity.onTrigger = function(player, npc)
    invaderXim.armorStorage.onTrigger(player, 511)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventUpdate(player, csid, option, 511)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventFinish(player, csid, option, 510, 511)
end

return entity
