-----------------------------------
-- Out of One's Shell
-----------------------------------
-- Log ID: 1, Quest ID: 5
-- Ronan : !pos 84.712 -8.772 20.301 236
-----------------------------------
local portBastokID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.OUT_OF_ONES_SHELL)

quest.reward =
{
    fame     = 120,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.MONKS_HEADGEAR,
    title    = invaderXim.title.SHELL_OUTER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_QUADAVS_CURSE) and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 2
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Ronan'] = quest:progressEvent(82),

            onEventFinish =
            {
                [82] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Ronan'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, { { invaderXim.item.SHELL_BUG, 3 } }) and
                        quest:getVar(player, 'Prog') == 0
                    then
                        return quest:progressEvent(84)
                    end
                end,

                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        if not quest:getMustZone(player) then
                            return quest:progressEvent(86)
                        else
                            return quest:event(85)
                        end
                    else
                        return quest:messageName(portBastokID.text.RONAN_DIALOG_1)
                    end
                end,
            },

            ['Mine_Konte'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:event(83)
                    end
                end,
            },

            ['Panana'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:event(83)
                    end
                end,
            },

            onEventFinish =
            {
                [84] = function(player, csid, option, npc)
                    player:confirmTrade()

                    quest:setVar(player, 'Prog', 1)
                    quest:setMustZone(player)
                end,

                [86] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Corann'] = quest:event(88):replaceDefault(),
            ['Ronan']  = quest:event(89):replaceDefault(),
        },
    },
}

return quest
