-----------------------------------
-- Area: Upper Jeuno
--  NPC: Ajithaam
-- !pos -82 0.1 160 244
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:getGil() == 300 and
        trade:getItemCount() == 1 and
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.LURE_OF_THE_WILDCAT) == invaderXim.questStatus.QUEST_COMPLETED and
        player:getCurrentMission(invaderXim.mission.log_id.TOAU) > invaderXim.mission.id.toau.IMMORTAL_SENTRIES
    then
        -- Needs a check for at least traded an invitation card to Naja Salaheem
        player:startEvent(10177)
    end
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(invaderXim.mission.log_id.TOAU) >= invaderXim.mission.id.toau.PRESIDENT_SALAHEEM then
        player:startEvent(10176)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 10177 then
        player:tradeComplete()
        invaderXim.teleport.to(player, invaderXim.teleport.id.WHITEGATE)
    end
end

return entity
