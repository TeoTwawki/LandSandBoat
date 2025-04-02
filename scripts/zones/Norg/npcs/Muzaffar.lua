-----------------------------------
-- Area: Norg
--  NPC: Muzaffar
-- Quests: Black Market
-- !pos 16.678, -2.044, -14.600 252
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local count = trade:getItemCount()
    local northernFurs = trade:hasItemQty(invaderXim.item.NORTHERN_FUR, 4)
    local easternPottery = trade:hasItemQty(invaderXim.item.PIECE_OF_EASTERN_POTTERY, 4)
    local southernMummies = trade:hasItemQty(invaderXim.item.SOUTHERN_MUMMY, 4)

    if
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET) == invaderXim.questStatus.QUEST_ACCEPTED or
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET) == invaderXim.questStatus.QUEST_COMPLETED
    then
        if northernFurs and count == 4 then
            player:tradeComplete()
            player:startEvent(17, invaderXim.item.NORTHERN_FUR, invaderXim.item.NORTHERN_FUR)
        elseif easternPottery and count == 4 then
            player:tradeComplete()
            player:startEvent(18, invaderXim.item.PIECE_OF_EASTERN_POTTERY, invaderXim.item.PIECE_OF_EASTERN_POTTERY)
        elseif southernMummies and count == 4 then
            player:tradeComplete()
            player:startEvent(19, invaderXim.item.SOUTHERN_MUMMY, invaderXim.item.SOUTHERN_MUMMY)
        end
    end
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET) == invaderXim.questStatus.QUEST_ACCEPTED or
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET) == invaderXim.questStatus.QUEST_COMPLETED
    then
        player:startEvent(16)
    else
        player:startEvent(15)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 15 and option == 1 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET)
    elseif csid == 17 then
        npcUtil.giveCurrency(player, 'gil', 1500)
        if player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET)
        end

        player:addFame(invaderXim.fameArea.NORG, 40)
        player:addTitle(invaderXim.title.BLACK_MARKETEER)
        player:startEvent(20)
    elseif csid == 18 then
        npcUtil.giveCurrency(player, 'gil', 2000)
        if player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET)
        end

        player:addFame(invaderXim.fameArea.NORG, 50)
        player:addTitle(invaderXim.title.BLACK_MARKETEER)
        player:startEvent(20)
    elseif csid == 19 then
        npcUtil.giveCurrency(player, 'gil', 3000)
        if player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BLACK_MARKET)
        end

        player:addFame(invaderXim.fameArea.NORG, 80)
        player:addTitle(invaderXim.title.BLACK_MARKETEER)
        player:startEvent(20)
    end
end

return entity
