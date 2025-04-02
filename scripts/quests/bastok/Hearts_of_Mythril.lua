-----------------------------------
-- Hearts of Mythril
-----------------------------------
-- Log ID: 1, Quest ID: 6
-- Elki     : !pos -17.087 -0.05 52.745 234
-- Monument : !pos 300 -62.803 498.2 106
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.HEARTS_OF_MYTHRIL)

quest.reward =
{
    fame     = 80,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.SITABAKI,
    title    = invaderXim.title.PURSUER_OF_THE_PAST,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Elki'] = quest:progressEvent(41),

            onEventFinish =
            {
                [41] = function(player, csid, option, npc)
                    if option == 0 then
                        npcUtil.giveKeyItem(player, invaderXim.ki.BOUQUET_FOR_THE_PIONEERS)
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

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Elki'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(42)
                    end
                end,
            },

            onEventFinish =
            {
                [42] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        invaderXim.quest.setMustZone(player, invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_ELEVENTHS_HOUR)
                    end
                end,
            },
        },

        [invaderXim.zone.NORTH_GUSTABERG] =
        {
            ['Monument'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.BOUQUET_FOR_THE_PIONEERS) then
                        return quest:progressEvent(11)
                    end
                end,
            },

            onEventFinish =
            {
                [11] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:setVar(player, 'Prog', 1)
                        player:delKeyItem(invaderXim.ki.BOUQUET_FOR_THE_PIONEERS)
                    end
                end,
            },
        },
    },
}

return quest
