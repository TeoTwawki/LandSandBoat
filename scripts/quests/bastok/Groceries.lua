-----------------------------------
-- Groceries
-----------------------------------
-- Log ID: 1, Quest ID: 37
-- Tami   : !pos 62.617 0 -68.222 234
-- Zelman : !pos 17.095 7.704 -52.995 172
-----------------------------------
local bastokMinesID = zones[invaderXim.zone.BASTOK_MINES]
local zeruhnMinesID = zones[invaderXim.zone.ZERUHN_MINES]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.GROCERIES)

quest.reward =
{
    fame     = 75,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.RABBIT_MANTLE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE or
                (status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog == 0)
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Tami'] = quest:progressEvent(110),

            onEventFinish =
            {
                [110] = function(player, csid, option, npc)
                    quest:begin(player)

                    npcUtil.giveKeyItem(player, invaderXim.ki.TAMIS_NOTE)
                    quest:setVar(player, 'Prog', 1)
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
            ['Tami'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, invaderXim.item.STRIP_OF_MEAT_JERKY) and
                        quest:getVar(player, 'Prog') == 3
                    then
                        return quest:progressEvent(113)
                    end
                end,

                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 1 then
                        return quest:messageName(bastokMinesID.text.TAMI_MY_HUSBAND)
                    elseif questProgress == 2 then
                        return quest:progressEvent(112)
                    elseif questProgress == 3 then
                        return quest:event(111)
                    end
                end,
            },

            onEventFinish =
            {
                [112] = function(player, csid, option, npc)
                    player:addFame(invaderXim.fameArea.BASTOK, 8)
                    npcUtil.giveCurrency(player, 'gil', 10)

                    quest:setVar(player, 'Prog', 0)
                end,

                [113] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },

        [invaderXim.zone.ZERUHN_MINES] =
        {
            ['Zelman'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 1 then
                        if player:seenKeyItem(invaderXim.ki.TAMIS_NOTE) then
                            return quest:progressEvent(162)
                        else
                            return quest:progressEvent(161)
                        end
                    elseif questProgress >= 2 then
                        return quest:messageName(zeruhnMinesID.text.ZELMAN_CANT_RUN_AROUND)
                    end
                end,
            },

            onEventFinish =
            {
                [161] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                    player:delKeyItem(invaderXim.ki.TAMIS_NOTE)
                end,

                [162] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                    player:delKeyItem(invaderXim.ki.TAMIS_NOTE)
                end,
            },
        },
    },
}

return quest
