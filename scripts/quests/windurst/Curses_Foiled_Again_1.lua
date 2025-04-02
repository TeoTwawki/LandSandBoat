-----------------------------------
-- Curses, Foiled Again! (1)
-----------------------------------
-- !addquest 2 32
-- Shantotto : !pos 122 -2 112 239
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_AGAIN_1)

quest.reward =
{
    fame     = 80,
    fameArea = invaderXim.fameArea.WINDURST,
    item     = invaderXim.item.BRASS_ROD,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Shantotto'] = quest:event(171, 0, 0, 0, 0, 0, 0, invaderXim.item.PINCH_OF_BOMB_ASH, invaderXim.item.BONE_CHIP),

            onEventFinish =
            {
                [171] = function(player, csid, option, npc)
                    if option == 3 then
                        quest:begin(player)
                    end
                end,
            },
        }
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Shantotto'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { invaderXim.item.PINCH_OF_BOMB_ASH, { invaderXim.item.BONE_CHIP, 2 } }) then
                        return quest:progressEvent(173, 0, 0, 0, 0, 0, 0, invaderXim.item.PINCH_OF_BOMB_ASH, invaderXim.item.BONE_CHIP)
                    end
                end,

                onTrigger = quest:event(172, 0, 0, 0, 0, 0, 0, invaderXim.item.PINCH_OF_BOMB_ASH, invaderXim.item.BONE_CHIP)
            },

            onEventFinish =
            {
                [173] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()

                        invaderXim.quest.setVar(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_AGAIN_2, 'Timer', VanadielUniqueDay() + 1)

                        -- NOTE: There's two zoning mechanics required prior to the next quest being displayed in logs.  To make this easier,
                        -- setting a mustZone value for this quest as a requisite in order to utilize mustZone in the next quest's available
                        -- block.
                        invaderXim.quest.setMustZone(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_AGAIN_1)
                    end
                end,
            },
        },
    },
}

return quest
