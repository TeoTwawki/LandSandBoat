-----------------------------------
-- Fear of the Dark
-----------------------------------
-- Log ID: 0, Quest ID: 78
-----------------------------------
-- Secodiand : !pos -160 -0 137 231
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.FEAR_OF_THE_DARK)

quest.reward =
{
    gil = 200,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Secodiand'] = quest:progressEvent(19),

            onEventFinish =
            {
                [19] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status >= invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Secodiand'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHas(trade, { { invaderXim.item.BAT_WING, 2 } }) then
                        return quest:progressEvent(18)
                    end
                end,
            },

            onEventFinish =
            {
                [18] = function(player, csid, option, npc)
                    if player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.FEAR_OF_THE_DARK) == invaderXim.questStatus.QUEST_ACCEPTED then
                        quest:complete(player)
                    else
                        npcUtil.giveCurrency(player, 'gil', 200)
                        player:addFame(invaderXim.fameArea.SANDORIA, 5)
                    end

                    player:confirmTrade()
                end,
            },
        },
    },
}

return quest
