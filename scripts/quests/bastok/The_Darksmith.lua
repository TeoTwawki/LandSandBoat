-----------------------------------
-- The Darksmith
-----------------------------------
-- Log ID: 1, Quest ID: 40
-- Mighty Fist : !pos -47 2 -30 237
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_DARKSMITH)

quest.reward =
{
    fame     = 5,
    fameArea = invaderXim.fameArea.BASTOK,
    gil      = 8000,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 3
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Mighty_Fist'] = quest:progressEvent(565),

            onEventFinish =
            {
                [565] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Mighty_Fist'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE, 2 } }) then
                        return quest:progressEvent(566)
                    end
                end,
            },

            onEventFinish =
            {
                [566] = function(player, csid, option, npc)
                    player:confirmTrade()

                    -- From previous implementation, award 30 fame (25 + 5) on first completion,
                    -- and 5 fame for any subsequent trade.
                    if player:getQuestStatus(quest.areaId, quest.questId) == invaderXim.questStatus.QUEST_ACCEPTED then
                        player:addFame(invaderXim.fameArea.BASTOK, 25)
                    end

                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
