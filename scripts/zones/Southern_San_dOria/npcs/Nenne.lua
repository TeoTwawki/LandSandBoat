-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Nenne
-- Starts and Finishes Quest: To Cure a Cough
-- !pos -114 -6 102 230
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local medicineWoman = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_MEDICINE_WOMAN)
    local toCureaCough = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TO_CURE_A_COUGH)

    if
        toCureaCough == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getCharVar('toCureaCough') == 0 and
        medicineWoman == invaderXim.questStatus.QUEST_COMPLETED
    then
        player:startEvent(538)
    elseif player:hasKeyItem(invaderXim.ki.COUGH_MEDICINE) then
        player:startEvent(647)
    else
        player:startEvent(584)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 538 then
        player:setCharVar('toCureaCough', 1)
    elseif csid == 647 then
        player:addTitle(invaderXim.title.A_MOSS_KIND_PERSON)
        player:setCharVar('toCureaCough', 0)
        player:delKeyItem(invaderXim.ki.COUGH_MEDICINE)
        npcUtil.giveKeyItem(player, invaderXim.ki.SCROLL_OF_TREASURE)
        player:addFame(invaderXim.fameArea.SANDORIA, 30)
        player:completeQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TO_CURE_A_COUGH)
    end
end

return entity
