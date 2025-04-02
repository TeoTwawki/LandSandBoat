-----------------------------------
-- A Foreman's Best Friend
-----------------------------------
-- Log ID: 1, Quest ID: 9
-- Gudav : !pos -3.286 1.407 50.591 236
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.A_FOREMANS_BEST_FRIEND)

quest.reward =
{
    fame     = 60,
    fameArea = invaderXim.fameArea.BASTOK,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Gudav'] = quest:progressEvent(110),

            onEventFinish =
            {
                [110] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Dehlner'] = quest:event(111),

            ['Gudav'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.DOG_COLLAR) then
                        return quest:progressEvent(112)
                    end
                end,
            },

            onEventFinish =
            {
                [112] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        if player:hasKeyItem(invaderXim.ki.MAP_OF_THE_GUSGEN_MINES) then
                            player:addExp(2000)
                        else
                            npcUtil.giveKeyItem(player, invaderXim.ki.MAP_OF_THE_GUSGEN_MINES)
                        end
                    end
                end,
            },
        },
    },
}

return quest
