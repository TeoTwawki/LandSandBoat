-----------------------------------
-- Area: Windurst Walls
--  NPC: Nanaa Mihgo
-- Starts and Finishes Quest: Mihgo's Amigo (R), The Tenshodo Showdown (start), Rock Racketeer (start)
-- Involved In Quest: Crying Over Onions
-- Involved in Mission 2-1
-- !pos 62 -4 240 241
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

local trustMemory = function(player)
    local memories = 0
    -- 2 - Saw her at the start of the game
    if player:getNation() == invaderXim.nation.WINDURST then
        memories = memories + 2
    end

    -- 4 - ROCK_RACKETEER
    if player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.ROCK_RACKETEER) then
        memories = memories + 4
    end

    -- 8 - HITTING_THE_MARQUISATE
    if player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.HITTING_THE_MARQUISATE) then
        memories = memories + 8
    end

    -- 16 - CRYING_OVER_ONIONS
    if player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CRYING_OVER_ONIONS) then
        memories = memories + 16
    end

    -- 32 - hasItem(286) Nanaa Mihgo statue
    if player:hasItem(invaderXim.item.NANAA_MIHGO_STATUE) then
        memories = memories + 32
    end

    -- 64 - ROAR_A_CAT_BURGLAR_BARES_HER_FANGS
    if player:hasCompletedMission(invaderXim.mission.log_id.AMK, invaderXim.mission.id.amk.ROAR_A_CAT_BURGLAR_BARES_HER_FANGS) then
        memories = memories + 64
    end

    return memories
end

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, { { 498, 4 } }) then -- Yagudo Necklace x4
        local mihgosAmigo = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MIHGOS_AMIGO)

        if mihgosAmigo == invaderXim.questStatus.QUEST_ACCEPTED then
            player:startEvent(88, invaderXim.settings.main.GIL_RATE * 200)
        elseif mihgosAmigo == invaderXim.questStatus.QUEST_COMPLETED then
            player:startEvent(494, invaderXim.settings.main.GIL_RATE * 200)
        end
    end
end

entity.onTrigger = function(player, npc)
    local wildcatWindurst = player:getCharVar('WildcatWindurst')
    local mihgosAmigo = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MIHGOS_AMIGO)
    local rockRacketeer = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.ROCK_RACKETEER)
    local rockRacketeerCS = player:getCharVar('rockracketeer_sold')

    -- LURE OF THE WILDCAT (WINDURST 2-1)
    -- Simply checks this NPC as talked to for the PC, should be highest priority
    if
        player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.LURE_OF_THE_WILDCAT) == invaderXim.questStatus.QUEST_ACCEPTED and
        not utils.mask.getBit(wildcatWindurst, 4)
    then
        player:startEvent(732)

    -- TRUST
    elseif
        player:hasKeyItem(invaderXim.ki.WINDURST_TRUST_PERMIT) and
        not player:hasSpell(invaderXim.magic.spell.NANAA_MIHGO) and
        player:getLocalVar('TrustDialogue') == 0
    then
        local trustFlag = (player:getRank(player:getNation()) >= 3 and 1 or 0) + (mihgosAmigo == invaderXim.questStatus.QUEST_COMPLETED and 2 or 0)

        player:setLocalVar('TrustDialogue', 1)

        player:startEvent(865, 0, 0, 0, trustMemory(player), 0, 0, 0, trustFlag)

    -- ROCK RACKETEER (Mihgo's Amigo follow-up)
    elseif
        mihgosAmigo == invaderXim.questStatus.QUEST_COMPLETED and
        rockRacketeer == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.WINDURST) >= 3
    then
        if player:needToZone() then
            player:startEvent(89) -- complete
        else
            player:startEvent(93) -- quest start
        end
    elseif rockRacketeer == invaderXim.questStatus.QUEST_ACCEPTED and rockRacketeerCS == 1 then
        player:startEvent(98) -- advance quest talk to Varun
    elseif rockRacketeer == invaderXim.questStatus.QUEST_ACCEPTED and rockRacketeerCS == 2 then
        player:startEvent(95) -- not sold reminder
    elseif rockRacketeer == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(94) -- quest reminder

    -- MIHGO'S AMIGO
    elseif mihgosAmigo == invaderXim.questStatus.QUEST_AVAILABLE then
        if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CRYING_OVER_ONIONS) == invaderXim.questStatus.QUEST_AVAILABLE then
            player:startEvent(81) -- Start Quest "Mihgo's Amigo" with quest "Crying Over Onions" Activated
        else
            player:startEvent(80) -- Start Quest "Mihgo's Amigo"
        end
    elseif mihgosAmigo == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(82)

    -- STANDARD DIALOG
    elseif rockRacketeer == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(99) -- new dialog after Rock Racketeer
    elseif mihgosAmigo == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(89) -- new dialog after Mihgo's Amigos
    else
        player:startEvent(76) -- standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- LURE OF THE WILDCAT (WINDURST)
    if csid == 732 then
        player:setCharVar('WildcatWindurst', utils.mask.setBit(player:getCharVar('WildcatWindurst'), 4, true))

    -- ROCK RACKETEER
    elseif csid == 93 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.ROCK_RACKETEER)
        npcUtil.giveKeyItem(player, invaderXim.ki.SHARP_GRAY_STONE)
    elseif csid == 98 then
        player:delGil(10 * invaderXim.settings.main.GIL_RATE)
        player:setCharVar('rockracketeer_sold', 3)

    -- MIHGO'S AMIGO
    elseif csid == 80 or csid == 81 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MIHGOS_AMIGO)
    elseif csid == 88 then
        player:confirmTrade()
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MIHGOS_AMIGO)
        player:addTitle(invaderXim.title.CAT_BURGLAR_GROUPIE)
        player:addGil(invaderXim.settings.main.GIL_RATE * 200)
        player:addFame(invaderXim.fameArea.NORG, 60)
        player:needToZone(true)
    elseif csid == 494 then
        player:confirmTrade()
        player:addTitle(invaderXim.title.CAT_BURGLAR_GROUPIE)
        player:addGil(invaderXim.settings.main.GIL_RATE * 200)
        player:addFame(invaderXim.fameArea.NORG, 30)
    elseif csid == 865 and option == 2 then
        player:addSpell(invaderXim.magic.spell.NANAA_MIHGO, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.NANAA_MIHGO)
    end
end

return entity
