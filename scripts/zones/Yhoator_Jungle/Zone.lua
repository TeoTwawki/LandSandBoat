-----------------------------------
-- Zone: Yhoator_Jungle (124)
-----------------------------------
local ID = zones[invaderXim.zone.YHOATOR_JUNGLE]
require('scripts/quests/i_can_hear_a_rainbow')
require('scripts/missions/amk/helpers')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    UpdateNMSpawnPoint(ID.mob.WOODLAND_SAGE)
    GetMobByID(ID.mob.WOODLAND_SAGE):setRespawnTime(math.random(900, 10800))

    UpdateNMSpawnPoint(ID.mob.POWDERER_PENNY)
    GetMobByID(ID.mob.POWDERER_PENNY):setRespawnTime(math.random(5400, 7200))

    UpdateNMSpawnPoint(ID.mob.BISQUE_HEELED_SUNBERRY)
    GetMobByID(ID.mob.BISQUE_HEELED_SUNBERRY):setRespawnTime(math.random(900, 10800))

    UpdateNMSpawnPoint(ID.mob.BRIGHT_HANDED_KUNBERRY)
    GetMobByID(ID.mob.BRIGHT_HANDED_KUNBERRY):setRespawnTime(math.random(900, 10800))

    invaderXim.conquest.setRegionalConquestOverseers(zone:getRegionID())

    invaderXim.helm.initZone(zone, invaderXim.helmType.HARVESTING)
    invaderXim.helm.initZone(zone, invaderXim.helmType.LOGGING)
    invaderXim.chocobo.initZone(zone)

    invaderXim.beastmenTreasure.updatePeddlestox(invaderXim.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

zoneObject.onGameDay = function()
    invaderXim.beastmenTreasure.updatePeddlestox(invaderXim.zone.YHOATOR_JUNGLE, ID.npc.PEDDLESTOX)
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    invaderXim.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(299.997, -5.838, -622.998, 190)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 2
    end

    -- AMK06/AMK07
    if invaderXim.settings.main.ENABLE_AMK == 1 then
        invaderXim.amk.helpers.tryRandomlyPlaceDiggingLocation(player)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    invaderXim.chocoboGame.handleMessage(player)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 2 then
        quests.rainbow.onEventUpdate(player)
    end
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

zoneObject.onZoneWeatherChange = function(weather)
    -- Harvesting points only appear during rainy weather
    invaderXim.helm.weatherChange(weather, { invaderXim.weather.RAIN, invaderXim.weather.SQUALL }, ID.npc.HARVESTING)
end

return zoneObject
