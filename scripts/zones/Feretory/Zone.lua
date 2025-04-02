-----------------------------------
-- Zone: Feretory
-----------------------------------
require('scripts/globals/monstrosity')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- Unused
end

zoneObject.onZoneIn = function(player, prevZone)
    return invaderXim.monstrosity.feretoryOnZoneIn(player, prevZone)
end

zoneObject.onZoneOut = function(player)
    invaderXim.monstrosity.feretoryOnZoneOut(player)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    -- Unused
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    invaderXim.monstrosity.feretoryOnEventUpdate(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    invaderXim.monstrosity.feretoryOnEventFinish(player, csid, option, npc)
end

return zoneObject
