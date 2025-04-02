-----------------------------------
-- TOAU-42: Path of Darkness
-- !instance 7700
-----------------------------------
local ID = zones[invaderXim.zone.NYZUL_ISLE]
-----------------------------------
local instanceObject = {}

-- Requirements for the first player registering the instance
instanceObject.registryRequirements = function(player)
    return player:getCurrentMission(invaderXim.mission.log_id.TOAU) == invaderXim.mission.id.toau.PATH_OF_DARKNESS and
        player:hasKeyItem(invaderXim.ki.NYZUL_ISLE_ROUTE) and
        player:getMissionStatus(invaderXim.mission.log_id.TOAU) == 1
end

-- Requirements for further players entering an already-registered instance
instanceObject.entryRequirements = function(player)
    return player:getCurrentMission(invaderXim.mission.log_id.TOAU) >= invaderXim.mission.id.toau.PATH_OF_DARKNESS
end

-- Called on the instance once it is created and ready
instanceObject.onInstanceCreated = function(instance)
    SpawnMob(ID.mob.AMNAF_BLU, instance)
    SpawnMob(ID.mob.NAJA_SALAHEEM, instance)
end

-- Once the instance is ready inform the requester that it's ready
instanceObject.onInstanceCreatedCallback = function(player, instance)
    invaderXim.instance.onInstanceCreatedCallback(player, instance)

    -- Kill the Nyzul Isle update spam
    for _, v in ipairs(player:getParty()) do
        if v:getZoneID() == instance:getEntranceZoneID() then
            v:updateEvent(405, 3, 3, 3, 3, 3, 3, 3)
        end
    end
end

-- When the player zones into the instance
instanceObject.afterInstanceRegister = function(player)
    local instance = player:getInstance()

    -- NOTE: Time Limit observed in capture prior to KI fading.  This could be asyncronyous,
    -- but moving here from that reference.
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())

    if player:hasKeyItem(invaderXim.ki.NYZUL_ISLE_ROUTE) then
        player:delKeyItem(invaderXim.ki.NYZUL_ISLE_ROUTE)
        player:messageSpecial(ID.text.FADES_INTO_NOTHINGNESS, invaderXim.ki.NYZUL_ISLE_ROUTE)
    end

    player:addTempItem(invaderXim.item.UNDERSEA_RUINS_FIREFLIES)
end

-- Instance "tick"
instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    invaderXim.instance.updateInstanceTime(instance, elapsed, ID.text)
end

-- On fail
instanceObject.onInstanceFailure = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        v:startEvent(1)
    end
end

-- When something in the instance calls: instance:setProgress(...)
instanceObject.onInstanceProgressUpdate = function(instance, progress)
    if progress >= 10 and progress < 20 then
        DespawnMob(ID.mob.AMNAF_BLU, instance)
    elseif progress == 24 then
        local naja = GetMobByID(ID.mob.NAJA_SALAHEEM, instance)

        if naja then
            naja:setLocalVar('ready', 0)
            naja:setLocalVar('Stage', 2)
        end

        SpawnMob(ID.mob.AMNAF_BLU, instance)
    elseif progress >= 30 and progress < 40 then
        DespawnMob(ID.mob.AMNAF_BLU, instance)
    elseif progress == 48 then
        SpawnMob(ID.mob.AMNAF_PSYCHEFLAYER, instance)

        local naja = GetMobByID(ID.mob.NAJA_SALAHEEM, instance)
        if naja then
            naja:setLocalVar('ready', 0)
            naja:setLocalVar('Stage', 3)
        end

        local door = GetNPCByID(ID.npc.DOOR_OFFSET + 8, instance)
        if door then
            door:setAnimation(invaderXim.animation.OPEN_DOOR)
        end

    elseif progress == 50 then
        instance:complete()
    end
end

-- On win
instanceObject.onInstanceComplete = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        if
            v:getCurrentMission(invaderXim.mission.log_id.TOAU) == invaderXim.mission.id.toau.PATH_OF_DARKNESS and
            v:getMissionStatus(invaderXim.mission.log_id.TOAU) == 1
        then
            v:setMissionStatus(invaderXim.mission.log_id.TOAU, 2)
        end

        v:setPos(0, 0, 0, 0, 72)
    end
end

-- Standard event hooks, these will take priority over everything apart from m_event.Script
-- Omitting this will fallthrough to the same calls in the Zone.lua

--instanceObject.onEventUpdate = function(player, csid, option, npc)
--end

--instanceObject.onEventFinish = function(player, csid, option, npc)
--end

return instanceObject
