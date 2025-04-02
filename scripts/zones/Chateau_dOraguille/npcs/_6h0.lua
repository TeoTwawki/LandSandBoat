-----------------------------------
-- Area: Chateau d'Oraguille
-- Door: Prince Royal's
-- Finishes Quest: A Boy's Dream, Under Oath
-- Involved in Missions: 3-1, 5-2, 8-2
-- !pos -38 -3 73 233
-----------------------------------
local ID = zones[invaderXim.zone.CHATEAU_DORAGUILLE]
-----------------------------------
---@type TNpcEntity
local entity = {}

local function TrustMemory(player)
    local memories = 0
    -- 2 - LIGHTBRINGER
    if player:hasCompletedMission(invaderXim.mission.log_id.SANDORIA, invaderXim.mission.id.sandoria.LIGHTBRINGER) then
        memories = memories + 2
    end

    -- 4 - IMMORTAL_SENTRIES
    if player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.IMMORTAL_SENTRIES) then
        memories = memories + 4
    end

    -- 8 - UNDER_OATH
    if player:hasCompletedQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.UNDER_OATH) then
        memories = memories + 8
    end

    -- 16 - FIT_FOR_A_PRINCE
    if player:hasCompletedQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.FIT_FOR_A_PRINCE) then
        memories = memories + 16
    end

    -- 32 - Hero's Combat BCNM
    -- if (playervar for Hero's Combat) then
    --  memories = memories + 32
    -- end
    return memories
end

entity.onTrigger = function(player, npc)
    local mLvl = player:getMainLvl()
    local aBoysDream = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_BOYS_DREAM)
    local underOath = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.UNDER_OATH)

    -- "Under Oath" (PLD AF Body)
    if player:getCharVar('UnderOathCS') == 8 then
        player:startEvent(89)
    elseif
        player:getMainJob() == invaderXim.job.PLD and mLvl >= invaderXim.settings.main.AF2_QUEST_LEVEL and
        aBoysDream == invaderXim.questStatus.QUEST_COMPLETED and underOath == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(90) -- Start

    -- Trust: San d'Oria (Trion)
    elseif
        player:getRank(player:getNation()) >= 6 and
        player:hasKeyItem(invaderXim.ki.SAN_DORIA_TRUST_PERMIT) and
        not player:hasSpell(invaderXim.magic.spell.TRION)
    then
        player:startEvent(574, 0, 0, 0, TrustMemory(player))

    -- "A Boy's Dream" (PLD AF Feet)
    elseif player:getCharVar('aBoysDreamCS') == 8 then
        player:startEvent(88)

    -- San d'Oria Rank 10 (different default)
    elseif
        player:getNation() == invaderXim.nation.SANDORIA and
        player:getRank(player:getNation()) == 10
    then
        player:startEvent(62)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 88 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.GALLANT_LEGGINGS)
        else
            if player:getMainJob() == invaderXim.job.PLD then
                player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.UNDER_OATH)
            end

            player:delKeyItem(invaderXim.ki.KNIGHTS_BOOTS)
            player:addItem(invaderXim.item.GALLANT_LEGGINGS)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.GALLANT_LEGGINGS) -- Gallant Leggings
            player:setCharVar('aBoysDreamCS', 0)
            player:addFame(invaderXim.fameArea.SANDORIA, 40)
            player:completeQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_BOYS_DREAM)
        end
    elseif csid == 90 and option == 1 then
        player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.UNDER_OATH)
        player:setCharVar('UnderOathCS', 0)
    elseif csid == 89 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.GALLANT_SURCOAT)
        else
            player:addItem(invaderXim.item.GALLANT_SURCOAT)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.GALLANT_SURCOAT) -- Gallant Surcoat
            player:setCharVar('UnderOathCS', 9)
            player:addFame(invaderXim.fameArea.SANDORIA, 60)
            player:setTitle(invaderXim.title.PARAGON_OF_PALADIN_EXCELLENCE)
            player:completeQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.UNDER_OATH)
        end
    elseif csid == 574 and option == 2 then
        player:addSpell(invaderXim.magic.spell.TRION, false, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, 905)
    end
end

return entity
