-----------------------------------
-- Seeing Spots
-- !addquest 7 10
-- Wyatt: !pos 124 0 84 80
-- LADYBUG_WING: !additem 2506
-----------------------------------

local quest = Quest:new(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SEEING_SPOTS)

quest.reward =
{
    gil = 3000,
    title = invaderXim.title.LADY_KILLER,
}

quest.sections =
{
    -- After speaking with Wyatt, collect four Ladybug Wings.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA_S] =
        {
            ['Wyatt'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(2)
                end,
            },

            onEventFinish =
            {
                [2] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    -- Trade the wings to Wyatt to receive your reward.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED or status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA_S] =
        {
            ['Wyatt'] =
            {
                -- Reminder
                onTrigger = function(player, npc)
                    return quest:progressEvent(3)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.LADYBUG_WING, 4 } }) then
                        return quest:progressEvent(4)
                    end
                end,
            },

            onEventFinish =
            {
                [4] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
