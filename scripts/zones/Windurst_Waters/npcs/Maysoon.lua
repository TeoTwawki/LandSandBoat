-----------------------------------
-- Area: Windurst Waters
--  NPC: Maysoon
-- Starts and Finishes Quest: Hoist the Jelly, Roger
-- Involved in Quests: Cook's Pride
-- !pos -105 -2 69 238
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.HOIST_THE_JELLY_ROGER) == invaderXim.questStatus.QUEST_ACCEPTED then
        if
            trade:hasItemQty(invaderXim.item.SERVING_OF_ROYAL_JELLY, 1) and
            trade:getGil() == 0 and
            trade:getItemCount() == 1
        then
            player:startEvent(10001) -- Finish quest "Hoist the Jelly, Roger"
        end
    end
end

entity.onTrigger = function(player, npc)
    local cooksPride = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.COOKS_PRIDE)
    local hoistTheJelly = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.HOIST_THE_JELLY_ROGER)

    if
        cooksPride == invaderXim.questStatus.QUEST_ACCEPTED and
        hoistTheJelly == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(10000) -- Start quest "Hoist the Jelly, Roger"
    else
        player:startEvent(266) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 10000 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.HOIST_THE_JELLY_ROGER)
    elseif csid == 10001 then
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.HOIST_THE_JELLY_ROGER)
        npcUtil.giveKeyItem(player, invaderXim.ki.SUPER_SOUP_POT)
        player:addFame(invaderXim.fameArea.WINDURST, 30)
        player:tradeComplete()
    end
end

return entity
