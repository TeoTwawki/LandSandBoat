-----------------------------------
-- Area: Lower Jeuno
--  NPC: Naruru
-- Starts and Finishes Quests: Cook's Pride
-- !pos -56 0.1 -138 245
-----------------------------------
local ID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local cooksPride     = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.COOKS_PRIDE)
    local theKindCardian = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_KIND_CARDIAN)

    if
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_WONDER_MAGIC_SET) == invaderXim.questStatus.QUEST_COMPLETED and
        cooksPride == invaderXim.questStatus.QUEST_AVAILABLE
    then
        if player:getCharVar('CooksPrideVar') == 0 then
            player:startEvent(189) -- Start quest "Cook's pride" Long CS
        else
            player:startEvent(188) -- Start quest "Cook's pride" Short CS
        end

    elseif
        cooksPride == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.SUPER_SOUP_POT)
    then
        player:startEvent(186) -- During quest "Cook's pride"

    elseif player:hasKeyItem(invaderXim.ki.SUPER_SOUP_POT) then
        player:startEvent(187) -- Finish quest "Cook's pride"

    elseif
        cooksPride == invaderXim.questStatus.QUEST_COMPLETED and
        theKindCardian == invaderXim.questStatus.QUEST_AVAILABLE
    then
        if player:getCharVar('theLostCardianVar') == 0 then
            player:startEvent(31) -- During quests "The lost cardian"
        else
            player:startEvent(71) -- During quests "The lost cardian"
        end

    elseif
        cooksPride == invaderXim.questStatus.QUEST_COMPLETED and
        theKindCardian ~= invaderXim.questStatus.QUEST_COMPLETED
    then
        player:startEvent(71) -- During quests "The kind cardien"

    elseif theKindCardian == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(72) -- New standard dialog after the quest "The kind cardien"

    else
        player:startEvent(98) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        (csid == 189 or csid == 188) and
        option == 0
    then
        player:addQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.COOKS_PRIDE)

    elseif csid == 189 and option == 1 then
        player:setCharVar('CooksPrideVar', 1)

    elseif csid == 187 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MYTHRIL_RING)
        else
            player:addTitle(invaderXim.title.MERCY_ERRAND_RUNNER)
            player:delKeyItem(invaderXim.ki.SUPER_SOUP_POT)
            player:setCharVar('CooksPrideVar', 0)
            npcUtil.giveCurrency(player, 'gil', 3000)
            player:addItem(invaderXim.item.MYTHRIL_RING)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MYTHRIL_RING)
            player:addFame(invaderXim.fameArea.JEUNO, 30)
            player:completeQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.COOKS_PRIDE)
        end
    end
end

return entity
