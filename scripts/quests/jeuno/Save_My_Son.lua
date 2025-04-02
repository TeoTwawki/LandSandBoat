-----------------------------------
-- Save My Son
-----------------------------------
-- Log ID: 3, Quest ID: 5
-- Door: Merchant's House (_6t2) : !pos -82.22 -7.65 -168.839 245
-- Nightflowers                  : !pos -264.775 -3.718 28.767 126
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SAVE_MY_SON)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.JEUNO,
    gil      = 2100,
    item     = invaderXim.item.BEAST_WHISTLE,
    title    = invaderXim.title.LIFE_SAVER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.CHOCOBOS_WOUNDS) and
                player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
        end,

        [invaderXim.zone.LOWER_JEUNO] =
        {
            ['_6t2'] = quest:progressEvent(164),

            onEventFinish =
            {
                [164] = function(player, csid, option, npc)
                    if option == 0 then
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

        [invaderXim.zone.LOWER_JEUNO] =
        {
            ['_6t2'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(163)
                    else
                        return quest:event(229)
                    end
                end,
            },

            onEventFinish =
            {
                [163] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Shalott'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:event(101)
                    else
                        return quest:event(44)
                    end
                end,
            },
        },

        [invaderXim.zone.QUFIM_ISLAND] =
        {
            ['Nightflowers'] =
            {
                onTrigger = function(player, npc)
                    local vanadielClockTime = utils.vanadielClockTime()

                    if
                        quest:getVar(player, 'Prog') == 0 and
                        (
                            vanadielClockTime > 2130 or
                            vanadielClockTime <= 540
                        )
                    then
                        return quest:progressEvent(0)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.LOWER_JEUNO] =
        {
            ['_6t2'] = quest:event(132):replaceDefault(),
        },

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Shalott'] = quest:event(44):replaceDefault(),
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                not player:hasCompletedQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.PATH_OF_THE_BEASTMASTER)
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Chocobo'] = quest:event(55),
            ['Osker']   = quest:event(55),
        },
    },
}

return quest
