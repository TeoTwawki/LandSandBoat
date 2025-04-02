-----------------------------------
-- Area: Ve'Lugannon Palace
--  NPC: Treasure Coffer
-- !zone 177
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.treasure.onTrade(player, npc, trade, invaderXim.treasure.type.COFFER)
end

entity.onTrigger = function(player, npc)
    invaderXim.treasure.onTrigger(player, invaderXim.treasure.type.COFFER)
end

return entity
