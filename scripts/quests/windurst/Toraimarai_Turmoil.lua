-----------------------------------
-- Toraimarai Turmoil
-----------------------------------
-- !addquest 2 80
-- Ohbiru-Dohbiru : !pos 23 -5 -193 238
-- Leepe-Hoppe    ! !pos -131 20 -174 238
-- Polikal-Ramikal: !pos 15 -18 195 239
-- Yoran-Oran     : !pos -110 -14 203 239
-- Giddeus Spring : !pos -258 -2 -249 145
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.TORAIMARAI_TURMOIL)

quest.reward =
{
    gil  = 4500,
    fame = 100,
    fameArea = invaderXim.fameArea.WINDURST,
    title = invaderXim.title.CERTIFIED_RHINOSTERY_VENTURER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.BLUE_RIBBON_BLUES) and
                player:getFameLevel(invaderXim.fameArea.WINDURST) >= 6 and
                not quest:getMustZone(player)
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Ohbiru-Dohbiru'] = quest:progressEvent(785, 4500, invaderXim.keyItem.RHINOSTERY_CERTIFICATE, invaderXim.item.STARMITE_SHELL),

            onEventFinish =
            {
                [785] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, invaderXim.ki.RHINOSTERY_CERTIFICATE)
                    end
                end,
            },
        },
    },

    {
        --initial completion
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Ohbiru-Dohbiru'] =
            {
                onTrigger = quest:event(786, 4500, invaderXim.keyItem.RHINOSTERY_CERTIFICATE, invaderXim.item.STARMITE_SHELL), -- Reminder text.

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.STARMITE_SHELL, 3 } }) then
                        return quest:progressEvent(791)
                    end
                end,
            },

            ['Leepe-Hoppe'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(790, 0, invaderXim.ki.RHINOSTERY_CERTIFICATE)
                end,
            },

            onEventFinish =
            {
                [791] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Polikal-Ramikal'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(391)
                end,
            },

            ['Yoran-Oran'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(392)
                end,
            },
        },
    },

    {
        --repeat completion
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Ohbiru-Dohbiru'] =
            {
                onTrigger = quest:event(795, 4500, 0, invaderXim.item.STARMITE_SHELL), -- repeat dialog

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.STARMITE_SHELL, 3 } }) then
                        return quest:progressEvent(791)
                    end
                end,
            },

            onEventFinish =
            {
                [791] = function(player, csid, option, npc)
                    player:confirmTrade()

                    --From previous implementation, award 100 fame on first completion,
                    -- and 50 fame for any subsequent trade.
                    player:addFame(invaderXim.fameArea.WINDURST, 50)
                    npcUtil.giveCurrency(player, 'gil', 4500)
                end,
            },
        },
    },
}

return quest
