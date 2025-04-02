-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Vincent
-- Type: Abyssea Warp NPC
-- !pos 4 0 -65 243
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
