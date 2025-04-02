-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Hajawaa
-- Armor Storage NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.armorStorage.onTrade(player, trade, 703)
end

entity.onTrigger = function(player, npc)
    invaderXim.armorStorage.onTrigger(player, 704)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventUpdate(player, csid, option, 704)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventFinish(player, csid, option, 703, 704)
end

return entity
