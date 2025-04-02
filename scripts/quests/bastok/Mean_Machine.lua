-----------------------------------
-- Mean Machine
-----------------------------------
-- Log ID: 1, Quest ID: 25
-- Unlucky Rat : -59.724 1.999 30.179 237
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.MEAN_MACHINE)

quest.reward =
{
    fame     = 120,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.SCROLL_OF_WARP,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 2
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Unlucky_Rat'] = quest:progressEvent(556),

            onEventFinish =
            {
                [556] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Unlucky_Rat'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.VIAL_OF_SLIME_OIL) then
                        return quest:progressEvent(557)
                    end
                end,

                onTrigger = quest:event(559),
            },

            onEventFinish =
            {
                [557] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
