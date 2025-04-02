-----------------------------------
-- Star Struck
-----------------------------------
-- Log ID: 2, Quest ID: 10
-- Koru-Moru : !pos -120 -6 124 239
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.STAR_STRUCK)

quest.reward =
{
    fame     = 20,
    fameArea = invaderXim.fameArea.WINDURST,
    item     = invaderXim.item.COMPOUND_EYE_CIRCLET,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Koru-Moru'] =
            {
                onTrigger = function(player, npc)
                    if player:hasItem(invaderXim.item.TORN_EPISTLE) then
                        return quest:progressEvent(197)
                    end
                end,
            },

            onEventFinish =
            {
                [197] = function(player, csid, option, npc)
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

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Koru-Moru'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.TORN_EPISTLE) then
                        return quest:progressEvent(199)
                    elseif npcUtil.tradeHasExactly(trade, invaderXim.item.METEORITE) then
                        return quest:progressEvent(211)
                    end
                end,

                onTrigger = quest:event(198),
            },

            ['Luuh_Koplehn'] = quest:event(200),

            onEventFinish =
            {
                [199] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveCurrency(player, 'gil', 50)
                end,

                [211] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()

                        invaderXim.quest.setMustZone(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.BLAST_FROM_THE_PAST)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                not player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_PUPPET_MASTER)
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Koru-Moru'] = quest:event(213):replaceDefault(),
        },
    },
}

return quest
