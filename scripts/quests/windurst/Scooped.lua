-----------------------------------
-- Scooped!
-----------------------------------
-- !addquest 2 38
-- Hariga-Origa : !pos -70.244, -3.800, -4.439
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.SCOOPED)

quest.reward =
{
    gil = 1500,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_HEADLINES)
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Naiko-Paneiko'] = quest:progressEvent(676),

            onEventFinish =
            {
                [676] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Naiko-Paneiko'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.BRONZE_BOX) then
                        return quest:progressEvent(680)
                    end
                end,

                onTrigger = quest:event(677),
            },

            ['Chyuk-Kochak'] = quest:event(679),

            onEventFinish =
            {
                [680] = function(player, csid, option, npc)
                    player:confirmTrade()
                    quest:complete(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Chyuk-Kochak'] = quest:event(682):replaceDefault(),

            ['Naiko-Paneiko'] = quest:event(663):replaceDefault(),
        },
    },
}

return quest
