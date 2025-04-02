-----------------------------------
-- Area: Vunkerl Inlet (S) (I-6)
--  NPC: Leadavox
-- Involved in Quests
-- !pos 206 -32 316
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.BETTER_PART_OF_VALOR) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('BetterPartOfValProg') == 3
    then
        if
            trade:hasItemQty(invaderXim.item.GNOLE_CLAW, 1) and
            trade:getItemCount() == 1 and
            trade:getGil() == 0
        then
            player:startEvent(103)
        end
    end
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.BETTER_PART_OF_VALOR) == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:getCharVar('BetterPartOfValProg') == 2 then
            player:startEvent(101)
        elseif player:getCharVar('BetterPartOfValProg') == 3 then
            player:startEvent(102)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 101 then
        player:setCharVar('BetterPartOfValProg', 3)
    elseif csid == 103 then
        player:tradeComplete()
        player:setCharVar('BetterPartOfValProg', 4)
        npcUtil.giveKeyItem(player, invaderXim.ki.XHIFHUT)
    end
end

return entity
