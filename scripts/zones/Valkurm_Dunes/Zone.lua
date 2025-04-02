-----------------------------------
-- Zone: Valkurm_Dunes (103)
-----------------------------------
local ID = zones[invaderXim.zone.VALKURM_DUNES]
require('scripts/quests/i_can_hear_a_rainbow')
require('scripts/missions/amk/helpers')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    invaderXim.conquest.setRegionalConquestOverseers(zone:getRegionID())
    invaderXim.mogTablet.onZoneInitialize(zone)

    local qm2 = GetNPCByID(ID.npc.WHM_AF1_QM)
    if qm2 then
        local time = VanadielHour()
        if time < 5 or time >= 18 then
            qm2:setStatus(invaderXim.status.NORMAL)
        else
            qm2:setStatus(invaderXim.status.DISAPPEAR)
        end
    end
end

zoneObject.onZoneTick = function(zone)
    invaderXim.mogTablet.onZoneTick(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(60.989, -4.898, -151.001, 198)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 3
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

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    invaderXim.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 3 then
        quests.rainbow.onEventUpdate(player)
    end
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

zoneObject.onGameHour = function(zone)
    local qm2 = GetNPCByID(ID.npc.WHM_AF1_QM)

    if qm2 then
        if VanadielHour() == 5 then
            qm2:setStatus(invaderXim.status.DISAPPEAR)
        end

        if VanadielHour() == 18 then
            qm2:setStatus(invaderXim.status.NORMAL)
        end
    end
end

zoneObject.onZoneWeatherChange = function(weather)
    local qm1 = GetNPCByID(ID.npc.SUNSAND_QM) -- Quest: An Empty Vessel

    if qm1 then
        if weather == invaderXim.weather.DUST_STORM then
            qm1:setStatus(invaderXim.status.NORMAL)
        else
            qm1:setStatus(invaderXim.status.DISAPPEAR)
        end
    end
end

return zoneObject
