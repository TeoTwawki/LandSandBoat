-----------------------------------
-- TOAU-31: Shades of Vengeance
-- !instance 5600
-----------------------------------
local ID = zones[invaderXim.zone.PERIQIA]
-----------------------------------
local instanceObject = {}

instanceObject.registryRequirements = function(player)
    return player:getCurrentMission(invaderXim.mission.log_id.TOAU) == invaderXim.mission.id.toau.SHADES_OF_VENGEANCE and
        player:hasKeyItem(invaderXim.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT)
end

instanceObject.entryRequirements = function(player)
    return player:getCurrentMission(invaderXim.mission.log_id.TOAU) > invaderXim.mission.id.toau.SHADES_OF_VENGEANCE or
        player:hasKeyItem(invaderXim.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT)
end

instanceObject.afterInstanceRegister = function(player)
    local instance = player:getInstance()

    if player:hasKeyItem(invaderXim.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT) then
        player:messageSpecial(ID.text.FADES_INTO_NOTHINGNESS, invaderXim.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT)
        player:delKeyItem(invaderXim.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT)
    end

    player:addTempItem(invaderXim.item.CAGE_OF_DVUCCA_FIREFLIES)
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
end

instanceObject.onInstanceCreated = function(instance)
    for i, v in pairs(ID.mob[79]) do
        SpawnMob(v, instance)
    end
end

instanceObject.onInstanceCreatedCallback = function(player, instance)
    invaderXim.instance.onInstanceCreatedCallback(player, instance)
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    invaderXim.instance.updateInstanceTime(instance, elapsed, ID.text)
end

instanceObject.onInstanceFailure = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        if v:getCurrentMission(invaderXim.mission.log_id.TOAU) == invaderXim.mission.id.toau.SHADES_OF_VENGEANCE then
            v:setCharVar('Mission[4][30]Timer', VanadielUniqueDay() + 1)
        end

        v:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        v:startEvent(102)
    end
end

instanceObject.onInstanceProgressUpdate = function(instance, progress)
    if progress >= 10 and not instance:completed() then
        instance:complete()
    end
end

instanceObject.onInstanceComplete = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        if v:getCurrentMission(invaderXim.mission.log_id.TOAU) == invaderXim.mission.id.toau.SHADES_OF_VENGEANCE then
            v:setMissionStatus(invaderXim.mission.log_id.TOAU, 1)
        end

        v:startEvent(102)
    end
end

return instanceObject
