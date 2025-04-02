-----------------------------------
-- Path of the Beastmaster
-----------------------------------
-- Log ID: 3, Quest ID: 19
-- Brutus : !pos -55 8 95 244
-----------------------------------
local upperJeunoID = zones[invaderXim.zone.UPPER_JEUNO]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.PATH_OF_THE_BEASTMASTER)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.JEUNO,
    keyItem  = invaderXim.ki.JOB_GESTURE_BEASTMASTER,
    title    = invaderXim.title.ANIMAL_TRAINER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SAVE_MY_SON) and
                player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Brutus'] = quest:progressEvent(70),

            onEventFinish =
            {
                [70] = function(player, csid, option, npc)
                    player:unlockJob(invaderXim.job.BST)
                    player:messageSpecial(upperJeunoID.text.YOU_CAN_NOW_BECOME_A_BEASTMASTER)
                    quest:complete(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Brutus']  = quest:event(20),
            ['Chocobo'] = quest:event(72):replaceDefault(),
            ['Osker']   = quest:event(45):replaceDefault(),
        },
    },
}

return quest
