-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Goblin Footprint
-- !pos  -129.021 -25.127 -601.431 119
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
