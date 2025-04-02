-----------------------------------
-- Trust: Bastok
-----------------------------------
-- !addquest 1 92
-- Clarion Star : !pos 81.478 7.500 -24.169 236
-- Naji         : !pos 64 -14 -4 237
-----------------------------------
local metalworksID = zones[invaderXim.zone.METALWORKS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUST_BASTOK)

quest.reward =
{
    keyItem = invaderXim.ki.BASTOK_TRUST_PERMIT,
}

local function trustMemoryAyame(player)
    local memories = 0

    -- 2 - The Three Kingdoms
    if
        player:hasCompletedMission(invaderXim.mission.log_id.SANDORIA, invaderXim.mission.id.sandoria.JOURNEY_TO_BASTOK2) or
        player:hasCompletedMission(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK2)
    then
        memories = memories + 2
    end

    -- 4 - Where Two Paths Converge
    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.WHERE_TWO_PATHS_CONVERGE) then
        memories = memories + 4
    end

    -- 8 - The Pirate's Cove
    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.THE_PIRATES_COVE) then
        memories = memories + 8
    end

    -- 16 - Ayame and Kaede
    if player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.AYAME_AND_KAEDE) then
        memories = memories + 16
    end

    -- 32 - Light of Judgement
    if player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.LIGHT_OF_JUDGMENT) then
        memories = memories + 32
    end

    -- 64 - True Strength
    if player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUE_STRENGTH) then
        memories = memories + 64
    end

    return memories
end

local function trustMemoryIronEater(player)
    local memories = 0
    --[[ TODO
    -- 2 - The Three Kingdoms
    if player:hasCompletedMission(invaderXim.mission.log_id.SANDORIA, invaderXim.mission.id.sandoria.JOURNEY_TO_BASTOK2) or player:hasCompletedMission(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK2) then
        memories = memories + 2
    end
    -- 4 - Where Two Paths Converge
    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.WHERE_TWO_PATHS_CONVERGE) then
        memories = memories + 4
    end
    -- 8 - The Pirate's Cove
    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.THE_PIRATES_COVE) then
        memories = memories + 8
    end
    -- 16 - Ayame and Kaede
    if player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.AYAME_AND_KAEDE) then
        memories = memories + 16
    end
    -- 32 - Light of Judgement
    if player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.LIGHT_OF_JUDGMENT) then
        memories = memories + 32
    end
    -- 64 - True Strength
    if player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUE_STRENGTH) then
        memories = memories + 64
    end
    ]]--

    -- Incident with Volker and Zeid
    -- Bring together Mythril Musketeers
    -- Mastery over the way of the axe
    -- Galka grieving over the loss of their homeland
    -- Piece of wood Werei left behind
    -- Help nenew ties with Raogrimm and Deidogg
    -- Chose to become an adventurer in the past
    -- Aht Urhgan, Zazarg
    -- Republican Iron Medal

    return memories
end

local function trustMemoryNaji(player)
    local memories = 0

    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.THE_EMISSARY) then
        memories = memories + 2
    end

    if player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_DOORMAN) then
        memories = memories + 4
    end

    if player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.LIGHT_OF_JUDGMENT) then
        memories = memories + 8
    end

    -- 16 - Chocobo racing
    --  memories = memories + 16

    return memories
end

