-----------------------------------
-- No Strings Attached
-----------------------------------
-- Log ID: 6, Quest ID: 7
-- Shamarhaan   : !pos -285.382 -13.021 -84.743 235
-- Iruki-Waraki : !pos 101.329 -6.999 -29.042 50
-- Ghatsad      : !pos 34.325 -7.804 57.511 50
-- qm10         : !pos 457.128 -8.249 60.795 54
-----------------------------------
local ahtUrhganID = zones[invaderXim.zone.AHT_URHGAN_WHITEGATE]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED)

quest.reward =
{
    item = invaderXim.item.ANIMATOR,
    title = invaderXim.title.PROUD_AUTOMATON_OWNER,
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Shamarhaan'] = quest:progressEvent(434),

            onEventFinish =
            {
                [434] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Iruki-Waraki'] = quest:progressEvent(259),
        },
    },

    -- Section: Quest Accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Shamarhaan'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(435)
                    end
                end,
            },
        },

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Iruki-Waraki'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 0 then
                        return quest:progressEvent(260)
                    elseif questProgress == 1 then
                        return quest:progressEvent(261)
                    elseif questProgress == 5 then
                        return quest:progressEvent(266)
                    end
                end,
            },

            ['Ghatsad'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 1 then
                        return quest:progressEvent(262)
                    elseif questProgress == 2 then
                        return quest:progressEvent(263)
                    elseif
                        questProgress == 3 and
                        player:hasKeyItem(invaderXim.ki.ANTIQUE_AUTOMATON)
                    then
                        return quest:progressEvent(264)
                    elseif
                        questProgress == 4 and
                        quest:getVar(player, 'Timer') <= VanadielUniqueDay()
                    then
                        return quest:progressEvent(265)
                    end
                end,
            },

            onEventFinish =
            {
                [260] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,

                [262] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,

                [264] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 4)
                    quest:setVar(player, 'Timer', VanadielUniqueDay() + 1)
                    player:delKeyItem(invaderXim.ki.ANTIQUE_AUTOMATON)
                end,

                [265] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 5)
                end,

                [266] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:unlockJob(invaderXim.job.PUP)
                        player:messageSpecial(ahtUrhganID.text.YOU_CAN_BECOME_PUP)
                        player:setPetName(invaderXim.petType.AUTOMATON, option + 118)
                        player:unlockAttachment(invaderXim.item.HARLEQUIN_FRAME)
                        player:unlockAttachment(invaderXim.item.HARLEQUIN_HEAD)
                    end
                end,
            },
        },

        [invaderXim.zone.ARRAPAGO_REEF] =
        {
            ['qm10'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(214)
                    end
                end,
            },

            onEventFinish =
            {
                [214] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.ANTIQUE_AUTOMATON)
                    quest:setVar(player, 'Prog', 3)
                end,
            },
        },
    },

    -- Section: Quest Completed
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Iruki-Waraki'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        not player:findItem(invaderXim.item.ANIMATOR) and
                        npcUtil.tradeHasExactly(trade, { { 'gil', 10000 } })
                    then
                        player:confirmTrade()
                        npcUtil.giveItem(player, invaderXim.item.ANIMATOR)
                    end
                end,

                onTrigger = function(player, npc)
                    if
                        player:getMainLvl() < invaderXim.settings.main.AF1_QUEST_LEVEL and
                        player:getMainJob() == invaderXim.job.PUP
                    then
                        return quest:progressEvent(267)
                    end
                end,
            },
        },
    },
}

return quest
