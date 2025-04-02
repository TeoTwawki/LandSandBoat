-----------------------------------
-- Drachenfall
-----------------------------------
-- Log ID: 1, Quest ID: 31
-- Black Mud      : !pos 63.514 7 -0.972 234
-- Waterfall Base : !pos -217.594 98.644 464.722 106
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.DRACHENFALL)

quest.reward =
{
    fame = 120,
    fameArea = invaderXim.fameArea.BASTOK,
    gil = 2000,
    title = invaderXim.title.DRACHENFALL_ASCETIC,
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 2
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Black_Mud'] =
            {
                onTrigger = quest:progressEvent(101)
            },

            onEventFinish =
            {
                [101] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.BRASS_CANTEEN) then
                        quest:begin(player)
                    end
                end,
            }
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Black_Mud'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.CANTEEN_OF_DRACHENFALL_WATER) then
                        return quest:progressEvent(103)
                    end
                end,

                onTrigger = function(player, npc)
                    if
                        not player:findItem(invaderXim.item.BRASS_CANTEEN) and
                        not player:findItem(invaderXim.item.CANTEEN_OF_DRACHENFALL_WATER)
                    then
                        return quest:progressEvent(102)
                    end
                end,
            },

            onEventFinish =
            {
                [102] = function(player, csid, option, npc)
                    npcUtil.giveItem(player, invaderXim.item.BRASS_CANTEEN)
                end,

                [103] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },

        [invaderXim.zone.NORTH_GUSTABERG] =
        {
            ['Waterfall_Base'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, invaderXim.item.BRASS_CANTEEN) and
                        npcUtil.giveItem(player, invaderXim.item.CANTEEN_OF_DRACHENFALL_WATER)
                    then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
