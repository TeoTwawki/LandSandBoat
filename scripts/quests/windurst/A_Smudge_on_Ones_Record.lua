-----------------------------------
-- A Smudge on One's Record
-----------------------------------
-- !addquest 2 12
-- Hariga-Origa : !pos -62 -6 105 238
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.A_SMUDGE_ON_ONES_RECORD)

quest.reward =
{
    keyItem  = invaderXim.ki.MAP_OF_FEIYIN,
    fameArea = invaderXim.fameArea.WINDURST,
    fame     = 120,
    gil      = 5000,
    exp      = 2000,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CHASING_TALES) and
                player:getFameLevel(invaderXim.fameArea.WINDURST) >= 4 and
                not quest:getMustZone(player)
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Hariga-Origa'] = quest:progressEvent(413, 0, invaderXim.item.VIAL_OF_SLIME_OIL, invaderXim.item.FROST_TURNIP),

            onEventFinish =
            {
                [413] = function(player, csid, option, npc)
                    if option == 0 then
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

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Hariga-Origa'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { invaderXim.item.VIAL_OF_SLIME_OIL, invaderXim.item.FROST_TURNIP }) then
                        return quest:progressEvent(417, quest.reward.gil)
                    end
                end,

                onTrigger = function(player, npc)
                    return quest:progressEvent(414, 0, invaderXim.item.VIAL_OF_SLIME_OIL, invaderXim.item.FROST_TURNIP)
                end,
            },

            ['Serukoko'] = quest:progressEvent(415, 0, invaderXim.item.VIAL_OF_SLIME_OIL, invaderXim.item.FROST_TURNIP),

            onEventFinish =
            {
                [417] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        quest:setMustZone(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                quest:getMustZone(player)
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Hariga-Origa'] = quest:event(418):importantOnce(),
            ['Serukoko']     = quest:event(419):importantOnce(),
        },
    },
}

return quest
