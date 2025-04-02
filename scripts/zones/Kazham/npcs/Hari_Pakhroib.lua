-----------------------------------
-- Area: Kazham
--  NPC: Hari Pakhroib
-- Starts and Finishes Quest: Greetings to the Guardian
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local guardian = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.GREETINGS_TO_THE_GUARDIAN)
    local pamamas = player:getCharVar('PamamaVar')
    local pfame = player:getFameLevel(invaderXim.fameArea.WINDURST)
    local needToZone = player:needToZone()

    if guardian == invaderXim.questStatus.QUEST_ACCEPTED then
        if pamamas == 1 then
            player:startEvent(71) --Finish Quest
        else
            player:startEvent(69, 0, 4596) --Reminder Dialogue
        end
    elseif guardian == invaderXim.questStatus.QUEST_AVAILABLE and pfame >= 7 then
        player:startEvent(68, 4596, 4596, 4596) --Start Quest
    elseif guardian == invaderXim.questStatus.QUEST_COMPLETED and not needToZone then
        if pamamas == 2 then
            player:startEvent(71) --Finish quest dialogue (no different csid between initial and repeats)
        else
            player:startEvent(72) --Dialogue for after completion of quest
        end
    elseif guardian == invaderXim.questStatus.QUEST_COMPLETED and needToZone then
        player:startEvent(72)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 68 and option == 1 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.GREETINGS_TO_THE_GUARDIAN)
        player:setCharVar('PamamaVar', 0)
    elseif csid == 71 then
        local pamamas = player:getCharVar('PamamaVar')
        if pamamas == 1 then --First completion of quest; set title, complete quest, and give higher fame
            npcUtil.giveCurrency(player, 'gil', 5000)
            player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.GREETINGS_TO_THE_GUARDIAN)
            player:addFame(invaderXim.fameArea.WINDURST, 100)
            player:addTitle(invaderXim.title.KAZHAM_CALLER)
            player:setCharVar('PamamaVar', 0)
            player:needToZone(true)
        elseif pamamas == 2 then --Repeats of quest; give only gil and less fame
            npcUtil.giveCurrency(player, 'gil', 5000)
            player:addFame(invaderXim.fameArea.WINDURST, 30)
            player:setCharVar('PamamaVar', 0)
            player:needToZone(true)
        end
    end
end

return entity
