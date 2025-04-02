-----------------------------------
-- Area: Dynamis
--  NPC: Somnial Threshold
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.dynamis.somnialThresholdOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.dynamis.somnialThresholdOnEventFinish(player, csid, option, npc)
end

return entity
