-----------------------------------
-- Wings of Gold
-----------------------------------
-- Log ID: 3, Quest ID: 60
-- Brutus : !pos -55 8 95 244
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.WINGS_OF_GOLD)

quest.reward =
{
    fame     = 20,
    fameArea = invaderXim.fameArea.JEUNO,
    item     = invaderXim.item.BARBAROI_AXE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.PATH_OF_THE_BEASTMASTER) and
                player:getMainLvl() >= invaderXim.settings.main.AF1_QUEST_LEVEL and
                player:getMainJob() == invaderXim.job.BST
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Brutus'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(139)
                    else
                        return quest:progressEvent(137)
                    end
                end,

            },
            onEventFinish =
            {
                [137] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,

                [139] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    else
                        quest:setVar(player, 'Prog', 1) -- If declined then future Brutus quest start will use short dialog
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
            ['Brutus'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.GUIDING_BELL) then
                        return quest:event(136)
                    else
                        return quest:progressEvent(138)
                    end
                end,
            },

            onEventFinish =
            {
                [138] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.GUIDING_BELL)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                not player:hasCompletedQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SCATTERED_INTO_SHADOW)
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Brutus'] = quest:event(134):replaceDefault(),
        },
    },
}

return quest
