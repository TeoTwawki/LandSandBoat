-----------------------------------
-- Area: Metalworks
--  NPC: Matrimonial Coffer
-- !pos 90.079 -20.170 -12.937 237
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.matrimonialcoffer.startEvent(player)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.matrimonialcoffer.finishEvent(player, csid, option, npc)
end

return entity
