-----------------------------------
-- Shady Business
-----------------------------------
-- Log ID: 1, Quest ID: 8
-- Talib : !pos -101.133 4.649 28.803 236
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.SHADY_BUSINESS)

quest.reward =
{
    fame     = 80,
    fameArea = invaderXim.fameArea.NORG,
    gil      = 350,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status >= invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BEAUTY_AND_THE_GALKA)
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Talib'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(90)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.CHUNK_OF_ZINC_ORE, 4 } }) then
                        return quest:progressEvent(91)
                    end
                end,

            },

            onEventFinish =
            {
                [90] = function(player, csid, option, npc)
                    -- We can complete the quest without accepting it, but quest will NOT get re-accepted after completed.
                    if player:getQuestStatus(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.SHADY_BUSINESS) == invaderXim.questStatus.QUEST_AVAILABLE then
                        quest:begin(player)
                    end
                end,

                [91] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,

            },
        },
    },
}

return quest
