-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Excenmille
-- Type: Trust NPC, Ballista Pursuivant
-- !pos -229.344 6.999 22.976 231
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

local trustMemory = function(player)
    local memories = 0
    if player:hasKeyItem(invaderXim.ki.BALLISTA_LICENSE) then
        memories = memories + 2
    end

    -- 4 - Chocobo racing
    --  memories = memories + 4
    if player:hasCompletedQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.CLAWS_OF_THE_GRIFFON) then
        memories = memories + 8
    end

    if player:hasCompletedQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.BLOOD_OF_HEROES) then
        memories = memories + 16
    end

    return memories
end

entity.onTrigger = function(player, npc)
    local trustSandoria = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRUST_SANDORIA)
    local trustBastok = player:getQuestStatus(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUST_BASTOK)
    local trustWindurst = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TRUST_WINDURST)
    local sandoriaFirstTrust = player:getCharVar('SandoriaFirstTrust')
    local excenmilleTrustChatFlag = player:getLocalVar('ExcenmilleTrustChatFlag')
    local rank3 = player:getRank(player:getNation()) >= 3 and 1 or 0

    if
        trustSandoria == invaderXim.questStatus.QUEST_ACCEPTED and
        (trustWindurst == invaderXim.questStatus.QUEST_COMPLETED or trustBastok == invaderXim.questStatus.QUEST_COMPLETED)
    then
        player:startEvent(897, 0, 0, 0, trustMemory(player), 0, 0, 0, rank3)
    elseif
        trustSandoria == invaderXim.questStatus.QUEST_ACCEPTED and
        sandoriaFirstTrust == 0
    then
        player:startEvent(893, 0, 0, 0, trustMemory(player), 0, 0, 0, rank3)
    elseif
        trustSandoria == invaderXim.questStatus.QUEST_ACCEPTED and
        sandoriaFirstTrust == 1 and
        excenmilleTrustChatFlag == 0
    then
        player:startEvent(894)
        player:setLocalVar('ExcenmilleTrustChatFlag', 1)
    elseif
        trustSandoria == invaderXim.questStatus.QUEST_ACCEPTED and
        sandoriaFirstTrust == 2
    then
        player:startEvent(895)
    elseif
        trustSandoria == invaderXim.questStatus.QUEST_COMPLETED and
        not player:hasSpell(invaderXim.magic.spell.CURILLA) and
        excenmilleTrustChatFlag == 0
    then
        player:startEvent(896, 0, 0, 0, 0, 0, 0, 0, rank3)
        player:setLocalVar('ExcenmilleTrustChatFlag', 1)
    else
        player:startEvent(29)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- TRUST
    if csid == 893 then
        player:addSpell(invaderXim.magic.spell.EXCENMILLE, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.EXCENMILLE)
        player:setCharVar('SandoriaFirstTrust', 1)
    elseif csid == 895 then
        player:delKeyItem(invaderXim.ki.RED_INSTITUTE_CARD)
        player:messageSpecial(ID.text.KEYITEM_LOST, invaderXim.ki.RED_INSTITUTE_CARD)
        npcUtil.completeQuest(player, invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRUST_SANDORIA, {
            keyItem = invaderXim.ki.SAN_DORIA_TRUST_PERMIT,
            title = invaderXim.title.THE_TRUSTWORTHY,
            var = 'SandoriaFirstTrust'
        })
        player:messageSpecial(ID.text.CALL_MULTIPLE_ALTER_EGO)
    elseif csid == 897 then
        player:addSpell(invaderXim.magic.spell.EXCENMILLE, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.EXCENMILLE)
        player:delKeyItem(invaderXim.ki.RED_INSTITUTE_CARD)
        player:messageSpecial(ID.text.KEYITEM_LOST, invaderXim.ki.RED_INSTITUTE_CARD)
        npcUtil.completeQuest(player, invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRUST_SANDORIA, {
            keyItem = invaderXim.ki.SAN_DORIA_TRUST_PERMIT
        })
    end
end

return entity
