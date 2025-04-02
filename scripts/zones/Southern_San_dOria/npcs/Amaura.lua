-----------------------------------
-- Area: Southern San d'Oria
-- NPC : Amaura
-- Involved in Quest: The Medicine Woman, To Cure a Cough
-- !pos -85 -6 89 230
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local toCureaCough = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TO_CURE_A_COUGH)

    if
        player:getCharVar('DiaryPage') >= 3 or
        toCureaCough == invaderXim.questStatus.QUEST_ACCEPTED
    then
        if
            not player:hasKeyItem(invaderXim.ki.THYME_MOSS) and
            not player:hasKeyItem(invaderXim.ki.COUGH_MEDICINE)
        then
            player:startEvent(645) -- need thyme moss for cough med
        elseif player:hasKeyItem(invaderXim.ki.THYME_MOSS) then
            player:startEvent(646) -- receive cough med for Nenne
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 645 then
        player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TO_CURE_A_COUGH)
    elseif csid == 646 then
        player:delKeyItem(invaderXim.ki.THYME_MOSS)
        npcUtil.giveKeyItem(player, invaderXim.ki.COUGH_MEDICINE)
    end
end

return entity
