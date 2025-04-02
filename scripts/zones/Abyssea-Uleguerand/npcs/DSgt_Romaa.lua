-----------------------------------
-- Area: Abyssea - Uleguerand
--  NPC: Dominion Sergeant
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.sergeantOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.sergeantOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.sergeantOnEventFinish(player, csid, option, npc)
end

return entity
