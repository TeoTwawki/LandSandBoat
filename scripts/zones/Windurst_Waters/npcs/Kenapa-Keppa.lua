-----------------------------------
-- Area: Windurst Waters
--  NPC: Kenapa-Keppa
-- Involved in Quest: Food For Thought, Hat in Hand
-- !pos 27 -6 -199 238
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local sayItWithFlowers = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.SAY_IT_WITH_FLOWERS)
    local flowerProgress = player:getCharVar('FLOWER_PROGRESS') -- progress of Say It with Flowers

    if
        player:hasKeyItem(invaderXim.ki.NEW_MODEL_HAT) and
        not utils.mask.getBit(player:getCharVar('QuestHatInHand_var'), 2)
    then
        player:messageSpecial(ID.text.YOU_SHOW_OFF_THE, 0, invaderXim.ki.NEW_MODEL_HAT)
        player:startEvent(56)
    elseif
        (sayItWithFlowers == invaderXim.questStatus.QUEST_ACCEPTED or sayItWithFlowers == invaderXim.questStatus.QUEST_COMPLETED) and
        flowerProgress == 2
    then
        player:startEvent(519)
    else
        if math.random(1, 100) <= 50 then
            player:startEvent(302) -- Standard converstation
        else
            player:startEvent(303) -- Standard converstation
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 56 then
        player:setCharVar('QuestHatInHand_var', utils.mask.setBit(player:getCharVar('QuestHatInHand_var'), 2, true))
        player:incrementCharVar('QuestHatInHand_count', 1)
    elseif csid == 519 then
        player:setCharVar('FLOWER_PROGRESS', 3)
    end
end

return entity
