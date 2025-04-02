-----------------------------------
-- Area: Bastok Markets
--  NPC: Sinon
-- Armor Storage NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.armorStorage.onTrade(player, trade, 395)
end

entity.onTrigger = function(player, npc)
    invaderXim.armorStorage.onTrigger(player, 396)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventUpdate(player, csid, option, 396)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventFinish(player, csid, option, 395, 396)
end

return entity
