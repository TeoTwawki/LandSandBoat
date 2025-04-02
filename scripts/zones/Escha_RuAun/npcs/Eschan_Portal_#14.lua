-----------------------------------
-- Area: Escha - Ru'Aun (289)
-- NPC: Eschan Portal #14
-- !pos 274 -40.5 -376.5 289
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.escha.portals.eschanPortalOnTrigger(player, npc, 21)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.escha.portals.eschanPortalEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.escha.portals.eschanPortalEventFinish(player, csid, option, npc)
end

return entity
