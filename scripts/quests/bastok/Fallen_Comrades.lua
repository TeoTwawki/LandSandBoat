-----------------------------------
-- Fallen Comrades
-----------------------------------
-- Log ID: 1, Quest ID: 19
-- Pavvke : !pos 16.586 6.985 -14.843 234
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.FALLEN_COMRADES)

quest.reward =
{
    fame     = 8,
    fameArea = invaderXim.fameArea.BASTOK,
    gil      = 550,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 2
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Pavvke'] = quest:progressEvent(90),

            onEventFinish =
            {
                [90] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status >= invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Pavvke'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.SILVER_NAME_TAG) then
                        if player:hasCompletedQuest(quest.areaId, quest.questId) then
                            return quest:progressEvent(92)
                        else
                            return quest:progressEvent(91)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [91] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()

                        player:addFame(invaderXim.fameArea.BASTOK, 112)
                    end
                end,

                [92] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
