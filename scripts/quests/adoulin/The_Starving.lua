-----------------------------------
-- The Starving
-----------------------------------
-- !addquest 9 84
-- Westerly Breeze : !pos 62 32 123 256
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.THE_STARVING)

quest.reward =
{
    fameArea = invaderXim.fameArea.ADOULIN,
    exp      = 1000,
    bayld    = 500,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                quest:getVar(player, 'Timer') <= VanadielUniqueDay()
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Westerly_Breeze'] = quest:progressEvent(3005),

            onEventFinish =
            {
                [3005] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        ['Westerly_Breeze'] =
        {
            onTrade = function(player, npc, trade)
                if npcUtil.tradeHasExactly(trade, invaderXim.item.BOTTLE_OF_GOBLIN_DRINK) then
                    return quest:progressEvent(3007)
                elseif
                    trade:getItemCount() == 1 and
                    trade:getGil() == 0
                then
                    local itemObj = trade:getItem(0)
                    local auctionCategory = itemObj:getAHCat()

                    if auctionCategory == 58 then
                        return quest:event(3008)
                    else
                        return quest:event(3006)
                    end
                else
                    return quest:event(3006)
                end
            end,

            onTrigger = quest:event(3006),
        },

        onEventFinish =
        {
            [3007] = function(player, csid, option, npc)
                if quest:complete(player) then
                    invaderXim.quest.setMustZone(player, invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.ALWAYS_MORE_QUOTH_THE_RAVENOUS)
                    invaderXim.quest.setVar(player, invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.ALWAYS_MORE_QUOTH_THE_RAVENOUS, 'Timer', VanadielUniqueDay() + 1)
                end
            end,

            [3008] = function(player, csid, option, npc)
                player:confirmTrade()
            end,
        },
    },
}

return quest
