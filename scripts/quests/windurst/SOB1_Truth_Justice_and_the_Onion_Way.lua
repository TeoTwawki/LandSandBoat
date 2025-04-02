-----------------------------------
-- Truth, Justice, and the Onion Way
--
-- Kohlo-Lakolo, !pos -26.8 -6 190 240
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TRUTH_JUSTICE_AND_THE_ONION_WAY)

quest.reward =
{
    fame     = 10,
    fameArea = invaderXim.fameArea.WINDURST,
    item     = invaderXim.item.JUSTICE_BADGE,
    title    = invaderXim.title.STAR_ONION_BRIGADE_MEMBER,
}

quest.sections =
{
    -- Section: Quest is available.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= 5 -- To be confirmed, but only way to see default interaction.
        end,

        [invaderXim.zone.PORT_WINDURST] =
        {
            ['Kohlo-Lakolo'] = quest:progressEvent(368), -- Quest starting event.

            onEventFinish =
            {
                [368] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    -- Section: Quest accepeted.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PORT_WINDURST] =
        {
            ['Kohlo-Lakolo'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(371) -- Reminder text.
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.RARAB_TAIL) then
                        return quest:progressEvent(378, 0, invaderXim.item.RARAB_TAIL, invaderXim.item.JUSTICE_BADGE)
                    end
                end,
            },

            -- Reminder text.
            ['Gomada-Vulmada'] = quest:event(373),
            ['Papo-Hopo']      = quest:event(372),
            ['Pichichi']       = quest:event(374),
            ['Pyo_Nzon']       = quest:event(375),
            ['Shanruru']       = quest:event(377),
            ['Yafa_Yaa']       = quest:event(376),

            onEventFinish =
            {
                [378] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        player:setLocalVar('[2][40]mustZone', 1)
                    end
                end,
            },
        },
    },

    -- Section: Quest completed.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.KNOW_ONES_ONIONS) == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.PORT_WINDURST] =
        {
            -- New default texts.
            ['Gomada-Vulmada'] = quest:event(381):replaceDefault(),
            ['Papo-Hopo']      = quest:event(380):replaceDefault(),
            ['Pichichi']       = quest:event(385):replaceDefault(),
            ['Pyo_Nzon']       = quest:event(382):replaceDefault(),
            ['Shanruru']       = quest:event(384):replaceDefault(),
            ['Yafa_Yaa']       = quest:event(383):replaceDefault(),
        },
    },
}

return quest
