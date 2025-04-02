-----------------------------------
-- Area: Lower Jeuno (245)
--  NPC: Waypoint
--  SoA: Waypoint
-- !pos 20 -34.922 0.000 245
-----------------------------------
local ID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.waypoint.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(invaderXim.ki.ADOULINIAN_CHARTER_PERMIT) then
        invaderXim.waypoint.onTrigger(player, npc)
    else
        player:messageSpecial(ID.text.WAYPOINT_EXAMINE)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.waypoint.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.waypoint.onEventFinish(player, csid, option, npc)
end

return entity
