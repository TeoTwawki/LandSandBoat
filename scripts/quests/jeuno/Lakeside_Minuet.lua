-----------------------------------
-- Lakeside Minuet
-----------------------------------
-- !addquest 3 95
-- Laila           : !pos -54.045 -1 100.996 244
-- Rhea Myuliah    : !pos -56.220 -1 101.805 244
-- Valderotaux     : !pos 97 0.1 113 230
-- Glowing Pebbles : !pos 104.2 4.1 443.6 82
-----------------------------------
local upperJeunoID = zones[invaderXim.zone.UPPER_JEUNO]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.LAKESIDE_MINUET)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.JEUNO,
    title = invaderXim.title.TROUPE_BRILIOTH_DANCER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL and
                invaderXim.settings.main.ENABLE_WOTG == 1
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Laila'] = quest:progressEvent(10111),

            onEventFinish =
            {
                [10111] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Laila'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.STARDUST_PEBBLE) then
                        return quest:progressEvent(10118)
                    else
                        return quest:progressEvent(10112)
                    end
                end,
            },

            ['Rhea_Myuliah'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 0 then
                        return quest:progressEvent(10113)
                    elseif questProgress == 1 then
                        return quest:progressEvent(10114)
                    elseif questProgress == 2 then
                        return quest:progressEvent(10115)
                    elseif questProgress == 3 then
                        if quest:getLocalVar(player, 'rheaOption') == 0 then
                            return quest:progressEvent(10117)
                        else
                            return quest:progressEvent(10116)
                        end
                    elseif questProgress == 4 then
                        return quest:progressEvent(10121)
                    end
                end,
            },

            onEventFinish =
            {
                [10113] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [10115] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                end,

                [10116] = function(player, csid, option, npc)
                    quest:setLocalVar(player, 'rheaOption', 0)
                end,

                [10117] = function(player, csid, option, npc)
                    quest:setLocalVar(player, 'rheaOption', 1)
                end,

                [10118] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:unlockJob(invaderXim.job.DNC)
                        player:messageSpecial(upperJeunoID.text.UNLOCK_DANCER)
                        player:delKeyItem(invaderXim.ki.STARDUST_PEBBLE)
                        npcUtil.giveKeyItem(player, invaderXim.ki.JOB_GESTURE_DANCER)
                        player:needToZone(true)
                    end
                end,
            },
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Valderotaux'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 1 then
                        return quest:progressEvent(888)
                    elseif questProgress >= 2 then
                        return quest:event(889)
                    end
                end,
            },

            onEventFinish =
            {
                [888] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,
            },
        },

        [invaderXim.zone.JUGNER_FOREST_S] =
        {
            ['Glowing_Pebbles'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 3 and
                        not player:hasKeyItem(invaderXim.ki.STARDUST_PEBBLE)
                    then
                        return quest:progressEvent(100)
                    end
                end,
            },

            onEventFinish =
            {
                [100] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.STARDUST_PEBBLE)
                    quest:setVar(player, 'Prog', 4)
                end,
            }
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                not player:hasCompletedQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_UNFINISHED_WALTZ)
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Laila']        = quest:event(10119):replaceDefault(),
            ['Rhea_Myuliah'] = quest:event(10126):replaceDefault(),
        },
    },
}

return quest
