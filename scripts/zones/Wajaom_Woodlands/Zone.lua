-----------------------------------
-- Zone: Wajaom_Woodlands (51)
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    invaderXim.helm.initZone(zone, invaderXim.helmType.HARVESTING)
    invaderXim.chocobo.initZone(zone)
    invaderXim.darkRider.addHoofprints(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(610.542, -28.547, 356.247, 122)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onGameHour = function(zone)
    invaderXim.darkRider.onGameHour(zone)

    if VanadielHour() == 0 then
        invaderXim.darkRider.addHoofprints(zone)
    end
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
