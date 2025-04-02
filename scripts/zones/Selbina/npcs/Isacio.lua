-----------------------------------
-- Area: Selbina
--  NPC: Isacio
-- Finishes Quest: Elder Memories
-- !pos -54 -1 -44 248
-----------------------------------
local ID = zones[invaderXim.zone.SELBINA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local questStatus = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ELDER_MEMORIES)

    if questStatus == invaderXim.questStatus.QUEST_ACCEPTED then
        local IsacioElderMemVar = player:getCharVar('IsacioElderMemVar')

        if
            IsacioElderMemVar == 1 and
            npcUtil.tradeHas(trade, invaderXim.item.MAGICKED_SKULL)
        then
            player:startEvent(115, invaderXim.item.DAMSELFLY_WORM)
        elseif
            IsacioElderMemVar == 2 and
            npcUtil.tradeHas(trade, invaderXim.item.DAMSELFLY_WORM)
        then
            player:startEvent(116, invaderXim.item.CRAB_APRON)
        elseif
            IsacioElderMemVar == 3 and
            npcUtil.tradeHas(trade, invaderXim.item.CRAB_APRON)
        then
            player:startEvent(117)
        end
    end
end

entity.onTrigger = function(player, npc)
    local questStatus = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ELDER_MEMORIES)

    if player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_OLD_LADY) ~= invaderXim.questStatus.QUEST_AVAILABLE then
        player:startEvent(99)
    elseif questStatus == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(118)
    elseif questStatus == invaderXim.questStatus.QUEST_ACCEPTED then
        local IsacioElderMemVar = player:getCharVar('IsacioElderMemVar')

        if player:hasKeyItem(invaderXim.ki.GILGAMESHS_INTRODUCTORY_LETTER) then
            player:startEvent(117)
        elseif  IsacioElderMemVar == 1 then
            player:startEvent(114, invaderXim.item.MAGICKED_SKULL)
        elseif IsacioElderMemVar == 2 then
            player:startEvent(114, invaderXim.item.DAMSELFLY_WORM)
        elseif IsacioElderMemVar == 3 then
            player:startEvent(114, invaderXim.item.CRAB_APRON)
        end
    else
        if player:getMainLvl() >= invaderXim.settings.main.SUBJOB_QUEST_LEVEL then
            player:startEvent(111, invaderXim.item.MAGICKED_SKULL)
        else
            player:startEvent(119)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 111 and option == 40 then
        player:addQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ELDER_MEMORIES)
        player:setCharVar('IsacioElderMemVar', 1)
    elseif csid == 115 then
        player:confirmTrade()
        player:setCharVar('IsacioElderMemVar', 2)
    elseif csid == 116 then
        player:confirmTrade()
        player:setCharVar('IsacioElderMemVar', 3)
    elseif csid == 117 then
        player:confirmTrade()
        player:unlockJob(0)
        player:setCharVar('IsacioElderMemVar', 0)
        player:messageSpecial(ID.text.SUBJOB_UNLOCKED)
        player:completeQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ELDER_MEMORIES)
    end
end

return entity
