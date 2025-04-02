-----------------------------------
-- Assault: Excavation Duty
-----------------------------------
local ID = zones[invaderXim.zone.LEBROS_CAVERN]
-----------------------------------
local instanceObject = {}

instanceObject.registryRequirements = function(player)
    return player:hasKeyItem(invaderXim.ki.LEBROS_ASSAULT_ORDERS) and
        player:getCurrentAssault() == invaderXim.assault.mission.EXCAVATION_DUTY and
        player:getCharVar('assaultEntered') == 0 and
        player:hasKeyItem(invaderXim.ki.ASSAULT_ARMBAND) and
        player:getMainLvl() > 50
end

instanceObject.entryRequirements = function(player)
    return player:hasKeyItem(invaderXim.ki.LEBROS_ASSAULT_ORDERS) and
        player:getCurrentAssault() == invaderXim.assault.mission.EXCAVATION_DUTY and
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

    invaderXim.assault.afterInstanceRegister(player, invaderXim.item.CAGE_OF_ZHAYOLM_FIREFLIES)
    GetNPCByID(ID.npc.RUNE_OF_RELEASE, instance):setPos(49.999, -40.837, 96.999, 0)
    GetNPCByID(ID.npc.ANCIENT_LOCKBOX, instance):setPos(50.000, -40.070, 99.999, 0)
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    invaderXim.instance.updateInstanceTime(instance, elapsed, ID.text)
end

instanceObject.onInstanceFailure = function(instance)
    invaderXim.assault.onInstanceFailure(instance)
end

instanceObject.onInstanceProgressUpdate = function(instance, progress)
    if progress >= 5 then
        instance:complete()
    end
end

instanceObject.onInstanceComplete = function(instance)
    invaderXim.assault.onInstanceComplete(instance, 5, 10)
end

instanceObject.onEventFinish = function(player, csid, option, npc)
end

return instanceObject
