-----------------------------------
-- Area: Bastok Markets
--  NPC: Degenhard
-- Starts & Ends Quest: The Bare Bones
-- Involved in Quests: Beat Around the Bushin
-- !pos -175 2 -135 235
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.BEYOND_INFINITY) >= invaderXim.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHasExactly(trade, { invaderXim.item.SEASONING_STONE, invaderXim.item.FOSSILIZED_BONE, invaderXim.item.FOSSILIZED_FANG })
    then
        player:startEvent(15)
    end
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.BEYOND_INFINITY) == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(14)
    elseif player:getCharVar('BeatAroundTheBushin') == 3 then
        player:startEvent(342)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 15 then
        npcUtil.giveItem(player, invaderXim.item.OLDE_RARAB_TAIL)
        player:confirmTrade()
    elseif csid == 342 then
        player:setCharVar('BeatAroundTheBushin', 4)
    end
end

return entity
