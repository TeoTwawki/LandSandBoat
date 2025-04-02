-----------------------------------
-- Zone: Uleguerand_Range (5)
-----------------------------------
local ID = zones[invaderXim.zone.ULEGUERAND_RANGE]
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- ffxiclopedia's pages for Black Coney and White Coney say 7 and 5 Earth seconds respectively, in game it is very fast
    -- https://ffxiclopedia.fandom.com/wiki/Black_Coney
    -- https://ffxiclopedia.fandom.com/wiki/White_Coney
    -- BG Wiki has no info. For now, triggers every 3 vana minutes
    GetNPCByID(ID.npc.RABBIT_FOOTPRINT):addPeriodicTrigger(0, 3, 0)
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
        player:setPos(363.025, 16, -60, 12)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

zoneObject.onZoneWeatherChange = function(weather)
    local waterfall = GetNPCByID(ID.npc.WATERFALL)

    if waterfall then
        if weather == invaderXim.weather.SNOW or weather == invaderXim.weather.BLIZZARDS then
            if waterfall:getAnimation() ~= invaderXim.anim.CLOSE_DOOR then
                waterfall:setAnimation(invaderXim.anim.CLOSE_DOOR)
            end
        else
            if waterfall:getAnimation() ~= invaderXim.anim.OPEN_DOOR then
                waterfall:setAnimation(invaderXim.anim.OPEN_DOOR)
            end
        end
    end
end

return zoneObject
