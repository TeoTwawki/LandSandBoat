-----------------------------------
-- Assault: Leujaoam Cleansing
-- instance 6900
-----------------------------------
local ID = zones[invaderXim.zone.LEUJAOAM_SANCTUM]
-----------------------------------
local instanceObject = {}

instanceObject.registryRequirements = function(player)
    return player:hasKeyItem(invaderXim.ki.LEUJAOAM_ASSAULT_ORDERS) and
        player:getCurrentAssault() == invaderXim.assault.mission.LEUJAOAM_CLEANSING and
        player:getCharVar('assaultEntered') == 0 and
        player:hasKeyItem(invaderXim.ki.ASSAULT_ARMBAND) and
        player:getMainLvl() > 50
end

instanceObject.entryRequirements = function(player)
    return player:hasKeyItem(invaderXim.ki.LEUJAOAM_ASSAULT_ORDERS) and
        player:getCurrentAssault() == invaderXim.assault.mission.LEUJAOAM_CLEANSING and
        player:getCharVar('assaultEntered') == 0 and
        player:getMainLvl() > 50
end

instanceObject.onInstanceCreated = function(instance)
end

instanceObject.onInstanceCreatedCallback = function(player, instance)
    invaderXim.assault.onInstanceCreatedCallback(player, instance)
    invaderXim.instance.onInstanceCreatedCallback(player, instance)
end

instanceObject.afterInstanceRegister = function(player)
    local instance = player:getInstance()

    invaderXim.assault.afterInstanceRegister(player, invaderXim.item.CAGE_OF_AZOUPH_FIREFLIES)
    GetNPCByID(ID.npc.RUNE_OF_RELEASE, instance):setPos(476.000, 8.479, 40.000, 49)
    GetNPCByID(ID.npc.ANCIENT_LOCKBOX, instance):setPos(476.000, 8.479, 39.000, 49)
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    invaderXim.instance.updateInstanceTime(instance, elapsed, ID.text)
end

instanceObject.onInstanceFailure = function(instance)
    invaderXim.assault.onInstanceFailure(instance)
end

instanceObject.onInstanceProgressUpdate = function(instance, progress)
    if progress >= 1 then
        instance:complete()
    end
end

instanceObject.onInstanceComplete = function(instance)
    invaderXim.assault.onInstanceComplete(instance, 8, 8)
end

instanceObject.onEventFinish = function(player, csid, option, npc)
end

return instanceObject