local function trustMemoryVolker(player)
    local memories = 0

    -- 2 - Darkness Rising (Bastok Mission)
    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.DARKNESS_RISING) then
        memories = memories + 2
    end

    -- 4 - Where Two Paths Converge (Bastok Mission)
    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.WHERE_TWO_PATHS_CONVERGE) then
        memories = memories + 4
    end

    -- 8 - Light of Judgment (Aht Urhgan Mission)
    if player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.LIGHT_OF_JUDGMENT) then
        memories = memories + 8
    end

    -- 16 - Hero's Combat (BCNM)
    -- if (playervar for Hero's Combat) then
    --  memories = memories + 16
    -- end

    return memories
end

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= 5 and
                invaderXim.settings.main.ENABLE_TRUST_QUESTS == 1
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Clarion_Star'] =
            {
                onTrigger = function(player, npc)
                    local trustSandoria = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRUST_SANDORIA)
                    local trustWindurst = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TRUST_WINDURST)

                    -- Haven't started any other trust tutorial quest.
                    if
                        trustWindurst == invaderXim.questStatus.QUEST_AVAILABLE and
                        trustSandoria == invaderXim.questStatus.QUEST_AVAILABLE
                    then
                        return quest:progressEvent(434)

                    -- Has finished other trust quest.
                    elseif
                        trustWindurst == invaderXim.questStatus.QUEST_COMPLETED or
                        trustSandoria == invaderXim.questStatus.QUEST_COMPLETED
                    then
                        return quest:progressEvent(438)
                    end
                end,
            },

            onEventFinish =
            {
                [434] = function(player, csid, option, npc)
                    if option == 2 then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, invaderXim.ki.BLUE_INSTITUTE_CARD)
                    end
                end,

                [438] = function(player, csid, option, npc)
                    if option == 2 then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, invaderXim.ki.BLUE_INSTITUTE_CARD)
                    end
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Naji'] =
            {
                onTrigger = function(player, npc)
                    local rank3 = player:getRank(player:getNation()) >= 3 and 1 or 0
                    local bastokFirstTrust = quest:getVar(player, 'Prog')

                    if
                        player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRUST_SANDORIA) == invaderXim.questStatus.QUEST_COMPLETED or
                        player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TRUST_WINDURST) == invaderXim.questStatus.QUEST_COMPLETED
                    then
                        return quest:progressEvent(984, 0, 0, 0, trustMemoryNaji(player), 0, 0, 0, rank3)
                    elseif bastokFirstTrust == 0 then
                        return quest:progressEvent(980, 0, 0, 0, trustMemoryNaji(player), 0, 0, 0, rank3)
                    elseif bastokFirstTrust == 1 then
                        return quest:progressEvent(981):oncePerZone()
                    elseif bastokFirstTrust == 2 then
                        return quest:progressEvent(982)
                    end
                end,
            },

            onEventFinish =
            {
                [980] = function(player, csid, option, npc)
                    player:addSpell(invaderXim.magic.spell.NAJI, true, true)
                    player:messageSpecial(metalworksID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.NAJI)
                    quest:setVar(player, 'Prog', 1)
                end,

                [982] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:addTitle(invaderXim.title.THE_TRUSTWORTHY)
                        player:delKeyItem(invaderXim.ki.BLUE_INSTITUTE_CARD)
                        player:messageSpecial(metalworksID.text.KEYITEM_LOST, invaderXim.ki.BLUE_INSTITUTE_CARD)
                        player:messageSpecial(metalworksID.text.CALL_MULTIPLE_ALTER_EGO)
                    end
                end,

                [984] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:addSpell(invaderXim.magic.spell.NAJI, true, true)
                        player:messageSpecial(metalworksID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.NAJI)
                        player:delKeyItem(invaderXim.ki.BLUE_INSTITUTE_CARD)
                        player:messageSpecial(metalworksID.text.KEYITEM_LOST, invaderXim.ki.BLUE_INSTITUTE_CARD)
                    end
                end,
            },
        },

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Clarion_Star'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.BLUE_INSTITUTE_CARD) then
                        return quest:progressEvent(435)
                    end
                end,
            },
        },
    },

    -- Section: Quest completed
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Ayame'] =
            {
                onTrigger = function(player, npc)
                    local rank3 = player:getRank(player:getNation()) >= 3 and 1 or 0

                    if not player:hasSpell(invaderXim.magic.spell.AYAME) then
                        return quest:event(985, 0, 0, 0, trustMemoryAyame(player), 0, 0, 0, rank3)
                    end
                end,
            },

            ['Iron_Eater'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasSpell(invaderXim.magic.spell.NAJI) and
                        player:hasSpell(invaderXim.magic.spell.AYAME) and
                        player:hasSpell(invaderXim.magic.spell.VOLKER) and
                        not player:hasSpell(invaderXim.magic.spell.IRON_EATER)
                    then
                        return quest:progressEvent(988, 0, 0, 0, trustMemoryIronEater(player)):oncePerZone()
                    end
                end,
            },

            ['Lucius'] =
            {
                onTrigger = function(player, npc)
                    local rank6 = player:getRank(player:getNation()) >= 6 and 1 or 0

                    if not player:hasSpell(invaderXim.magic.spell.VOLKER) then
                        return quest:event(986, 0, 0, 0, trustMemoryVolker(player), 0, 0, 0, rank6)
                    end
                end,
            },

            ['Naji'] =
            {
                onTrigger = function(player, npc)
                    local rank3 = player:getRank(player:getNation()) >= 3 and 1 or 0

                    if not player:hasSpell(invaderXim.magic.spell.AYAME) then
                        return quest:progressEvent(983, 0, 0, 0, 0, 0, 0, 0, rank3):oncePerZone()
                    end
                end,
            },

            onEventFinish =
            {
                [985] = function(player, csid, option, npc)
                    if option == 2 then
                        player:addSpell(invaderXim.magic.spell.AYAME, true, true)
                        player:messageSpecial(metalworksID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.AYAME)
                    end
                end,

                [986] = function(player, csid, option, npc)
                    if option == 2 then
                        player:addSpell(invaderXim.magic.spell.VOLKER, true, true)
                        player:messageSpecial(metalworksID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.VOLKER)
                    end
                end,

                [988] = function(player, csid, option, npc)
                    if option == 2 then
                        player:addSpell(invaderXim.magic.spell.IRON_EATER, true, true)
                        player:messageSpecial(metalworksID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.IRON_EATER)
                    end
                end,
            },
        },

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Clarion_Star'] = quest:progressEvent(436),
        },
    },
}

return quest
