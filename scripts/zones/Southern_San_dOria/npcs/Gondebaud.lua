-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Gondebaud
-- Trust NPC
-- !pos 123.754 0.000 92.125 230
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.trust.onTradeCipher(player, trade, 3503, 3552, 3553)
end

entity.onTrigger = function(player, npc)
    local trustSandoria = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRUST_SANDORIA)
    local trustBastok   = player:getQuestStatus(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUST_BASTOK)
    local trustWindurst = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TRUST_WINDURST)

    if
        player:getMainLvl() >= 5 and
        invaderXim.settings.main.ENABLE_TRUST_QUESTS == 1 and
        trustSandoria == invaderXim.questStatus.QUEST_AVAILABLE
    then
        if
            trustWindurst == invaderXim.questStatus.QUEST_AVAILABLE and
            trustBastok == invaderXim.questStatus.QUEST_AVAILABLE
        then
            player:startEvent(3500)
        elseif
            trustWindurst == invaderXim.questStatus.QUEST_COMPLETED or
            trustBastok == invaderXim.questStatus.QUEST_COMPLETED
        then
            player:startEvent(3504)
        end
    elseif player:hasKeyItem(invaderXim.ki.RED_INSTITUTE_CARD) then
        player:startEvent(3501)
    elseif trustSandoria == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(3502)
    else
        player:startEvent(3505)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if (csid == 3500 or csid == 3504) and option == 2 then
        player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRUST_SANDORIA)
        npcUtil.giveKeyItem(player, invaderXim.ki.RED_INSTITUTE_CARD)
    elseif csid == 3503 or csid == 3553 then
        local spellID = player:getLocalVar('TradingTrustCipher')
        player:setLocalVar('TradingTrustCipher', 0)
        player:addSpell(spellID, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, spellID)
        player:tradeComplete()
    end
end

return entity
