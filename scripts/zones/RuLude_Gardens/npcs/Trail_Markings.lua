-----------------------------------
-- Area: Rulude Gardens
--  NPC: Trail Markings
-- Dynamis-Jeuno Enter
-- !pos 35 9 -51 243
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.dynamis.entryNpcOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.dynamis.entryNpcOnEventFinish(player, csid, option, npc)
end

return entity
