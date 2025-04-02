-----------------------------------
-- Area: FeiYin
--  NPC: Dry Fountain
-- Involved In Quest: Peace for the Spirit
-- !pos -17 -16 71 204
-----------------------------------
local ID = zones[invaderXim.zone.FEIYIN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.PEACE_FOR_THE_SPIRIT) == invaderXim.questStatus.QUEST_ACCEPTED then
        if
            trade:hasItemQty(invaderXim.item.ANTIQUE_COIN, 1) and
            trade:getItemCount() == 1
        then
            player:startEvent(17)
        end
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 17 then
        player:tradeComplete()
        player:setCharVar('peaceForTheSpiritCS', 2)
    end
end

return entity
