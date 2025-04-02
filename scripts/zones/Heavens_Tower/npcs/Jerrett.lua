-----------------------------------
-- Area: Heaven's Tower
--  NPC: Jerrett
-- Type: Abyssea Service NPC
-- !pos -7.85 0.5 -3.4 242
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
