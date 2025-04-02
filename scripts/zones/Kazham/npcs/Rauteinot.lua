-----------------------------------
-- Area: Kazham
--  NPC: Rauteinot
-- Starts and Finishes Quest: Missionary Man
-- !pos -42 -10 -89 250
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('MissionaryManVar') == 1 and
        trade:hasItemQty(invaderXim.item.SLAB_OF_ELSHIMO_MARBLE, 1) and
        trade:getItemCount() == 1
    then
        player:startEvent(139) -- Trading elshimo marble
    end
end

entity.onTrigger = function(player, npc)
    local missionaryMan = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.MISSIONARY_MAN)
    local missionaryManVar = player:getCharVar('MissionaryManVar')

    if
        missionaryMan == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.WINDURST) >= 3
    then
        player:startEvent(137, 0, invaderXim.item.SLAB_OF_ELSHIMO_MARBLE) -- Start quest "Missionary Man"
    elseif missionaryMan == invaderXim.questStatus.QUEST_ACCEPTED and missionaryManVar == 1 then
        player:startEvent(138, 0, invaderXim.item.SLAB_OF_ELSHIMO_MARBLE) -- During quest (before trade marble) "Missionary Man"
    elseif
        missionaryMan == invaderXim.questStatus.QUEST_ACCEPTED and
        (missionaryManVar == 2 or missionaryManVar == 3)
    then
        player:startEvent(140) -- During quest (after trade marble) "Missionary Man"
    elseif missionaryMan == invaderXim.questStatus.QUEST_ACCEPTED and missionaryManVar == 4 then
        player:startEvent(141) -- Finish quest "Missionary Man"
    elseif missionaryMan == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(142) -- New standard dialog
    else
        player:startEvent(136) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 137 and option == 1 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.MISSIONARY_MAN)
        player:setCharVar('MissionaryManVar', 1)
    elseif csid == 139 then
        player:setCharVar('MissionaryManVar', 2)
        npcUtil.giveKeyItem(player, invaderXim.ki.RAUTEINOTS_PARCEL)
        player:tradeComplete()
    elseif csid == 141 then
        if npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_TELEPORT_YHOAT) then
            player:setCharVar('MissionaryManVar', 0)
            player:delKeyItem(invaderXim.ki.SUBLIME_STATUE_OF_THE_GODDESS)
            player:addFame(invaderXim.fameArea.WINDURST, 30)
            player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.MISSIONARY_MAN)
        end
    end
end

return entity
