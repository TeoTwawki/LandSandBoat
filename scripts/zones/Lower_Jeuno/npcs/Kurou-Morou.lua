-----------------------------------
-- Area: Lower Jeuno
-- Starts and Finishes Quest: Your Crystal Ball & Never to return
-- !pos -4 -6 -28 245
-----------------------------------
local ID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.YOUR_CRYSTAL_BALL) == invaderXim.questStatus.QUEST_ACCEPTED and
        trade:getItemCount() == 1
    then
        if trade:hasItemQty(invaderXim.item.AHRIMAN_LENS, 1) then
            player:startEvent(192) -- CS for ahriman lens trade; Trading the lens to Kurou-Morou is optional
        elseif trade:hasItemQty(invaderXim.item.DIVINATION_SPHERE, 1) then
            player:startEvent(196) -- Trade divination sphere, finish quest
        end

    elseif
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.NEVER_TO_RETURN) == invaderXim.questStatus.QUEST_ACCEPTED and
        trade:hasItemQty(invaderXim.item.HORN_HAIRPIN, 1) and
        trade:getItemCount() == 1
    then
        player:startEvent(203) -- Finish "Never to return" quest
    end
end

entity.onTrigger = function(player, npc)
    local yourCrystalBall           = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.YOUR_CRYSTAL_BALL)
    local searchingForTheRightWords = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SEARCHING_FOR_THE_RIGHT_WORDS)
    local rubbishDay                = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.RUBBISH_DAY)
    local neverToReturn             = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.NEVER_TO_RETURN)
    local jeunoFame                 = player:getFameLevel(invaderXim.fameArea.JEUNO)
    local searchingForWordsPrereq   = player:getCharVar('QuestSearchRightWords_prereq')

    if
        jeunoFame >= 2 and
        yourCrystalBall == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(194) -- Start 'Your Crystal Ball' quest

    elseif
        jeunoFame >= 5 and
        yourCrystalBall == invaderXim.questStatus.QUEST_COMPLETED and
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.NEVER_TO_RETURN) == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getCharVar('QuestNeverToReturn_day') ~= VanadielDayOfTheYear()
    then
        local prog = player:getCharVar('QuestNeverToReturn_prog')
        if prog <= 2 then
            local fortune = math.random(1, 99)
            player:startEvent(204, fortune) -- Required to get fortune read 3x on 3 diff game days before quest is kicked off
        elseif prog == 3 then
            player:startEvent(202) -- Start 'Never to return' quest
        end

    --if searching for right words *prereq* CS has been activated
    elseif searchingForWordsPrereq == 1 then
        player:startEvent(38)

    elseif player:getCharVar('QuestSearchRightWords_denied') == 1 then
        player:startEvent(36)

    elseif searchingForTheRightWords == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(39)

    elseif player:getCharVar('SearchingForRightWords_postcs') == -2 then
        player:startEvent(154)

    elseif searchingForTheRightWords == invaderXim.questStatus.QUEST_COMPLETED then --final state, after all quests complete
        player:startEvent(37)

    --conditions for searching for the right words
    elseif
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.A_CANDLELIGHT_VIGIL) == invaderXim.questStatus.QUEST_COMPLETED and
        rubbishDay == invaderXim.questStatus.QUEST_COMPLETED and
        neverToReturn == invaderXim.questStatus.QUEST_COMPLETED and
        searchingForTheRightWords == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(17)

    else
        player:startEvent(193) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 194 and option == 0 then
        player:addQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.YOUR_CRYSTAL_BALL)

    elseif csid == 196 then
        player:addTitle(invaderXim.title.FORTUNE_TELLER_IN_TRAINING)
        player:addFame(invaderXim.fameArea.JEUNO, 30)
        player:tradeComplete()
        player:completeQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.YOUR_CRYSTAL_BALL)

    elseif csid == 204 and option == 0 then
        player:incrementCharVar('QuestNeverToReturn_prog', 1)  -- Keep track of how many times the players fortune has been read
        player:setCharVar('QuestNeverToReturn_day', VanadielDayOfTheYear()) -- new vanadiel day

    elseif csid == 202 and option == 0 then
        player:addQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.NEVER_TO_RETURN)
        player:setCharVar('QuestNeverToReturn_prog', 0)
        player:setCharVar('QuestNeverToReturn_day', 0)

    elseif csid == 203 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.GARNET_RING)
        else
            npcUtil.giveCurrency(player, 'gil', 1200)
            player:addItem(invaderXim.item.GARNET_RING)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.GARNET_RING)
            player:addFame(invaderXim.fameArea.JEUNO, 30)
            player:tradeComplete()
            player:completeQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.NEVER_TO_RETURN)
        end

    elseif csid == 17 then
        player:setCharVar('QuestSearchRightWords_prereq', 1)

    elseif csid == 154 then
        player:setCharVar('SearchingForRightWords_postcs', -1)
    end
end

return entity
