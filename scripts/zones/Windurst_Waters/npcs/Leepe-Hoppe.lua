-----------------------------------
-- Area: Windurst Waters
--  NPC: Leepe-Hoppe
-- Involved in Mission 1-3, Mission 7-2
-- !pos 13 -9 -197 238
-----------------------------------
---@type TNpcEntity
local entity = {}

local avatarKeyItems =
{
    invaderXim.ki.WHISPER_OF_FLAMES,
    invaderXim.ki.WHISPER_OF_TREMORS,
    invaderXim.ki.WHISPER_OF_TIDES,
    invaderXim.ki.WHISPER_OF_GALES,
    invaderXim.ki.WHISPER_OF_FROST,
    invaderXim.ki.WHISPER_OF_STORMS,
}

local function hasAvatarWhispers(player)
    for _, v in ipairs(avatarKeyItems) do
        if not player:hasKeyItem(v) then
            return false
        end
    end

    return true
end

local function getFenrirRewardMask(player)
    local rewardMask = 0

    if player:findItem(18165) then
        rewardMask = rewardMask + 1
    end -- Fenrir's Stone

    if player:findItem(13572) then
        rewardMask = rewardMask + 2
    end -- Fenrir's Cape

    if player:findItem(13138) then
        rewardMask = rewardMask + 4
    end -- Fenrir's Torque

    if player:findItem(13399) then
        rewardMask = rewardMask + 8
    end -- Fenrir's Earring

    if player:findItem(1208) then
        rewardMask = rewardMask + 16
    end -- Ancient's Key

    if player:hasSpell(invaderXim.magic.spell.FENRIR) then
        rewardMask = rewardMask + 64
    end  -- Pact

    if
        not player:hasKeyItem(invaderXim.ki.TRAINERS_WHISTLE) or
        player:hasKeyItem(invaderXim.ki.FENRIR_WHISTLE)
    then
        rewardMask = rewardMask + 128
    end -- Mount Pact

    return rewardMask
end

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHasExactly(trade, { 1696, 1697, 1698 }) and -- Magicked Steel Ingot, Spruce Lumber, Extra-fine File
        player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TUNING_IN) == invaderXim.questStatus.QUEST_ACCEPTED
    then
        player:startEvent(886)
    end
end

