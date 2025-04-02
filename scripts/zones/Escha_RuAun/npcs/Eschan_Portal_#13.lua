-----------------------------------
-- Area: Escha - Ru'Aun (289)
-- NPC: Eschan Portal #13
-- !pos 545.5 -71.5 -17 289
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.escha.portals.eschanPortalOnTrigger(player, npc, 20)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.escha.portals.eschanPortalEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.escha.portals.eschanPortalEventFinish(player, csid, option, npc)
end

return entity
