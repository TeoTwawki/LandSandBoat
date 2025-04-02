-----------------------------------
-- Chains of Promathia Helpers
-----------------------------------
local hallID = zones[invaderXim.zone.HALL_OF_TRANSFERENCE]
-----------------------------------
xi = xi or {}
invaderXim.cop = invaderXim.cop or {}
invaderXim.cop.helpers = invaderXim.cop.helpers or {}

invaderXim.cop.helpers.promyvionCrags =
{
    HOLLA = 1,
    DEM   = 2,
    MEA   = 3,
}

invaderXim.cop.helpers.shatteredTelepointInfo =
{
    [invaderXim.zone.LA_THEINE_PLATEAU  ] = { invaderXim.cop.helpers.promyvionCrags.HOLLA, 202, 212, { -266.76,   -0.635,  280.058,   0, 14 }, invaderXim.ki.LIGHT_OF_HOLLA },
    [invaderXim.zone.KONSCHTAT_HIGHLANDS] = { invaderXim.cop.helpers.promyvionCrags.DEM,   913, 918, { -267.194, -40.634, -280.019,   0, 14 }, invaderXim.ki.LIGHT_OF_DEM   },
    [invaderXim.zone.TAHRONGI_CANYON    ] = { invaderXim.cop.helpers.promyvionCrags.MEA,   913, 918, {  280.066, -80.635,  -67.096, 191, 14 }, invaderXim.ki.LIGHT_OF_MEA   },
}

invaderXim.cop.helpers.numPromyvionCompleted = function(player, excludeArea)
    local numKeyItems = 0

    for keyItem = invaderXim.ki.LIGHT_OF_HOLLA, invaderXim.ki.LIGHT_OF_MEA do
        if player:hasKeyItem(keyItem) then
            if
                excludeArea == nil or
                excludeArea and invaderXim.ki.LIGHT_OF_HOLLA + excludeArea - 1 ~= keyItem
            then
                numKeyItems = numKeyItems + 1
            end
        end
    end

    return numKeyItems
end

invaderXim.cop.helpers.hasCompletedPromyvion = function(player, zoneId)
    return player:hasKeyItem(invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][5])
end

invaderXim.cop.helpers.promyvionOnZoneIn = function(player, prevZone)
    local missionOption = invaderXim.mission.getVar(player, invaderXim.mission.log_id.COP, player:getCurrentMission(invaderXim.mission.log_id.COP), 'Option')

    if
        missionOption == 0
    then
        return 50 + invaderXim.cop.helpers.numPromyvionCompleted(player)
    end
end

invaderXim.cop.helpers.sendToPromyvionZone = function(player, promyvionOffset)
    if promyvionOffset == invaderXim.cop.helpers.promyvionCrags.HOLLA then
        player:setPos(92.033, 0, 80.380, 255, 16)
    elseif promyvionOffset == invaderXim.cop.helpers.promyvionCrags.DEM then
        player:setPos(185.891, 0, -52.331, 128, 18)
    elseif promyvionOffset == invaderXim.cop.helpers.promyvionCrags.MEA then
        player:setPos(-93.268, 0, 170.749, 162, 20)
    end
end

invaderXim.cop.helpers.sendToZoneOnFinish = function(player, csid, option, npc)
    if option == 0 then
        invaderXim.cop.helpers.sendToPromyvionZone(player, player:getLocalVar('toPromyvion'))
    end
end

invaderXim.cop.helpers.shatteredTelepointOnTrigger = function(mission, player, npc)
    local zoneId = player:getZoneID()
    local promyvionOffset = invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][1] - 1
    local currentMemory = mission:getVar(player, 'Option')

    if
        player:hasKeyItem(invaderXim.ki.LIGHT_OF_HOLLA + promyvionOffset)
    then
        return mission:progressEvent(invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][2])
    elseif
        currentMemory == 0 or
        currentMemory == invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][1] or
        invaderXim.cop.helpers.numPromyvionCompleted(player) == 2
    then
        local firstEntry = (currentMemory == 0 and player:getCurrentMission(invaderXim.mission.log_id.COP) == invaderXim.mission.id.cop.BELOW_THE_ARKS) and 1 or 0

        return mission:progressEvent(invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][2], 0, 0, firstEntry)
    else
        return mission:progressEvent(invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][3], currentMemory - 1)
    end
