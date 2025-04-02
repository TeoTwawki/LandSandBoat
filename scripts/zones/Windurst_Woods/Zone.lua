-----------------------------------
-- Zone: Windurst_Woods (241)
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    invaderXim.events.harvestFestival.applyHalloweenNpcCostumes(zone:getID())
    invaderXim.chocobo.initZone(zone)
    invaderXim.chocoboGame.clearRecord(zone)
    invaderXim.conquest.toggleRegionalNPCs(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    -- MOG HOUSE IXIMT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        local position = math.random(1, 5) + 37
        player:setPos(-138, -10, position, 0)
    end
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    invaderXim.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
