-----------------------------------
-- Area: Qufim_Island
--  NPC: Hieroglyphics
-- Dynamis Qufim Entrance
-- !pos 16 -19 162 126
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
