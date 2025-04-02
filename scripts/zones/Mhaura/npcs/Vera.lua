-----------------------------------
-- Area: Mhaura
--  NPC: Vera
-- Finishes Quest: The Old Lady
-- !pos -49 -5 20 249
-----------------------------------
local ID = zones[invaderXim.zone.MHAURA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local questStatus = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_OLD_LADY)

    if
        questStatus == invaderXim.questStatus.QUEST_ACCEPTED and
        trade:getItemCount() == 1
    then
        local veraOldLadyVar = player:getCharVar('VeraOldLadyVar')

        if
            veraOldLadyVar == 1 and
            trade:hasItemQty(invaderXim.item.WILD_RABBIT_TAIL, 1)
        then
            player:startEvent(135, invaderXim.item.CUP_OF_DHALMEL_SALIVA)
        elseif
            veraOldLadyVar == 2 and
            trade:hasItemQty(invaderXim.item.CUP_OF_DHALMEL_SALIVA, 1)
        then
            player:startEvent(136, invaderXim.item.BLOODY_ROBE)
        elseif
            veraOldLadyVar == 3 and
            trade:hasItemQty(invaderXim.item.BLOODY_ROBE, 1)
        then
            player:startEvent(137)
        end
    end
end

entity.onTrigger = function(player, npc)
    local questStatus = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_OLD_LADY)

    if player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ELDER_MEMORIES) ~= invaderXim.questStatus.QUEST_AVAILABLE then
        player:startEvent(130)
    elseif questStatus == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(138)
    elseif questStatus == invaderXim.questStatus.QUEST_ACCEPTED then
        local veraOldLadyVar = player:getCharVar('VeraOldLadyVar')

        if player:hasKeyItem(invaderXim.ki.GILGAMESHS_INTRODUCTORY_LETTER) then
            player:startEvent(137)
        elseif veraOldLadyVar == 1 then
            player:startEvent(132, invaderXim.item.WILD_RABBIT_TAIL)
        elseif veraOldLadyVar == 2 then
            player:startEvent(132, invaderXim.item.CUP_OF_DHALMEL_SALIVA)
        elseif veraOldLadyVar == 3 then
            player:startEvent(132, invaderXim.item.BLOODY_ROBE)
        end
    else
        if player:getMainLvl() >= invaderXim.settings.main.SUBJOB_QUEST_LEVEL then
            player:startEvent(131, invaderXim.item.WILD_RABBIT_TAIL)
        else
            player:startEvent(133)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 131 and option == 40 then
        player:addQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_OLD_LADY)
        player:setCharVar('VeraOldLadyVar', 1)
    elseif csid == 135 then
        player:tradeComplete()
        player:setCharVar('VeraOldLadyVar', 2)
    elseif csid == 136 then
        player:tradeComplete()
        player:setCharVar('VeraOldLadyVar', 3)
    elseif csid == 137 then
        player:tradeComplete()
        player:unlockJob(0)
        player:setCharVar('VeraOldLadyVar', 0)
        player:messageSpecial(ID.text.SUBJOB_UNLOCKED)
        player:completeQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_OLD_LADY)
    end
end

return entity
