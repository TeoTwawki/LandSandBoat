-----------------------------------
-- Area: Windurst Woods
--  NPC: Wetata
-- Trust NPC
-- !pos -23.825 2.533 -44.567 241
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.trust.onTradeCipher(player, trade, 862, 901, 902)
end

entity.onTrigger = function(player, npc)
    local trustSandoria = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRUST_SANDORIA)
    local trustBastok   = player:getQuestStatus(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUST_BASTOK)
    local trustWindurst = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TRUST_WINDURST)

    if
        player:getMainLvl() >= 5 and
        invaderXim.settings.main.ENABLE_TRUST_QUESTS == 1 and
        trustWindurst == invaderXim.questStatus.QUEST_AVAILABLE
    then
        if
            trustBastok == invaderXim.questStatus.QUEST_AVAILABLE and
            trustSandoria == invaderXim.questStatus.QUEST_AVAILABLE
        then
            player:startEvent(863)
        elseif
            trustBastok == invaderXim.questStatus.QUEST_COMPLETED or
            trustSandoria == invaderXim.questStatus.QUEST_COMPLETED
        then
            player:startEvent(867)
        end
    elseif player:hasKeyItem(invaderXim.ki.GREEN_INSTITUTE_CARD) then
        player:startEvent(864)
    elseif trustWindurst == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(861)
    else
        player:startEvent(868)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if (csid == 863 or csid == 867) and option == 2 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TRUST_WINDURST)
        npcUtil.giveKeyItem(player, invaderXim.ki.GREEN_INSTITUTE_CARD)
    elseif csid == 862 or csid == 902 then
        local spellID = player:getLocalVar('TradingTrustCipher')
        player:setLocalVar('TradingTrustCipher', 0)
        player:addSpell(spellID, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, spellID)
        player:tradeComplete()
    end
end

return entity
