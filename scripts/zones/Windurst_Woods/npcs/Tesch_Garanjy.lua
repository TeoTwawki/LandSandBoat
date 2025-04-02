-----------------------------------
-- Area: Windurst Woods
--  NPC: Tesch_Garanjy
-- Armor Storage NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.armorStorage.onTrade(player, trade, 10027)
end

entity.onTrigger = function(player, npc)
    invaderXim.armorStorage.onTrigger(player, 10028)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventUpdate(player, csid, option, 10028)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventFinish(player, csid, option, 10027, 10028)
end

return entity
