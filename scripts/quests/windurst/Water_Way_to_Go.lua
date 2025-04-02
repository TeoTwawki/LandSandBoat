-----------------------------------
-- Water Way to Go
-----------------------------------
-- !addquest 2 16
-- Ohbiru-Dohbiru : !pos 23 -5 -193 238
-- Giddeus Spring : !pos -258 -2 -249 145
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WATER_WAY_TO_GO)

quest.reward =
{
    fame = 40,
    fameArea = invaderXim.fameArea.WINDURST,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.OVERNIGHT_DELIVERY) and
                player:getFameLevel(invaderXim.fameArea.WINDURST) >= 3 and
                not quest:getMustZone(player)
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Ohbiru-Dohbiru'] = quest:progressEvent(352, 0, invaderXim.item.CANTEEN_OF_GIDDEUS_WATER),

            onEventFinish =
            {
                [352] = function(player, csid, option, npc)
                    if
                        option == 0 and
                        npcUtil.giveItem(player, invaderXim.item.RHINOSTERY_CANTEEN)
                    then
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

        [invaderXim.zone.GIDDEUS] =
        {
            ['Giddeus_Spring'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.RHINOSTERY_CANTEEN) then
                        return quest:progressEvent(55)
                    end
                end,
            },

            onEventFinish =
            {
                [55] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.CANTEEN_OF_GIDDEUS_WATER) then
                        player:confirmTrade()
                    end
                end,
            },
        },

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Ohbiru-Dohbiru'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.CANTEEN_OF_GIDDEUS_WATER) then
                        return quest:progressEvent(355, 900)
                    end
                end,

                onTrigger = function(player, npc)
                    if
                        not player:findItem(invaderXim.item.RHINOSTERY_CANTEEN) and
                        not player:findItem(invaderXim.item.CANTEEN_OF_GIDDEUS_WATER)
                    then
                        return quest:progressEvent(354)
                    else
                        return quest:progressEvent(353)
                    end
                end,
            },

            onEventFinish =
            {
                [354] = function(player, csid, option, npc)
                    npcUtil.giveItem(player, invaderXim.item.RHINOSTERY_CANTEEN)
                end,

                [355] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        -- Note: Message display for gil reward is handled by the event
                        player:addGil(900)
                        player:setLocalVar('Quest[2][17]mustZone', 1)
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
            ['Ohbiru-Dohbiru'] = quest:progressEvent(356, 0, invaderXim.item.CANTEEN_OF_GIDDEUS_WATER)
        },
    },
}

return quest
