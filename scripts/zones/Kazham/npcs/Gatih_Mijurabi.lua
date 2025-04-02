-----------------------------------
-- Area: Kazham
--  NPC: Gatih Mijurabi
-- !pos 58.249 -13.086 -49.084 250
-----------------------------------
local ID = zones[invaderXim.zone.KAZHAM]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getCharVar('BathedInScent') == 1 then
        if player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.PERSONAL_HYGIENE) == invaderXim.questStatus.QUEST_AVAILABLE then
            player:startEvent(191)
        elseif player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.PERSONAL_HYGIENE) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:startEvent(192)
        else
            player:startEvent(195)
        end
    elseif
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.PERSONAL_HYGIENE) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('BathedInScent') == 0
    then
        player:startEvent(193)
    else
        player:startEvent(196)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 191 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.PERSONAL_HYGIENE)
    elseif csid == 193 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MITHRAN_STONE)
        else
            player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.PERSONAL_HYGIENE)
            player:addItem(invaderXim.item.MITHRAN_STONE)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MITHRAN_STONE)
        end
    end
end

return entity
