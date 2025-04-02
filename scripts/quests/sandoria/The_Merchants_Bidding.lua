-----------------------------------
-- The Merchants Bidding
-----------------------------------
-- Log ID: 0, Quest ID: 69
-----------------------------------
-- Parvipon : !pos -169 -1 13 230
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_MERCHANTS_BIDDING)

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Parvipon'] = quest:progressEvent(90),

            onEventFinish =
            {
                [90] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Parvipon'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHas(trade, { { invaderXim.item.RABBIT_HIDE, 3 } }) then
                        return quest:progressEvent(89)
                    end
                end,

                onTrigger = function(player, npc)
                    if player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_MERCHANTS_BIDDING) == invaderXim.questStatus.QUEST_ACCEPTED then
                        return quest:event(88)
                    else
                        return quest:event(90, { [7] = 1 })
                    end
                end,
            },

            onEventFinish =
            {
                [89] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:addFame(invaderXim.fameArea.SANDORIA, 30)
                    else
                        player:addFame(invaderXim.fameArea.SANDORIA, 5)
                    end

                    npcUtil.giveCurrency(player, 'gil', 120)
                    player:confirmTrade()
                end,
            },
        },
    },
}

return quest
