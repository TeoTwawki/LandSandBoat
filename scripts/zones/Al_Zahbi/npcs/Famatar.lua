-----------------------------------
-- Area: Al Zahbi
--  NPC: Famatar
-- Type: Imperial Gate Guard
-- !pos -105.538 0.999 75.456 48
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.besieged.onTrigger(player, npc, 218)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.besieged.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.besieged.onEventFinish(player, csid, option, npc)
end

return entity
