-----------------------------------
-- Area: Western Adoulin
--  NPC: Jorin
-- Starts, Involved with, and Finishes Quest: 'The Old Man and the Harpoon'
-- !pos 92 32 152 256
-----------------------------------
local ID = zones[invaderXim.zone.WESTERN_ADOULIN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local tomath = player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON)

    if tomath == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:hasKeyItem(invaderXim.ki.EXTRAVAGANT_HARPOON) then
            -- Finishing Quest: 'The Old Man and the Harpoon'
            player:startEvent(2542)
        else
            -- Dialgoue during Quest: 'The Old Man and the Harpoon'
            player:startEvent(2541)
        end
    elseif tomath == invaderXim.questStatus.QUEST_AVAILABLE then
        -- Starts Quest: 'The Old Man and the Harpoon'
        player:startEvent(2540)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 2540 then
        -- Starting Quest: 'The Old Man and the Harpoon'
        player:addQuest(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON)
        npcUtil.giveKeyItem(player, invaderXim.ki.BROKEN_HARPOON)
    elseif csid == 2542 then
        -- Finishing Quest: 'The Old Man and the Harpoon'
        player:completeQuest(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON)
        player:addExp(500 * invaderXim.settings.main.EXP_RATE)
        player:addCurrency('bayld', 300 * invaderXim.settings.main.BAYLD_RATE)
        player:messageSpecial(ID.text.BAYLD_OBTAINED, 300 * invaderXim.settings.main.BAYLD_RATE)
        player:delKeyItem(invaderXim.ki.EXTRAVAGANT_HARPOON)

        -- TODO: Verify fame value added
        player:addFame(invaderXim.fameArea.ADOULIN, 30)
    end
end

return entity
