-----------------------------------
-- The Setting Sun
-----------------------------------
-- LogID: 0 QuestID: 72
-----------------------------------
-- Vamorcote: !pos -137.070 10.999 161.855 231
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_SETTING_SUN)

quest.reward =
{
    gil = 10000,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 5 and
                player:hasCompletedQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.BLACKMAIL)
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Vamorcote'] = quest:progressEvent(654, { [1] = invaderXim.item.ENGRAVED_KEY, [2] = invaderXim.item.ENGRAVED_KEY }),

            onEventFinish =
            {
                [654] = function(player, csid, option, npc)
                    if option == 1 then
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

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Vamorcote'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.ENGRAVED_KEY) then
                        return quest:progressEvent(658)
                    end
                end,

                onTrigger = quest:event(655, { [2] = invaderXim.item.ENGRAVED_KEY }),
            },
            onEventFinish =
            {
                [658] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        player:needToZone(true)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                player:needToZone()
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Vamorcote'] = quest:event(659):replaceDefault(),
        },
    },
}

return quest
