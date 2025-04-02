-----------------------------------
-- Area: Norg
--  NPC: Ryoma
-- Start and Finish Quest: 20 in Pirate Years, I'll Take the Big Box, True Will, Bugi Soden
-- !pos -23 0 -9 252
-----------------------------------
local ID = zones[invaderXim.zone.NORG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local twentyInPirateYears = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TWENTY_IN_PIRATE_YEARS)
    local illTakeTheBigBox = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.I_LL_TAKE_THE_BIG_BOX)
    local trueWill = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRUE_WILL)
    local mLvl = player:getMainLvl()
    local mJob = player:getMainJob()

    if
        twentyInPirateYears == invaderXim.questStatus.QUEST_AVAILABLE and
        mJob == invaderXim.job.NIN and
        mLvl >= 40
    then
        player:startEvent(133) -- Start Quest "20 in Pirate Years"
    elseif
        twentyInPirateYears == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.TRICK_BOX)
    then
        player:startEvent(134) -- Finish Quest "20 in Pirate Years"
    elseif
        twentyInPirateYears == invaderXim.questStatus.QUEST_COMPLETED and
        illTakeTheBigBox == invaderXim.questStatus.QUEST_AVAILABLE and
        mJob == invaderXim.job.NIN and
        mLvl >= 50 and
        not player:needToZone()
    then
        player:startEvent(135) -- Start Quest "I'll Take the Big Box"
    elseif
        illTakeTheBigBox == invaderXim.questStatus.QUEST_COMPLETED and
        trueWill == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(136) -- Start Quest "True Will"
    elseif
        player:hasKeyItem(invaderXim.ki.OLD_TRICK_BOX) and
        player:getCharVar('trueWillCS') == 0
    then
        player:startEvent(137)
    elseif player:getCharVar('trueWillCS') == 1 then
        player:startEvent(138)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 133 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TWENTY_IN_PIRATE_YEARS)
        player:setCharVar('twentyInPirateYearsCS', 1)
    elseif csid == 134 then
        if player:getFreeSlotsCount() <= 1 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.ANJU)
        else
            player:delKeyItem(invaderXim.ki.TRICK_BOX)
            player:addItem(invaderXim.item.ANJU)
            player:addItem(invaderXim.item.ZUSHIO)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.ANJU) -- Anju
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.ZUSHIO) -- Zushio
            player:needToZone()
            player:setCharVar('twentyInPirateYearsCS', 0)
            player:addFame(invaderXim.fameArea.NORG, 30)
            player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TWENTY_IN_PIRATE_YEARS)
        end
    elseif csid == 135 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.I_LL_TAKE_THE_BIG_BOX)
    elseif csid == 136 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRUE_WILL)
    elseif csid == 137 then
        player:setCharVar('trueWillCS', 1)
    end
end

return entity
