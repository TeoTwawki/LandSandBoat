-----------------------------------
-- Crest of Davoi
-----------------------------------
-- Log ID: 3, Quest ID: 0
-- Baudin : !pos -75 0 80 244
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.CREST_OF_DAVOI)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.JEUNO,
    keyItem = invaderXim.ki.CREST_OF_DAVOI,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasKeyItem(invaderXim.ki.SILVER_BELL)
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Baudin'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(174)
                end,
            },

            onEventFinish =
            {
                [174] = function(player, csid, option, npc)
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

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Baudin'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.SLICE_OF_COEURL_MEAT) then
                        return quest:progressEvent(171)
                    end
                end,

                onTrigger = quest:progressEvent(175),
            },

            onEventFinish =
            {
                [171] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    }
}

return quest
