-----------------------------------
-- Area: The_Eldieme_Necropolis_[S]
--  NPC: Heptachiond
-- Starts and Finishes Quest: REQUIEM_FOR_THE_DEPARTED
-- !pos 256 -32 20 175
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local rftd = player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.REQUIEM_FOR_THE_DEPARTED)

    -- Change to BRASS_RIBBON_OF_SERVICE later when Campaign has been added.
    if
        rftd == invaderXim.questStatus.QUEST_AVAILABLE and
        player:hasKeyItem(invaderXim.ki.BRONZE_RIBBON_OF_SERVICE) and
        player:getMainLvl() >= 30
    then
        player:startEvent(105) -- Start quest "Requiem for the Departed"
    elseif rftd == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:hasKeyItem(invaderXim.ki.SHEAF_OF_HANDMADE_INCENSE) then
            player:startEvent(107) -- During quest "Requiem for the Departed" (with Handmade Incense KI)
        else
            player:startEvent(106) -- During quest "Requiem for the Departed" (before retrieving KI Handmade Incense)
        end
    elseif rftd == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(108) -- New standard dialog after "Requiem for the Departed"
    else
        player:startEvent(104) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 105 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.REQUIEM_FOR_THE_DEPARTED)
    elseif
        csid == 107 and
        npcUtil.completeQuest(player, invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.REQUIEM_FOR_THE_DEPARTED, { item = invaderXim.item.SCROLL_OF_RECALL_MERIPH })
    then
        player:delKeyItem(invaderXim.ki.SHEAF_OF_HANDMADE_INCENSE)
    end
end

return entity
