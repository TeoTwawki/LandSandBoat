-----------------------------------
-- Area: Port Bastok
--  NPC: Alib-Mufalib
-- Type: Warp NPC
-- !pos 116.080 7.372 -31.820 236
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:getGil() == 300 and
        trade:getItemCount() == 1 and
        player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.LURE_OF_THE_WILDCAT) and
        player:getCurrentMission(invaderXim.mission.log_id.TOAU) > invaderXim.mission.id.toau.IMMORTAL_SENTRIES
    then
        -- Needs a check for at least traded an invitation card to Naja Salaheem
        player:startEvent(379)
    end
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(invaderXim.mission.log_id.TOAU) >= invaderXim.mission.id.toau.PRESIDENT_SALAHEEM then
        player:startEvent(378)
    else
        player:startEvent(361)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 379 then
        player:tradeComplete()
        invaderXim.teleport.to(player, invaderXim.teleport.id.WHITEGATE)
    end
end

return entity
