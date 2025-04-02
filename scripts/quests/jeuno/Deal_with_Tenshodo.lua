-----------------------------------
-- Deal with Tenshodo
-----------------------------------
-- Log ID: 3, Quest ID: 26
-- Garnev : !pos 30 4 -36 245
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.DEAL_WITH_TENSHODO)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.JEUNO,
    keyItem  = invaderXim.ki.CLOCK_TOWER_OIL,
    title    = invaderXim.title.TRADER_OF_RENOWN,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.A_CLOCK_MOST_DELICATE) == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.LOWER_JEUNO] =
        {
            ['Garnev'] =
            {
                onTrigger = function(player, npc)
                    if player:getFameLevel(invaderXim.fameArea.NORG) >= 2 then
                        return quest:progressEvent(167)
                    else
                        return quest:event(168)
                    end
                end,
            },

            onEventFinish =
            {
                [167] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.LOWER_JEUNO] =
        {
            ['Garnev'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.GOLD_ORCMASK) then
                        return quest:progressEvent(166)
                    end
                end,
            },

            onEventFinish =
            {
                [166] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    }
}

return quest
