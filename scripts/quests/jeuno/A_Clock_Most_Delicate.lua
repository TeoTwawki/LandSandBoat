-----------------------------------
-- A Clock Most Delicate
-----------------------------------
-- Log ID: 3, Quest ID: 2
-- Collet : !pos -44 0 107 244
-- _6s2   : !pos -80 0 104 244
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.A_CLOCK_MOST_DELICATE)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.JEUNO,
    gil      = 1200,
    item     = invaderXim.item.ENGINEERS_GLOVES,
    title    = invaderXim.title.PROFESSIONAL_LOAFER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.JEUNO) >= 5
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['_6s2'] =
            {
                onTrigger = function(player, npc)
                    local questOption = quest:getVar(player, 'Option')

                    if questOption == 1 then
                        return quest:progressEvent(119)
                    elseif questOption == 2 then
                        return quest:progressEvent(118)
                    end
                end,
            },

            ['Collet'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Option') == 0 then
                        return quest:progressEvent(112)
                    end
                end,
            },

            onEventFinish =
            {
                [112] = function(player, csid, option, npc)
                    quest:setVar(player, 'Option', 1)
                end,

                [118] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,

                [119] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    else
                        quest:setVar(player, 'Option', 2)
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
            ['_6s2'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.CLOCK_TOWER_OIL) then
                        return quest:progressEvent(202)
                    else
                        return quest:event(117)
                    end
                end,
            },

            onEventFinish =
            {
                [202] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.CLOCK_TOWER_OIL)
                    end
                end,
            },
        },
    }
}

return quest
