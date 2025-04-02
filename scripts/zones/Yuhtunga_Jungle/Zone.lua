-----------------------------------
-- Zone: Yuhtunga_Jungle (123)
-----------------------------------
local ID = zones[invaderXim.zone.YUHTUNGA_JUNGLE]
require('scripts/quests/i_can_hear_a_rainbow')
require('scripts/missions/amk/helpers')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- A Chocobo Riding Game finish line
    zone:registerCylindricalTriggerArea(1, -485.54, -379.19, 5)

    invaderXim.conquest.setRegionalConquestOverseers(zone:getRegionID())

    invaderXim.helm.initZone(zone, invaderXim.helmType.HARVESTING)
    invaderXim.helm.initZone(zone, invaderXim.helmType.LOGGING)

    invaderXim.beastmenTreasure.updatePeddlestox(invaderXim.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)

    GetMobByID(ID.mob.TURTLERIDER):setRespawnTime(math.random(900, 10800))

    GetMobByID(ID.mob.PYUU_THE_SPATEMAKER):setRespawnTime(math.random(5400, 7200))
end

zoneObject.onGameDay = function()
    invaderXim.beastmenTreasure.updatePeddlestox(invaderXim.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
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
        player:setPos(116.825, 6.613, 100, 140)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 11
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
    local triggerAreaID = triggerArea:getTriggerAreaID()

    if triggerAreaID == 1 and player:hasStatusEffect(invaderXim.effect.MOUNTED) then
        invaderXim.chocoboGame.onTriggerAreaEnter(player)
    end
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 11 then
        quests.rainbow.onEventUpdate(player)
    end
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    invaderXim.chocoboGame.onEventFinish(player, csid)
end

zoneObject.onZoneWeatherChange = function(weather)
    -- Harvesting points only appear during rainy weather
    invaderXim.helm.weatherChange(weather, { invaderXim.weather.RAIN, invaderXim.weather.SQUALL }, ID.npc.HARVESTING)

    -- NM Bayawak only spawns during fire weather
    local bayawak = GetMobByID(ID.mob.BAYAWAK)
    if bayawak then
        if weather == invaderXim.weather.HOT_SPELL or weather == invaderXim.weather.HEAT_WAVE then
            DisallowRespawn(bayawak:getID(), false)

            -- Spawn if respawn is up
            if os.time() > bayawak:getLocalVar('respawn') then
                SpawnMob(bayawak:getID())
            end
        else
            DisallowRespawn(bayawak:getID(), true)
        end
    end
end

return zoneObject
