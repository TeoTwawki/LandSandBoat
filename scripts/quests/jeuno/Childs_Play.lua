-----------------------------------
-- Child's Play
-----------------------------------
-- !addquest 3 23
-- Karl : !pos -60 0.1 -8 246
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.CHILDS_PLAY)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.JEUNO,
    keyItem  = invaderXim.ki.WONDER_MAGIC_SET,
    title    = invaderXim.title.TRADER_OF_MYSTERIES,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_WONDER_MAGIC_SET) == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PORT_JEUNO] =
        {
            ['Karl'] = quest:progressEvent(0),

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PORT_JEUNO] =
        {
            ['Karl'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.WHITE_ROCK) then
                        return quest:progressEvent(1)
                    end
                end,

                onTrigger = quest:event(61),
            },

            onEventFinish =
            {
                [1] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
