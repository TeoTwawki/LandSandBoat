-----------------------------------
-- Area: Abyssea-Misareaux
--  NPC: Veridical Conflux #07
-- Aybssea Teleport NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.conflux.confluxOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.conflux.confluxEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.conflux.confluxEventFinish(player, csid, option, npc)
end

return entity
