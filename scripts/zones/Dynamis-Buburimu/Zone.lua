-----------------------------------
-- Zone: Dynamis-Buburimu
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    invaderXim.dynamis.zoneOnInitialize(zone)
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    invaderXim.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onZoneIn = function(player, prevZone)
    return invaderXim.dynamis.zoneOnZoneIn(player, prevZone)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    invaderXim.dynamis.zoneOnEventFinish(player, csid, option, npc)
end

return zoneObject
