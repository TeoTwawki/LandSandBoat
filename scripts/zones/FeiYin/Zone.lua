-----------------------------------
-- Zone: FeiYin (204)
-----------------------------------
local ID = zones[invaderXim.zone.FEIYIN]
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    UpdateNMSpawnPoint(ID.mob.CAPRICIOUS_CASSIE)
    GetMobByID(ID.mob.CAPRICIOUS_CASSIE):setRespawnTime(math.random(900, 10800))

    invaderXim.treasure.initZone(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-180, -24, -187, 198)
    end

    if
        player:getCharVar('peaceForTheSpiritCS') == 1 and
        not player:hasItem(invaderXim.item.ANTIQUE_COIN) -- Antique Coin
    then
        SpawnMob(ID.mob.MISER_MURPHY) -- RDM AF
    end

    if player:getCurrentMission(invaderXim.mission.log_id.ACP) == invaderXim.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_I then
        cs = 29
    elseif
        prevZone == invaderXim.zone.BEAUCEDINE_GLACIER and
        player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.PIEUJES_DECISION) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('pieujesDecisionCS') == 0
    then
        cs = 19 -- WHM AF
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    invaderXim.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 19 then
        player:setCharVar('pieujesDecisionCS', 1)
    elseif csid == 29 then
        player:completeMission(invaderXim.mission.log_id.ACP, invaderXim.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_I)
        player:addMission(invaderXim.mission.log_id.ACP, invaderXim.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_II)
    end
end

return zoneObject
