-----------------------------------
-- Zone: East_Sarutabaruta (116)
-----------------------------------
local ID = zones[invaderXim.zone.EAST_SARUTABARUTA]
require('scripts/quests/i_can_hear_a_rainbow')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- A Chocobo Riding Game finish line
    zone:registerCylindricalTriggerArea(1, -119.92, -520.08, 10)

    UpdateNMSpawnPoint(ID.mob.DUKE_DECAPOD)
    GetMobByID(ID.mob.DUKE_DECAPOD):setRespawnTime(math.random(3600, 4200))
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-125, -3, -519, 4)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 50
    elseif
        player:getCurrentMission(invaderXim.mission.log_id.ASA) == invaderXim.mission.id.asa.BURGEONING_DREAD and
        prevZone == invaderXim.zone.WINDURST_WOODS and
        not player:hasStatusEffect(invaderXim.effect.MOUNTED)
    then
        cs = 71
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
    local triggerAreaID = triggerArea:getTriggerAreaID()

    if triggerAreaID == 1 and player:hasStatusEffect(invaderXim.effect.MOUNTED) then
        invaderXim.chocoboGame.onTriggerAreaEnter(player)
    end
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 50 then
        quests.rainbow.onEventUpdate(player)
    elseif csid == 71 then
        player:setCharVar('ASA_Status', option)
    end
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 71 then
        player:completeMission(invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.BURGEONING_DREAD)
        player:addMission(invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.THAT_WHICH_CURDLES_BLOOD)
    end

    invaderXim.chocoboGame.onEventFinish(player, csid)
end

return zoneObject
