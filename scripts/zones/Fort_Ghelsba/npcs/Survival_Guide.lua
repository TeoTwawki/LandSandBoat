-----------------------------------
-- Area: Fort Ghelsba
--  NPC: Survival Guide
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, targetNpc)
    invaderXim.survivalGuide.onTrigger(player)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.survivalGuide.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.survivalGuide.onEventFinish(player, csid, option, npc)
end

return entity
