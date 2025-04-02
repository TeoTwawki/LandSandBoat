-----------------------------------
-- The Old Monument
-----------------------------------
-- Log ID: 3, Quest ID: 11
-- Mertaire    : !pos -17 0 -61 245
-- Bki Tbujhja : !pos -22 0 -60 245
-- Song Runes  : !pos -244 16 -280 118
-----------------------------------
local buburimuID   = zones[invaderXim.zone.BUBURIMU_PENINSULA]
local lowerJeunoID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_OLD_MONUMENT)

quest.reward =
{
    item  = invaderXim.item.POETIC_PARCHMENT,
    title = invaderXim.title.RESEARCHER_OF_CLASSICS,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
        end,

        [invaderXim.zone.LOWER_JEUNO] =
        {
            ['Bki_Tbujhja'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') >= 1 then
                        return quest:progressEvent(181)
                    end
                end,
            },

            ['Mertaire'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(102)
                    else
                        return quest:messageSpecial(lowerJeunoID.text.MERTAIRE_MALLIEBELL_LEFT)
                    end
                end,
            },

            onEventFinish =
            {
                [102] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,

                [181] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,
            },
        },

        [invaderXim.zone.BUBURIMU_PENINSULA] =
        {
            ['Song_Runes'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(0)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return vars.Prog == 3 or
                status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.BUBURIMU_PENINSULA] =
        {
            ['Song_Runes'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.SHEET_OF_PARCHMENT) then
                        return quest:progressEvent(2)
                    end
                end,

                onTrigger = quest:messageSpecial(buburimuID.text.SONG_RUNES_REQUIRE, invaderXim.item.SHEET_OF_PARCHMENT),
            },

            onEventFinish =
            {
                [2] = function(player, csid, option, npc)
                    player:messageSpecial(buburimuID.text.SONG_RUNES_WRITING, invaderXim.item.SHEET_OF_PARCHMENT)

                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