end

invaderXim.cop.helpers.shatteredTelepointEntry = function(player, csid, option, npc)
    if option == 0 then
        local zoneId = player:getZoneID()

        player:setPos(unpack(invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][4]))
    end
end

invaderXim.cop.helpers.shatteredTelepointSealMemory = function(mission, player, csid, option, npc)
    if option == 0 then
        local zoneId = player:getZoneID()

        mission:setVar(player, 'Option', 0)
        player:messageSpecial(zones[zoneId].text.MEMORIES_SEALED_OFF)
    end
end

invaderXim.cop.helpers.cermetGateOnTrigger = function(mission, player, npc)
    local cermetLocation = tonumber(string.sub(npc:getName(), -1)) + 1
    local currentMemory  = mission:getVar(player, 'Option')

    if currentMemory ~= cermetLocation then
        return mission:messageSpecial(hallID.text.DOOR_FIRMLY_SHUT):setPriority(1000)
    end
end

invaderXim.cop.helpers.largeApparatusOnTrigger = function(mission, player, npc)
    local currentMemory = mission:getVar(player, 'Option')

    if
        currentMemory == 0 and
        player:getCurrentMission(invaderXim.mission.log_id.COP) == invaderXim.mission.id.cop.BELOW_THE_ARKS
    then
        return mission:progressEvent(160)
    elseif
        invaderXim.cop.helpers.numPromyvionCompleted(player) < 2
    then
        local cragLocation = math.ceil(tonumber(string.sub(npc:getName(), -1)) / 3)

        -- TODO: Assumption is that previously-completed promyvions do not require sealing of memories
        -- for "The Mothercrystals."
        if
            currentMemory == cragLocation and
            not player:hasKeyItem(invaderXim.ki.LIGHT_OF_HOLLA + cragLocation - 1)
        then
            player:setLocalVar('exitOffset', cragLocation)
            return mission:progressEvent(122 + 3 * (cragLocation - 1))
        end
    end
end

invaderXim.cop.helpers.largeApparatusOnEventFinish = function(mission, player, csid, option, npc)
    if option == 0 then
        local exitOffset = player:getLocalVar('exitOffset') - 1

        mission:setVar(player, 'Option', 0)
        invaderXim.teleport.to(player, invaderXim.teleport.id.IXIMTPROMHOLLA + exitOffset)
    end
end

invaderXim.cop.helpers.spireEventFinish = function(mission, player, csid, option, npc)
    if player:getLocalVar('newPromy') == 1 then
        -- This variable is an offset based on a 0-indexed version promyvionCrags table.
        local promyvionId = (player:getZoneID() - 17) / 2
        local teleportLocation = invaderXim.teleport.id.IXIMTPROMHOLLA + promyvionId

        player:addKeyItem(invaderXim.ki.LIGHT_OF_HOLLA + promyvionId)
        player:messageSpecial(zones[player:getZoneID()].text.CANT_REMEMBER, invaderXim.ki.LIGHT_OF_HOLLA + promyvionId)
        player:addExp(1500)
        mission:setVar(player, 'Option', 0)

        local numCompletedPromyvions = invaderXim.cop.helpers.numPromyvionCompleted(player)

        if
            (player:getCurrentMission(invaderXim.mission.log_id.COP) == invaderXim.mission.id.cop.BELOW_THE_ARKS and
            numCompletedPromyvions == 1) or
            numCompletedPromyvions == 3
        then
            mission:complete(player)
        end

        if numCompletedPromyvions == 3 then
            -- We need to make sure the fallthrough does not trigger an overriding
            -- teleport.
            player:setLocalVar('toLufaise', 1)
            teleportLocation = invaderXim.teleport.id.LUFAISE
        end

        invaderXim.teleport.to(player, teleportLocation)
    end
end
