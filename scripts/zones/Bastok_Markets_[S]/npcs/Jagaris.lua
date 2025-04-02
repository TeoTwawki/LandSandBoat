-----------------------------------
-- Area: Bastok Markets [S]
--  NPC: Jagaris
-- Armor Storage NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.armorStorage.onTrade(player, trade, 328)
end

entity.onTrigger = function(player, npc)
    invaderXim.armorStorage.onTrigger(player, 329)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventUpdate(player, csid, option, 329)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventFinish(player, csid, option, 328, 329)
end

return entity
