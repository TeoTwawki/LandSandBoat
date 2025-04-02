-----------------------------------
-- Area: Reisenjima (291)
-- NPC: Ethereal Ingress #3
-- !pos -531.4 -50 398.75 291
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.escha.portals.eschanPortalOnTrigger(player, npc, 25)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.escha.portals.eschanPortalEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.escha.portals.eschanPortalEventFinish(player, csid, option, npc)
end

return entity
