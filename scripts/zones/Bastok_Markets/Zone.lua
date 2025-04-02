-----------------------------------
-- Zone: Bastok_Markets (235)
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    invaderXim.events.harvestFestival.applyHalloweenNpcCostumes(zone:getID())
end

zoneObject.onZoneIn = function(player, prevZone)
    -- MOG HOUSE IXIMT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        local position = math.random(1, 5) - 33
        player:setPos(-177, -8, position, 127)
    end
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    invaderXim.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onGameDay = function()
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
