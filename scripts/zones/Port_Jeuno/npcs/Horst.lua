-----------------------------------
-- Area: Port Jeuno
--  NPC: Horst
-- Type: Abyssea Warp NPC
-- !pos -54.379 0.001 -10.061 246
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.warpNPCOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.warpNPCOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.warpNPCOnEventFinish(player, csid, option, npc)
end

return entity
