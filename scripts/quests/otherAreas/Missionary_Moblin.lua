-----------------------------------
-- Missionery Moblin
-- Koblakiq !pos -64.851 21.834 -117.521 11
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.MISSIONARY_MOBLIN)

quest.reward =
{
    gil = 4000,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.OLDTON_MOVALPOLOS] =
        {
            ['Koblakiq'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressCutscene(7)
                end,
            },

            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
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

        [invaderXim.zone.OLDTON_MOVALPOLOS] =
        {
            ['Koblakiq'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.SOILED_LETTER) then
                        return quest:progressCutscene(9)
                    end
                end,

                onTrigger = function(player, npc)
                    return quest:event(8)
                end,
            },

            onEventFinish =
            {
                [9] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.OLDTON_MOVALPOLOS] =
        {
            ['Koblakiq'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(12)
                end,
            },
        },
    },
}

return quest