entity.onTrigger = function(player, npc)
    local moonlitPath = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_MOONLIT_PATH)
    local tuningIn = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TUNING_IN)
    local tuningOut = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TUNING_OUT)

    -- Tuning In
    if
        tuningIn == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.WINDURST) >= 4 and
        (player:getCurrentMission(invaderXim.mission.log_id.COP) >= invaderXim.mission.id.cop.DISTANT_BELIEFS or player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_LAST_VERSE))
    then
        player:startEvent(884, 0, 1696, 1697, 1698) -- Magicked Steel Ingot, Spruce Lumber, Extra-fine File

    -- Tuning Out
    elseif
        tuningIn == invaderXim.questStatus.QUEST_COMPLETED and
        tuningOut == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(888) -- Starting dialogue

    elseif
        tuningOut == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('TuningOut_Progress') == 8
    then
        player:startEvent(897) -- Finishing dialogue

    -- The Moonlit Path and Other Fenrir Stuff!
    elseif
        moonlitPath == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.WINDURST) >= 6 and
        player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 6 and
        player:getFameLevel(invaderXim.fameArea.BASTOK) >= 6 and
        player:getFameLevel(invaderXim.fameArea.NORG) >= 4
    then -- Fenrir flag event

        player:startEvent(842, 0, 1125)
    elseif moonlitPath == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:hasKeyItem(invaderXim.ki.MOON_BAUBLE) then -- Default text after acquiring moon bauble and before fighting Fenrir
            player:startEvent(845, 0, 1125, 334)
        elseif player:hasKeyItem(invaderXim.ki.WHISPER_OF_THE_MOON) then -- First turn-in
            local availRewards = 0
            if
                not player:hasKeyItem(invaderXim.ki.TRAINERS_WHISTLE) or
                player:hasKeyItem(invaderXim.ki.FENRIR_WHISTLE)
            then
                availRewards = availRewards + 128
            end -- Mount Pact

            player:startEvent(846, 0, 13399, 1208, 1125, availRewards, 18165, 13572)
        elseif hasAvatarWhispers(player) then
            -- Collected the whispers
            player:startEvent(844, 0, 1125, 334)
        else -- Talked to after flag without the whispers
            player:startEvent(843, 0, 1125)
        end
    elseif moonlitPath == invaderXim.questStatus.QUEST_COMPLETED then
        if player:hasKeyItem(invaderXim.ki.MOON_BAUBLE) then -- Default text after acquiring moon bauble and before fighting Fenrir
            player:startEvent(845, 0, 1125, 334)
        elseif player:hasKeyItem(invaderXim.ki.WHISPER_OF_THE_MOON) then -- Repeat turn-in
            local availRewards = getFenrirRewardMask(player)

            player:startEvent(850, 0, 13399, 1208, 1125, availRewards, 18165, 13572)
        elseif os.time() > player:getCharVar('MoonlitPath_date') then --24 hours have passed, flag a new fight
            player:startEvent(848, 0, 1125, 334)
        end
    elseif tuningIn == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(885, 0, 1696, 1697, 1698) -- Reminder to bring Magicked Steel Ingot, Spruce Lumber, Extra-fine File
    elseif tuningOut == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(889) -- Reminder to go help Ildy in Kazham
    elseif moonlitPath == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(847, 0, 1125) -- Having completed Moonlit Path, this will indefinitely replace his standard dialogue!
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- Moonlit Path and Other Fenrir Stuff
    if csid == 842 and option == 2 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_MOONLIT_PATH)
    elseif csid == 844 then
        npcUtil.giveKeyItem(player, invaderXim.ki.MOON_BAUBLE)
        player:delKeyItem(invaderXim.ki.WHISPER_OF_FLAMES)
        player:delKeyItem(invaderXim.ki.WHISPER_OF_TREMORS)
        player:delKeyItem(invaderXim.ki.WHISPER_OF_TIDES)
        player:delKeyItem(invaderXim.ki.WHISPER_OF_GALES)
        player:delKeyItem(invaderXim.ki.WHISPER_OF_FROST)
        player:delKeyItem(invaderXim.ki.WHISPER_OF_STORMS)
        player:delQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_BY_FIRE)
        player:delQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRIAL_BY_EARTH)
        player:delQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_BY_WATER)
        player:delQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_BY_WIND)
        player:delQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_BY_ICE)
        player:delQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.TRIAL_BY_LIGHTNING)
    elseif csid == 846 or csid == 850 then -- Turn-in event
        local reward = invaderXim.item.NONE
        if option == 1 then
            reward = invaderXim.item.FENRIRS_STONE -- Fenrir's Stone
        elseif option == 2 then
            reward = invaderXim.item.FENRIRS_CAPE -- Fenrir's Cape
        elseif option == 3 then
            reward = invaderXim.item.FENRIRS_TORQUE -- Fenrir's Torque
        elseif option == 4 then
            reward = invaderXim.item.FENRIRS_EARRING -- Fenrir's Earring
        elseif option == 5 then
            reward = invaderXim.item.ANCIENTS_KEY -- Ancient's Key
        elseif option == 6 then
            npcUtil.giveCurrency(player, 'gil', 15000)
        elseif option == 7 then
            player:addSpell(invaderXim.magic.spell.FENRIR) -- Pact
        elseif option == 8 then
            npcUtil.giveKeyItem(player, invaderXim.ki.FENRIR_WHISTLE)
            -- Pact as Mount
        end

        -- TODO: Reward is never nil since it is initialized; however, we should't run this block
        -- if the player chooses an item, and they don't have space in their inventory.
        player:addTitle(invaderXim.title.HEIR_OF_THE_NEW_MOON)
        player:delKeyItem(invaderXim.ki.WHISPER_OF_THE_MOON)
        player:setCharVar('MoonlitPath_date', getMidnight())
        player:addFame(invaderXim.fameArea.WINDURST, 30)

        if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_MOONLIT_PATH) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_MOONLIT_PATH)
        end

        if reward ~= 0 then
            npcUtil.giveItem(player, reward)
        end

        if
            player:getNation() == invaderXim.nation.WINDURST and
            player:getRank(player:getNation()) == 10 and
            player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_PROMISE) == invaderXim.questStatus.QUEST_COMPLETED
        then
            npcUtil.giveKeyItem(player, invaderXim.ki.DARK_MANA_ORB)
        end
    elseif csid == 848 then
        npcUtil.giveKeyItem(player, invaderXim.ki.MOON_BAUBLE)

    -- Tuning In
    elseif csid == 884 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TUNING_IN)

    elseif
        csid == 886 and
        npcUtil.completeQuest(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TUNING_IN, {
            gil = 4000,
            title = invaderXim.title.FINE_TUNER,
        })
    then
        player:tradeComplete()

    -- Tuning Out
    elseif csid == 888 then
        player:setCharVar('TuningOut_Progress', 1)
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TUNING_OUT)

    elseif
        csid == 897 and
        npcUtil.completeQuest(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TUNING_OUT, {
            item = invaderXim.item.CACHE_NEZ, -- Cache-Nez
            title = invaderXim.title.FRIEND_OF_THE_HELMED,
        })
    then
        player:setCharVar('TuningOut_Progress', 0) -- zero when quest is done
    end
end

return entity
