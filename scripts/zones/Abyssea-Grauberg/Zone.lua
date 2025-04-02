-----------------------------------
-- Zone: Abyssea - Grauberg
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    zone:registerCuboidTriggerArea(1, -570, 20, -810, -487.3, 35, -740)
    invaderXim.helm.initZone(zone, invaderXim.helmType.HARVESTING)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-555, 31, -760, 0)
    end

    invaderXim.abyssea.onZoneIn(player)

    return cs
end

zoneObject.afterZoneIn = function(player)
    invaderXim.abyssea.afterZoneIn(player)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    switch (triggerArea:getTriggerAreaID()): caseof
    {
        [1] = function()
            invaderXim.abyssea.onWardTriggerAreaEnter(player)
        end,
    }
end

zoneObject.onTriggerAreaLeave = function(player, triggerArea)
    switch (triggerArea:getTriggerAreaID()): caseof
    {
        [1] = function()
            invaderXim.abyssea.onWardTriggerAreaLeave(player)
        end,
    }
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.onEventFinish(player, csid, option, npc)
end

return zoneObject
