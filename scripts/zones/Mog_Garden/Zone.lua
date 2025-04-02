-----------------------------------
-- Zone: Mog Garden (280)
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    invaderXim.mog_garden.onInitialize(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-2.517, 0.452, -5.068, 190)
    end

    return invaderXim.mog_garden.onZoneIn(player, prevZone)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    invaderXim.mog_garden.onTriggerAreaEnter(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    invaderXim.mog_garden.onEventUpdate(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    invaderXim.mog_garden.onEventFinish(player, csid, option, npc)
end

return zoneObject
