-----------------------------------
-- Area: Nashmau
--  NPC: Nabihwah
-- Type: Imperial Gate Guard
-- !pos 9.988 -7 68.585 53
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.besieged.onTrigger(player, npc, 253)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.besieged.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.besieged.onEventFinish(player, csid, option, npc)
end

return entity
