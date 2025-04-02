-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Aurege
-- Type: Quest Giver NPC
-- Starts Quest: Exit the Gambler
-- !pos -156.253 11.999 253.691 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local exitTheGambler = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.IXIMT_THE_GAMBLER)
    local exitTheGamblerStat = player:getCharVar('exitTheGamblerStat')

    if
        exitTheGambler < invaderXim.questStatus.QUEST_COMPLETED and
        exitTheGamblerStat == 0
    then
        player:startEvent(521)
    elseif
        exitTheGambler == invaderXim.questStatus.QUEST_ACCEPTED and
        exitTheGamblerStat == 1
    then
        player:startEvent(516)
    else
        player:startEvent(514)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 521 and
        player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.IXIMT_THE_GAMBLER) == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.IXIMT_THE_GAMBLER)
    elseif csid == 516 then
        npcUtil.completeQuest(player, invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.IXIMT_THE_GAMBLER, {
            keyItem = invaderXim.ki.MAP_OF_KING_RANPERRES_TOMB,
            exp = 2000,
            title = invaderXim.title.DAYBREAK_GAMBLER
        })
    end
end

return entity
