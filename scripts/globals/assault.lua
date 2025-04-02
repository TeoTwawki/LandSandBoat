-----------------------------------
-- Assault Utilities
-- desc: Common functionality for Assaults
-----------------------------------
require('scripts/globals/besieged')
require('scripts/globals/npc_util')
-----------------------------------
xi = xi or {}
invaderXim.assault = invaderXim.assault or {}

invaderXim.assault.assaultOrders =
{
    invaderXim.ki.LEUJAOAM_ASSAULT_ORDERS,
    invaderXim.ki.MAMOOL_JA_ASSAULT_ORDERS,
    invaderXim.ki.LEBROS_ASSAULT_ORDERS,
    invaderXim.ki.PERIQIA_ASSAULT_ORDERS,
    invaderXim.ki.ILRUSI_ASSAULT_ORDERS,
    invaderXim.ki.NYZUL_ISLE_ASSAULT_ORDERS,
}

invaderXim.assault.getAssaultArea = function(player)
    return math.floor((player:getCurrentAssault() - 1) / 10)
end

invaderXim.assault.hasOrders = function(player)
    for _, assaultOrders in pairs(invaderXim.assault.assaultOrders) do
        if player:hasKeyItem(assaultOrders) then
            return true
        end
    end

    return false
end

invaderXim.assault.onAssaultUpdate = function(player, csid, option, npc)
    local ID = zones[player:getZoneID()]

    local cap = bit.band(option, 0x03)
    if cap == 0 then
        cap = 0
    elseif cap == 1 then
        cap = 70
    elseif cap == 2 then
        cap = 60
    else
        cap = 50
    end

    player:setLocalVar('AssaultCap', cap)

    if
        player:getGMLevel() == 0 and
        player:getPartySize() < invaderXim.settings.main.ASSAULT_MINIMUM
    then
        player:messageSpecial(ID.text.MEMBER_TOO_FAR - 1, invaderXim.settings.main.ASSAULT_MINIMUM)
        player:instanceEntry(npc, 1)
        return
    elseif player:checkSoloPartyAlliance() == 2 then
        player:messageText(player, ID.text.MEMBER_NO_REQS + 1, false)
        player:instanceEntry(npc, 1)
        return
    end
end

invaderXim.assault.onInstanceCreatedCallback = function(player, instance)
    if instance then
        instance:setLevelCap(player:getLocalVar('AssaultCap'))
        player:setLocalVar('AssaultCap', 0)
        player:setCharVar('Assault_Armband', 1)
        player:delKeyItem(invaderXim.ki.ASSAULT_ARMBAND)
    else
        local npc = player:getEventTarget()
        player:messageText(player, zones[player:getZoneID()].text.CANNOT_ENTER, false)
        player:instanceEntry(npc, 3)
    end
end

invaderXim.assault.afterInstanceRegister = function(player, fireFlies)
    local instance = player:getInstance()
    local assaultID = player:getCurrentAssault()
    local levelCap = instance:getLevelCap()
    local ID = zones[player:getZoneID()]

    player:setCharVar('assaultEntered', assaultID)
    player:messageSpecial(ID.text.ASSAULT_START_OFFSET + assaultID, assaultID)
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
    player:addTempItem(fireFlies)

    if levelCap ~= 0 then
        player:addStatusEffect(invaderXim.effect.LEVEL_RESTRICTION, levelCap, 0, 0)
    end

    for _, entity in pairs(ID.mob[assaultID].MOBS_START) do
        SpawnMob(entity, instance)
    end
end

invaderXim.assault.onInstanceFailure = function(instance)
    local chars = instance:getChars()
    local mobs = instance:getMobs()

    for _, entity in pairs(mobs) do
        local mobID = entity:getID()
        DespawnMob(mobID, instance)
    end

    for _, entity in pairs(chars) do
        entity:messageSpecial(zones[instance:getZone():getID()].text.MISSION_FAILED, 10, 10)
        entity:startEvent(102)
    end
end

invaderXim.assault.onInstanceComplete = function(instance, posX, posZ)
    local chars = instance:getChars()
    local ID = zones[instance:getZone():getID()]

    GetNPCByID(ID.npc.RUNE_OF_RELEASE, instance):setStatus(invaderXim.status.NORMAL)
    GetNPCByID(ID.npc.ANCIENT_LOCKBOX, instance):setStatus(invaderXim.status.NORMAL)

    for _, entity in pairs(chars) do
        entity:messageSpecial(ID.text.RUNE_UNLOCKED_POS, posX, posZ)
    end
end

invaderXim.assault.instanceOnEventFinish = function(player, csid, zone)
    if csid == 102 then
        local instance = player:getInstance()
        local chars = instance:getChars()
        for _, entity in pairs(chars) do
            entity:setPos(0, 0, 0, 0, zone)
        end
    end
end

invaderXim.assault.runeReleaseFinish = function(player, csid, option, npc)
    if csid == 100 and option == 1 then
        local instance = player:getInstance()
        local chars = instance:getChars()
        local zone = player:getZoneID()
        local ID = zones[zone]
        local playerpoints = math.max((#chars - 3) * 0.1, 0)
        local points = 0
        local assaultID = player:getCurrentAssault()
        local mobs = instance:getMobs()
        local pointsArea = invaderXim.assault.getAssaultArea(player)

        for _, entity in pairs(mobs) do
            local mobID = entity:getID()
            DespawnMob(mobID, instance)
        end

        for _, entity in pairs(chars) do
            if entity:getLocalVar('AssaultPointsAwarded') == 0 then
                entity:setLocalVar('AssaultPointsAwarded', 1)

                local pointModifier = invaderXim.assault.missionInfo[assaultID].minimumPoints
                points = pointModifier - (pointModifier * playerpoints)
                if entity:getCharVar('Assault_Armband') == 1 then
                    points = points * 1.1
                end

                if entity:hasCompletedAssault(assaultID) then
                    points = math.floor(points)
                    entity:setVar('AssaultPromotion', entity:getCharVar('AssaultPromotion') + 1)
                    entity:addAssaultPoint(pointsArea, points)
                    entity:messageSpecial(ID.text.ASSAULT_POINTS_OBTAINED, points)
                else
                    points = math.floor(points * 1.5)
                    entity:setVar('AssaultPromotion', entity:getCharVar('AssaultPromotion') + 5)
                    entity:addAssaultPoint(pointsArea, points)
                    entity:messageSpecial(ID.text.ASSAULT_POINTS_OBTAINED, points)
                end

                entity:setVar('AssaultComplete', 1)
                entity:startEvent(102)
            end
        end
    end
end

invaderXim.assault.adjustMobLevel = function(mob)
    local instance = mob:getInstance()
    local levelCap = instance:getLevelCap()
    local reducedLevel = 0
    local entity = GetMobByID(mob:getID(), instance)

    if levelCap ~= 0 then
        if levelCap == 70 then
            reducedLevel = 5
        elseif levelCap == 60 then
            reducedLevel = 15
        elseif levelCap == 50 then
            reducedLevel = 25
        end

        if entity then
            entity:setMobLevel(entity:getMainLvl() - reducedLevel)
        end
    end
end
