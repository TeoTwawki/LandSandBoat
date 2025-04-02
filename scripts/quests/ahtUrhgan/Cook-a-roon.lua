-----------------------------------
-- Cook-a-roon
-- Ququroon !pos -2.400 -1 66.824 53
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.COOK_A_ROON)

quest.sections =
{
    -- Setion: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.NASHMAU] =
        {
            ['Ququroon'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(241)
                end,
            },

            onEventFinish =
            {
                [241] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.NASHMAU] =
        {
            ['Ququroon'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(242)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { invaderXim.item.AHTAPOT, invaderXim.item.ISTAKOZ, invaderXim.item.ISTAVRIT, invaderXim.item.ISTIRIDYE, invaderXim.item.MERCANBALIGI }) then
                        quest:setVar(player, 'Prog', math.random(2, 3))
                        return quest:progressEvent(243, { [7] = quest:getVar(player, 'Prog') })
                    end
                end,
            },

            onEventFinish =
            {
                [243] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        npcUtil.giveItem(player, invaderXim.item.BOWL_OF_NASHMAU_STEW)
                    end

                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },

    -- Section: Quest complete
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.NASHMAU] =
        {
            ['Ququroon'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { invaderXim.item.AHTAPOT, invaderXim.item.ISTAKOZ, invaderXim.item.ISTAVRIT, invaderXim.item.ISTIRIDYE, invaderXim.item.MERCANBALIGI }) then
                        quest:setVar(player, 'Prog', math.random(2, 3))
                        return quest:progressEvent(243, { [7] = quest:getVar(player, 'Prog') })
                    end
                end,

                onTrigger = function(player, npc)
                    return quest:event(244)
                end,
            },

            onEventUpdate =
            {
                [243] = function(player, csid, option, npc)
                    player:confirmTrade()
                    if quest:getVar(player, 'Prog') == 2 then
                        npcUtil.giveItem(player, invaderXim.item.BOWL_OF_NASHMAU_STEW)
                    end

                    quest:setVar(player, 'Prog', 0)
                end,
            },
        },
    },
}

return quest
