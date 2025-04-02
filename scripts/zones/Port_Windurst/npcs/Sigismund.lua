-----------------------------------
-- Area: Port Windurst
--  NPC: Sigismund
-- Starts and Finishes Quest: To Catch a Falling Star
-- !pos -110 -10 82 240
-----------------------------------
local ID = zones[invaderXim.zone.PORT_WINDURST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local starstatus = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TO_CATCH_A_FALLING_STAR)
    if
        starstatus == 1 and
        trade:hasItemQty(invaderXim.item.STARFALL_TEAR, 1) and
        trade:getItemCount() == 1 and
        trade:getGil() == 0
    then
        player:startEvent(199) -- Quest Finish
    end
end

entity.onTrigger = function(player, npc)
    local starstatus = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TO_CATCH_A_FALLING_STAR)
    if starstatus == invaderXim.questStatus.QUEST_AVAILABLE then
        player:startEvent(196, 0, invaderXim.item.STARFALL_TEAR) -- Quest Start
    elseif starstatus == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(197, 0, invaderXim.item.STARFALL_TEAR) -- Quest Reminder
    elseif
        starstatus == invaderXim.questStatus.QUEST_COMPLETED and
        player:getCharVar('QuestCatchAFallingStar_prog') > 0
    then
        player:startEvent(200) -- After Quest
        player:setCharVar('QuestCatchAFallingStar_prog', 0)
    else
        player:startEvent(357)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 196 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TO_CATCH_A_FALLING_STAR)
    elseif csid == 199 then
        player:tradeComplete()
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TO_CATCH_A_FALLING_STAR)
        player:addFame(invaderXim.fameArea.WINDURST, 75)
        player:addItem(invaderXim.item.FISH_SCALE_SHIELD)
        player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.FISH_SCALE_SHIELD)
        player:setCharVar('QuestCatchAFallingStar_prog', 2)
    end
end

return entity
