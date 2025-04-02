-----------------------------------
-- Area: Heaven's Tower
--  NPC: Kierron
-- Type: Abyssea Warp NPC
-- !pos -7.1 0.5 -4.5 242
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
