-----------------------------------
-- Area: Western Adoulin
--  NPC: Clautaire
-- Starts, Involved with, and Finishes Quest: 'F.A.I.L.ure Is Not an Option'
-- !pos 44 4 -159 256
-----------------------------------
local ID = zones[invaderXim.zone.WESTERN_ADOULIN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local finao = player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.FAILURE_IS_NOT_AN_OPTION)
    if finao == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:hasKeyItem(invaderXim.ki.HUNK_OF_BEDROCK) then
            -- Finishing Quest: 'F.A.I.L.ure Is Not an Option'
            player:startEvent(76)
        else
            -- Dialgoue during Quest: 'F.A.I.L.ure Is Not an Option'
            player:startEvent(77)
        end
    elseif
        finao == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.ADOULIN) >= 4 and
        player:hasKeyItem(invaderXim.ki.FAIL_BADGE)
    then
        -- Starting Quest: 'F.A.I.L.ure Is Not an Option'
        player:startEvent(78)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 78 then
        -- Starting Quest: 'F.A.I.L.ure Is Not an Option'
        player:addQuest(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.FAILURE_IS_NOT_AN_OPTION)
    elseif csid == 76 then
        -- Finishing Quest: 'F.A.I.L.ure Is Not an Option'
        player:delKeyItem(invaderXim.ki.HUNK_OF_BEDROCK)
        player:completeQuest(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.FAILURE_IS_NOT_AN_OPTION)
        player:addExp(1000 * invaderXim.settings.main.EXP_RATE)
        player:addCurrency('bayld', 500 * invaderXim.settings.main.BAYLD_RATE)
        player:messageSpecial(ID.text.BAYLD_OBTAINED, 500 * invaderXim.settings.main.BAYLD_RATE)

        -- TODO: Verify fame value added
        player:addFame(invaderXim.fameArea.ADOULIN, 30)
    end
end

return entity
