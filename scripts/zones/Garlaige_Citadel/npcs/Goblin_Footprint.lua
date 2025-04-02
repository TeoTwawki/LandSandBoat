-----------------------------------
-- Area: Garlaige Citadel
--  NPC: Goblin Footprint
-- !pos  -382.632 -6.999 372.181 200
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.goblinfootprint.rewatch(player)
end

entity.onTrigger = function(player, npc)
    invaderXim.goblinfootprint.rewatch(player, true)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.goblinfootprint.startEvent(player, csid, option, npc)
end

return entity
