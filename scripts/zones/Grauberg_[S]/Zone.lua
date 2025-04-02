-----------------------------------
-- Zone: Grauberg_[S] (89)
-----------------------------------
require('scripts/globals/dark_ixion')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    invaderXim.helm.initZone(zone, invaderXim.helmType.HARVESTING)
    invaderXim.darkixion.zoneOnInit(zone)
end

zoneObject.onGameHour = function(zone)
    invaderXim.darkixion.zoneOnGameHour(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(495.063, 69.903, 924.102, 23)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onZoneWeatherChange = function(weather)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
