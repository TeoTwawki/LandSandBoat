-----------------------------------
-- Area: Selbina
--  NPC: Melyon
-- Starts and Finishes Quest: Only the Best (R)
-- Involved in Quest: Riding on the Clouds
-- !pos 25 -6 6 248
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ONLY_THE_BEST) ~= invaderXim.questStatus.QUEST_AVAILABLE then
        if npcUtil.tradeHas(trade, { { 4366, 5 } }) then -- La Theine Cabbage x5
            player:startEvent(62, 0, 4366)
        elseif npcUtil.tradeHas(trade, { { 629, 3 } }) then -- Millioncorn x3
            player:startEvent(63, 0, 629)
        elseif npcUtil.tradeHas(trade, invaderXim.item.CLUMP_OF_BOYAHDA_MOSS) then -- Boyahda Moss x1
            player:startEvent(64, 0, invaderXim.item.CLUMP_OF_BOYAHDA_MOSS)
        end
    end
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ONLY_THE_BEST) == invaderXim.questStatus.QUEST_AVAILABLE then
        player:startEvent(60, 4366, 629, invaderXim.item.CLUMP_OF_BOYAHDA_MOSS) -- Start quest "Only the Best"
    else
        player:startEvent(61, 4366, 629, invaderXim.item.CLUMP_OF_BOYAHDA_MOSS) -- During & after completed quest "Only the Best"
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 60 and option == 10 then
        player:addQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ONLY_THE_BEST)
    elseif csid == 62 and option == 11 then
        npcUtil.giveCurrency(player, 'gil', 100)
        player:addFame(invaderXim.fameArea.BASTOK, 10)
        player:addFame(invaderXim.fameArea.SANDORIA, 10)
        player:addFame(invaderXim.fameArea.JEUNO, 10)
        player:completeQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ONLY_THE_BEST)
        player:confirmTrade()
    elseif csid == 63 and option == 12 then
        npcUtil.giveCurrency(player, 'gil', 120)
        player:addFame(invaderXim.fameArea.BASTOK, 20)
        player:addFame(invaderXim.fameArea.SANDORIA, 20)
        player:addFame(invaderXim.fameArea.JEUNO, 20)
        player:completeQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ONLY_THE_BEST)
        player:confirmTrade()
    elseif csid == 64 and option == 13 then
        npcUtil.giveCurrency(player, 'gil', 600)
        player:addFame(invaderXim.fameArea.BASTOK, 30)
        player:addFame(invaderXim.fameArea.SANDORIA, 30)
        player:addFame(invaderXim.fameArea.JEUNO, 30)
        player:completeQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ONLY_THE_BEST)
        player:confirmTrade()
    end
end

return entity
