-----------------------------------
-- Area: Southern San d'Oria [S]
--  NPC: Renadile
-- Armor Storage NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.armorStorage.onTrade(player, trade, 626)
end

entity.onTrigger = function(player, npc)
    invaderXim.armorStorage.onTrigger(player, 627)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventUpdate(player, csid, option, 627)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.armorStorage.onEventFinish(player, csid, option, 626, 627)
end

return entity
