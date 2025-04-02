-----------------------------------
-- Area: Southern San d'Oria [S]
--  NPC: Hunt Registry
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.hunts.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.hunts.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.hunts.onEventFinish(player, csid, option, npc)
end

return entity
