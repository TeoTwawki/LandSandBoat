-----------------------------------
-- The Return of the Adventurer
-----------------------------------
-- Log ID: 1, Quest ID: 30
-- Gwill : !pos -317.829 -15.948 -177.375 235
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_RETURN_OF_THE_ADVENTURER)

quest.reward =
{
    fame     = 80,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.COTTON_HEADBAND,
    title    = invaderXim.title.KULATZ_BRIDGE_COMPANION,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.FATHER_FIGURE) and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 3
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Gwill'] = quest:progressEvent(242),

            onEventFinish =
            {
                [242] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Gwill'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.STICK_OF_CINNAMON) then
                        return quest:progressEvent(243)
                    end
                end,
            },

            onEventFinish =
            {
                [243] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
