-----------------------------------
-- Area: Windurst Walls
--  NPC: Koru-Moru
-- Starts & Ends Quest: Star Struck
-- Involved in Quest: Making the Grade, Riding on the Clouds
-- !pos -120 -6 124 239
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WALLS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local count = trade:getItemCount()

    if
        trade:hasItemQty(invaderXim.item.SQUARE_OF_SILK_CLOTH, 1) and
        count == 1 and
        trade:getGil() == 0
    then
        if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:startEvent(349)
            player:tradeComplete()
            player:setCharVar('rootProblem', 2)
        end
    elseif
        trade:hasItemQty(invaderXim.item.ASTRAGALOS, 4) and
        count == 4 and
        trade:getGil() == 0
    then
        if
            player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION) == invaderXim.questStatus.QUEST_ACCEPTED and
            player:getCharVar('ClassReunionProgress') == 2
        then
            player:startEvent(407) -- now Koru remembers something that you need to inquire his former students.
        end
    end
end

entity.onTrigger = function(player, npc)
    local rootProblem = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM)
    local thePuppetMaster = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_PUPPET_MASTER)
    local classReunion = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION)
    local classReunionProgress = player:getCharVar('ClassReunionProgress')
    local talk1 = player:getCharVar('ClassReunion_TalkedToFupepe')
    local talk2 = player:getCharVar('ClassReunion_TalkedToFurakku')
    local carbuncleDebacle = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CARBUNCLE_DEBACLE)
    local carbuncleDebacleProgress = player:getCharVar('CarbuncleDebacleProgress')

    -----------------------------------
    -- Carbuncle Debacle
    if
        carbuncleDebacle == invaderXim.questStatus.QUEST_ACCEPTED and
        carbuncleDebacleProgress == 1 or
        carbuncleDebacleProgress == 2
    then
        player:startEvent(416) -- go and see Ripapa
    elseif
        carbuncleDebacle == invaderXim.questStatus.QUEST_ACCEPTED and
        carbuncleDebacleProgress == 4
    then
        player:startEvent(417) -- now go and see Agado-Pugado
    elseif
        carbuncleDebacle == invaderXim.questStatus.QUEST_ACCEPTED and
        carbuncleDebacleProgress == 5
    then
        player:startEvent(418) -- Uran-Mafran must be stopped
    elseif
        carbuncleDebacle == invaderXim.questStatus.QUEST_ACCEPTED and
        carbuncleDebacleProgress == 7
    then
        player:startEvent(419) -- ending cs
    elseif
        thePuppetMaster == invaderXim.questStatus.QUEST_COMPLETED and
        classReunion == invaderXim.questStatus.QUEST_COMPLETED and
        carbuncleDebacle == invaderXim.questStatus.QUEST_COMPLETED
    then
        player:startEvent(420) -- new cs after all 3 SMN AFs done
    -----------------------------------
    -- Class Reunion
    elseif
        classReunion == invaderXim.questStatus.QUEST_ACCEPTED and
        classReunionProgress == 1
    then
        player:startEvent(412, 0, 450, invaderXim.item.ASTRAGALOS, 0, 0, 0, 0, 0) -- bring Koru 4 astragaloi
    elseif
        classReunion == invaderXim.questStatus.QUEST_ACCEPTED and
        classReunionProgress == 2
    then
        player:startEvent(414, 0, 0, invaderXim.item.ASTRAGALOS, 0, 0, 0, 0, 0) -- reminder to bring 4 astragaloi
    elseif
        classReunion == invaderXim.questStatus.QUEST_ACCEPTED and
        classReunionProgress >= 3 and
        (talk1 ~= 1 or talk2 ~= 1)
    then
        player:startEvent(408) -- reminder to visit the students
    elseif
        classReunion == invaderXim.questStatus.QUEST_ACCEPTED and
        classReunionProgress == 6 and
        talk1 == 1 and
        talk2 == 1
    then
            player:startEvent(410) -- ending cs
    elseif
        thePuppetMaster == invaderXim.questStatus.QUEST_COMPLETED and
        classReunion == invaderXim.questStatus.QUEST_COMPLETED
    then
        player:startEvent(411) -- new cs after completed AF2
    -----------------------------------
    elseif
        rootProblem == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('rootProblem') == 1
    then
        player:startEvent(348, 0, invaderXim.item.SQUARE_OF_SILK_CLOTH)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 412 then
        player:delKeyItem(invaderXim.ki.CARBUNCLES_TEAR)
        player:setCharVar('ClassReunionProgress', 2)
    elseif csid == 407 then
        player:tradeComplete()
        player:setCharVar('ClassReunionProgress', 3)
    elseif csid == 410 then
        if player:getFreeSlotsCount() ~= 0 then
            player:addItem(invaderXim.item.EVOKERS_SPATS)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.EVOKERS_SPATS)
            player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION)
            player:setCharVar('ClassReunionProgress', 0)
            player:setCharVar('ClassReunion_TalkedToFurakku', 0)
            player:setCharVar('ClassReunion_TalkedToFupepe', 0)
            player:needToZone(true)
            player:addFame(invaderXim.fameArea.WINDURST, 40)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.EVOKERS_SPATS)
        end
    elseif csid == 416 then
        player:setCharVar('CarbuncleDebacleProgress', 2)
    elseif csid == 417 then
        player:setCharVar('CarbuncleDebacleProgress', 5)
        npcUtil.giveKeyItem(player, invaderXim.ki.DAZE_BREAKER_CHARM)
    elseif csid == 419 then
        if player:getFreeSlotsCount() ~= 0 then
            player:addItem(invaderXim.item.EVOKERS_HORN) -- Evoker's Horn
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.EVOKERS_HORN)
            player:addTitle(invaderXim.title.PARAGON_OF_SUMMONER_EXCELLENCE)
            player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CARBUNCLE_DEBACLE)
            player:addFame(invaderXim.fameArea.WINDURST, 60)
            player:setCharVar('CarbuncleDebacleProgress', 0)
            player:needToZone(true)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.EVOKERS_HORN)
        end
    end
end

return entity
