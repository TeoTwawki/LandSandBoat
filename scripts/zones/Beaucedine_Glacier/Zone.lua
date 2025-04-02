-----------------------------------
-- Zone: Beaucedine_Glacier (111)
-----------------------------------
local ID = zones[invaderXim.zone.BEAUCEDINE_GLACIER]
require('scripts/quests/i_can_hear_a_rainbow')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    UpdateNMSpawnPoint(ID.mob.HUMBABA)
    GetMobByID(ID.mob.HUMBABA):setRespawnTime(math.random(3600, 4200))

    invaderXim.conquest.setRegionalConquestOverseers(zone:getRegionID())
    invaderXim.voidwalker.zoneOnInit(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if prevZone == invaderXim.zone.DYNAMIS_BEAUCEDINE then -- warp player to a correct position after dynamis
        player:setPos(-284.751, -39.923, -422.948, 235)
    end

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-247.911, -82.165, 260.207, 248)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 114
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    invaderXim.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 114 then
        quests.rainbow.onEventUpdate(player)
    end
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

zoneObject.onZoneWeatherChange = function(weather)
    local mirrorPond = GetNPCByID(ID.npc.MIRROR_POND_J8) -- Quest: Love And Ice

    if mirrorPond then
        if weather ~= invaderXim.weather.SNOW and weather ~= invaderXim.weather.BLIZZARDS then
            mirrorPond:setStatus(invaderXim.status.NORMAL)
        else
            mirrorPond:setStatus(invaderXim.status.DISAPPEAR)
        end
    end
end

return zoneObject
