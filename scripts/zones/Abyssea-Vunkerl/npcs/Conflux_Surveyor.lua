-----------------------------------
-- Zone: Abyssea - Vunkerl
--  NPC: Conflux Surveyor
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
