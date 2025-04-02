-----------------------------------
-- Area: Norg
--  NPC: Magephaud
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local everyonesGrudge = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.EVERYONES_GRUDGE)
    if everyonesGrudge == invaderXim.questStatus.QUEST_ACCEPTED then
        if
            trade:hasItemQty(invaderXim.item.GOLD_BEASTCOIN, 3) and
            trade:getItemCount() == 3
        then
            player:startEvent(118, invaderXim.item.GOLD_BEASTCOIN)
        end
    end
end

entity.onTrigger = function(player, npc)
    local nFame = player:getFameLevel(invaderXim.fameArea.NORG)

    if
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.EVERYONES_GRUDGE) == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getCharVar('EVERYONES_GRUDGE_KILLS') >= 1 and
        nFame >= 2
    then
        player:startEvent(116, invaderXim.item.GOLD_BEASTCOIN)  -- Quest start - you have tonberry kills?! I got yo back ^.-
    elseif player:getCharVar('EveryonesGrudgeStarted') == 1 then
        player:startEvent(117, invaderXim.item.GOLD_BEASTCOIN)
    elseif player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.EVERYONES_GRUDGE) == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(119)  -- After completion cs
    else
        player:startEvent(115)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 116 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.EVERYONES_GRUDGE)
        player:setCharVar('EveryonesGrudgeStarted', 1)
    elseif csid == 118 then
        player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.EVERYONES_GRUDGE)
        player:tradeComplete()
        player:addFame(invaderXim.fameArea.NORG, 80)
        npcUtil.giveKeyItem(player, invaderXim.ki.TONBERRY_PRIEST_KEY)
        player:setCharVar('EveryonesGrudgeStarted', 0)
        player:addTitle(invaderXim.title.HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES)
    end
end

return entity
