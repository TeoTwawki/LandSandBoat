-----------------------------------
-- Cid's Secret
-----------------------------------
-- Log ID: 1, Quest ID: 26
-- Cid   : !pos -12 -12 1 237
-- Hilda : !pos -163 -8 13 236
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.CIDS_SECRET)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.RAM_MANTLE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 4
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Cid'] = quest:progressEvent(507),

            onEventFinish =
            {
                [507] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Cid'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.UNFINISHED_LETTER) then
                        return quest:progressEvent(509)
                    elseif quest:getVar(player, 'Prog') == 1 then
                        return quest:event(508):importantEvent()
                    else
                        return quest:event(502):importantEvent()
                    end
                end,
            },

            onEventFinish =
            {
                [509] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.UNFINISHED_LETTER)
                    end
                end,
            },
        },

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Hilda'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, invaderXim.item.ROLANBERRY_874_CE) and
                        quest:getVar(player, 'Prog') == 1
                    then
                        return quest:progressEvent(133)
                    end
                end,

                onTrigger = quest:progressEvent(132),
            },

            onEventFinish =
            {
                [132] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [133] = function(player, csid, option, npc)
                    player:confirmTrade()

                    npcUtil.giveKeyItem(player, invaderXim.ki.UNFINISHED_LETTER)
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
            ['Hilda'] = quest:event(49):replaceDefault(),
        },
    },
}

return quest
