-----------------------------------
-- Area: Caedarva Mire
--  NPC: qm10
-- Involved in quest: Operation Teatime
-- !pos 473 -31 75 79
-----------------------------------
local ID = zones[invaderXim.zone.CAEDARVA_MIRE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local operationTeatime = player:getQuestStatus(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.OPERATION_TEATIME)
    local operationTeatimeProgress = player:getCharVar('OperationTeatimeProgress')

    if
        operationTeatime == invaderXim.questStatus.QUEST_ACCEPTED and
        operationTeatimeProgress == 3
    then
        player:startEvent(15)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 15 then
        npcUtil.completeQuest(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.OPERATION_TEATIME, { item = 15602, var = 'OperationTeatimeProgress' })
    end
end

return entity
