-----------------------------------
-- Lerene's Lament
-----------------------------------
-- !addquest 9 126
-- Lerene : !pos -46.876 -179.334 -28.602 274
-----------------------------------
local outerRaKaznarID = zones[invaderXim.zone.OUTER_RAKAZNAR]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.LERENES_LAMENT)

quest.reward =
{
    fameArea = invaderXim.fameArea.ADOULIN,
    bayld    = 500,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.OUTER_RAKAZNAR] =
        {
            ['Lerene'] = quest:progressEvent(22),

            onEventFinish =
            {
                [22] = function(player, csid, option, npc)
                    if option == 2 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.OUTER_RAKAZNAR] =
        {
            ['Lerene'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.SQUARE_OF_ANCESTRAL_CLOTH, 2 } }) then
                        return quest:progressEvent(24)
                    end
                end,

                onTrigger = quest:event(23),
            },

            onEventFinish =
            {
                [24] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.LERENES_PATEN)
                    player:messageSpecial(outerRaKaznarID.text.YOU_HAVE_LEARNED, invaderXim.ki.PULVERIZING)

                    if quest:complete(player) then
                        player:confirmTrade()
                        player:addKeyItem(invaderXim.ki.PULVERIZING)
                    end
                end,
            },
        },
    },
}

return quest
