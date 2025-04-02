-----------------------------------
-- Area: Windurst Woods
--  NPC: Apururu
-- Involved in Quests: The Kind Cardian, Can Cardians Cry?
-- !pos -11 -2 13 241
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

local trustMemory = function(player)
    local memories = 0
    -- 2 - Saw him at the start of the game
    if player:getNation() == invaderXim.nation.WINDURST then
        memories = memories + 2
    end

    -- 4 - WONDER_WANDS
    if player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WONDER_WANDS) then
        memories = memories + 4
    end

    -- 8 - THE_TIGRESS_STIRS
    if player:hasCompletedQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STIRS) then
        memories = memories + 8
    end

    -- 16 - I_CAN_HEAR_A_RAINBOW
    if player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.I_CAN_HEAR_A_RAINBOW) then
        memories = memories + 16
    end

    -- 32 - Hero's Combat (BCNM)
    -- if (playervar for Hero's Combat) then
    --  memories = memories + 32
    -- end
    -- 64 - MOON_READING
    if player:hasCompletedMission(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.MOON_READING) then
        memories = memories + 64
    end

    return memories
end

entity.onTrade = function(player, npc, trade)
    -- THE KIND CARDIAN
    if
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_KIND_CARDIAN) == invaderXim.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, invaderXim.item.TEN_OF_CUPS_CARD)
    then
        player:startEvent(397)

        -- CAN CARDIANS CRY?
    elseif
        player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CAN_CARDIANS_CRY) == invaderXim.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, invaderXim.item.BRUISED_STARFRUIT)
    then
        player:startEvent(325, 0, 20000, 5000)
    end
end

entity.onTrigger = function(player, npc)
    local kindCardian = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_KIND_CARDIAN)
    local kindCardianCS = player:getCharVar('theKindCardianVar')
    local allNewC3000 = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_ALL_NEW_C_3000)
    local canCardiansCry = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CAN_CARDIANS_CRY)

        -- THE KIND CARDIAN
    if kindCardian == invaderXim.questStatus.QUEST_ACCEPTED then
        if kindCardianCS == 0 then
            player:startEvent(392)
        elseif kindCardianCS == 1 then
            player:startEvent(393)
        elseif kindCardianCS == 2 then
            player:startEvent(398)
        end

        -- CAN CARDIANS CRY?
    elseif
        allNewC3000 == invaderXim.questStatus.QUEST_COMPLETED and
        canCardiansCry == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.WINDURST) >= 5
    then
        player:startEvent(319, 0, 20000) -- start quest
    elseif canCardiansCry == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(320, 0, 20000) -- reminder
    elseif canCardiansCry == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(330) -- new standard dialog

        -- TRUST
    elseif
        player:hasKeyItem(invaderXim.ki.WINDURST_TRUST_PERMIT) and
        not player:hasSpell(invaderXim.magic.spell.AJIDO_MARUJIDO)
    then
        local rank6 = player:getRank(player:getNation()) >= 6 and 1 or 0

        player:startEvent(866, 0, 0, 0, trustMemory(player), 0, 0, 0, rank6)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
        -- THE KIND CARDIAN
    if csid == 392 and option == 1 then
        player:setCharVar('theKindCardianVar', 1)
    elseif csid == 397 then
        player:delKeyItem(invaderXim.ki.TWO_OF_SWORDS)
        player:setCharVar('theKindCardianVar', 2)
        player:addFame(invaderXim.fameArea.WINDURST, 30)
        player:confirmTrade()

        -- CAN CARDIANS CRY?
    elseif csid == 319 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CAN_CARDIANS_CRY)
    elseif
        csid == 325 and
        npcUtil.completeQuest(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CAN_CARDIANS_CRY, { gil = 5000 })
    then
        player:confirmTrade()

        -- TRUST
    elseif csid == 866 and option == 2 then
        player:addSpell(invaderXim.magic.spell.AJIDO_MARUJIDO, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.AJIDO_MARUJIDO)
    end
end

return entity
