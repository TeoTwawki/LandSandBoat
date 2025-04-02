-----------------------------------
-- Area: Escha - Ru'Aun (289)
-- NPC: Eschan Portal #15
-- !pos -1.2 -52 -580.5 289
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.escha.portals.eschanPortalOnTrigger(player, npc, 22)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.escha.portals.eschanPortalEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.escha.portals.eschanPortalEventFinish(player, csid, option, npc)
end

return entity
