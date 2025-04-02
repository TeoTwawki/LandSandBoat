-----------------------------------
-- Area: Lower Jeuno
--  NPC: Panta-Putta
-- Starts and Finishes Quest: The Wonder Magic Set, The kind cardian
-- Involved in Quests: The Lost Cardian
-- !pos -61 0 -140 245
-----------------------------------
local ID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local theWonderMagicSet = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_WONDER_MAGIC_SET)
    local hasWonderMagicSet = player:hasKeyItem(invaderXim.ki.WONDER_MAGIC_SET)
    local theKindCardian    = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_KIND_CARDIAN)

    if
        player:getFameLevel(invaderXim.fameArea.JEUNO) >= 4 and
        theWonderMagicSet == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(77) -- Start quest "The wonder magic set"

    elseif
        theWonderMagicSet == invaderXim.questStatus.QUEST_ACCEPTED and
        not hasWonderMagicSet
    then
        player:startEvent(55) -- During quest "The wonder magic set"

    elseif hasWonderMagicSet then
        player:startEvent(33) -- Finish quest "The wonder magic set"

    elseif
        theWonderMagicSet == invaderXim.questStatus.QUEST_COMPLETED and
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.COOKS_PRIDE) ~= invaderXim.questStatus.QUEST_COMPLETED
    then
        player:startEvent(40) -- Standard dialog

    elseif
        theWonderMagicSet == invaderXim.questStatus.QUEST_COMPLETED and
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_LOST_CARDIAN) == invaderXim.questStatus.QUEST_AVAILABLE
    then
        if player:getCharVar('theLostCardianVar') >= 1 then
            player:startEvent(30) -- Second dialog for "The lost cardien" quest
        else
            player:startEvent(40) -- Standard dialog
        end

    elseif
        theKindCardian == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('theKindCardianVar') == 2
    then
        player:startEvent(35) -- Finish quest "The kind cardien"

    elseif theKindCardian == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(76) -- New standard dialog after "The kind cardien"

    else
        player:startEvent(78) -- Base standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 77 and option == 1 then
        player:addQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_WONDER_MAGIC_SET)
    elseif csid == 33 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MYTHRIL_EARRING)
        else
            player:addTitle(invaderXim.title.FOOLS_ERRAND_RUNNER)
            player:delKeyItem(invaderXim.ki.WONDER_MAGIC_SET)
            player:addItem(invaderXim.item.MYTHRIL_EARRING)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MYTHRIL_EARRING)
            player:addFame(invaderXim.fameArea.JEUNO, 30)
            player:needToZone(true)
            player:completeQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_WONDER_MAGIC_SET)
        end
    elseif csid == 30 then
        player:setCharVar('theLostCardianVar', 2)
    elseif csid == 35 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.GREEN_CAPE)
        else
            player:addTitle(invaderXim.title.BRINGER_OF_BLISS)
            player:delKeyItem(invaderXim.ki.TWO_OF_SWORDS)
            player:setCharVar('theKindCardianVar', 0)
            player:addItem(invaderXim.item.GREEN_CAPE)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.GREEN_CAPE) -- Green Cape
            player:addFame(invaderXim.fameArea.JEUNO, 30)
            player:completeQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_KIND_CARDIAN)
        end
    end
end

return entity
