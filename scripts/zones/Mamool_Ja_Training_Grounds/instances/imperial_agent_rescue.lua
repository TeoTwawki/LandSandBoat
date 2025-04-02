-----------------------------------
-- Assault: Imperial Agent Rescue
-- An agent sent to spy on the secret training grounds of the Mamool Ja has been captured. Rescue him before he is interrogated for Imperial secrets.
-----------------------------------
local ID = zones[invaderXim.zone.MAMOOL_JA_TRAINING_GROUNDS]
-----------------------------------
local instanceObject = {}

instanceObject.registryRequirements = function(player)
    return player:hasKeyItem(invaderXim.ki.MAMOOL_JA_ASSAULT_ORDERS) and
        player:getCurrentAssault() == invaderXim.assault.mission.IMPERIAL_AGENT_RESCUE and
        player:getCharVar('assaultEntered') == 0 and
        player:hasKeyItem(invaderXim.ki.ASSAULT_ARMBAND) and
        player:getMainLvl() > 50
end

instanceObject.entryRequirements = function(player)
    return player:hasKeyItem(invaderXim.ki.MAMOOL_JA_ASSAULT_ORDERS) and
        player:getCurrentAssault() == invaderXim.assault.mission.IMPERIAL_AGENT_RESCUE and
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

    invaderXim.assault.afterInstanceRegister(player, invaderXim.item.CAGE_OF_BHAFLAU_FIREFLIES)
    GetNPCByID(ID.npc.RUNE_OF_RELEASE, instance):setPos(220.000, 1.465, -504.999, 0)
    GetNPCByID(ID.npc.ANCIENT_LOCKBOX, instance):setPos(220.000, 1.619, -502.999, 0)
    instance:setProgress(math.random(ID.npc.POT_HATCH, ID.npc.POT_HATCH + 2))
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    invaderXim.instance.updateInstanceTime(instance, elapsed, ID.text)
end

instanceObject.onInstanceFailure = function(instance)
    invaderXim.assault.onInstanceFailure(instance)
end

instanceObject.onInstanceProgressUpdate = function(instance, progress)
end

instanceObject.onInstanceComplete = function(instance)
    invaderXim.assault.onInstanceComplete(instance, 9, 8)
end

instanceObject.onEventFinish = function(player, csid, option, npc)
end

return instanceObject
