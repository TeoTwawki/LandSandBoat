-----------------------------------
-- Area: Middle Delkfutt's Tower
--  NPC: Treasure Chest
-- Involved In Quest: Wings of Gold
-- !zone 157
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.treasure.onTrade(player, npc, trade, invaderXim.treasure.type.CHEST)
end

entity.onTrigger = function(player, npc)
    invaderXim.treasure.onTrigger(player, invaderXim.treasure.type.CHEST)
end

return entity
