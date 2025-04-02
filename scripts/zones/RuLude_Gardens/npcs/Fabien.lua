-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Fabien
-- Type: Abyssea Service NPC
-- !pos 2.3 0 -65 243
-----------------------------------
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.traverserNPCOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.traverserNPCOnUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.traverserNPCOnEventFinish(player, csid, option, npc)
end

return entity
