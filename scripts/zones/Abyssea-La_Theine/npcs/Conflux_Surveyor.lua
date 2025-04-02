-----------------------------------
-- Zone: Abyssea - La Theine
--  NPC: Conflux Surveyor
-- !pos 133.000 -72.738 -824.000 15
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.surveyorOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.surveyorOnEventFinish(player, csid, option, npc)
end

return entity
