-----------------------------------
-- Stardust
-----------------------------------
-- Log ID: 1, Quest ID: 24
-- Baldric : !pos -50.858 1.777 -31.141 237
-- qm1     : !pos 238.524 2.661 -148.784 103
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.STARDUST)

quest.reward =
{
    fame     = 110,
    fameArea = invaderXim.fameArea.BASTOK,
    gil      = 300,
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
            ['Baldric'] = quest:progressEvent(554),

            onEventFinish =
            {
                [554] = function(player, csid, option, npc)
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
            ['Baldric'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.PINCH_OF_VALKURM_SUNSAND) then
                        return quest:progressEvent(555)
                    end
                end,
            },

            onEventFinish =
            {
                [555] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Drangord'] = quest:event(97),
        },
    },
}

return quest
