-----------------------------------
-- Rat Race
-----------------------------------
-- Log ID: 6, Quest ID: 66
-- Kakkaroon      : !pos 13.245 0.000 -25.307 53
-- Nadee Periyaha : !pos -10.802 0.000 -1.198 50
-- Cacaroon       : !pos -72.026 0.000 -82.337 50
-- Ququroon       : !pos -2.400 -1 66.824 53
-- Kyokyoroon     : !pos 18.020 -6.000 10.467 53
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.RAT_RACE)

quest.reward =
{
    item =
    {
        { invaderXim.item.IMPERIAL_GOLD_PIECE,    2 },
        { invaderXim.item.IMPERIAL_MYTHRIL_PIECE, 2 },
        { invaderXim.item.IMPERIAL_SILVER_PIECE,  3 },
    },
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.NASHMAU] =
        {
            ['Kakkaroon'] =
            {
                onTrigger = quest:progressEvent(308),
            },

            onEventFinish =
            {
                [308] = function(player, csid, option, npc)
                    quest:begin(player)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Nadee_Periyaha'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 1 then
                        return quest:progressEvent(849)
                    elseif questProgress == 2 then
                        return quest:event(851)
                    elseif questProgress >= 3 then
                        return quest:event(852)
                    end
                end,
            },

            ['Cacaroon'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        quest:getVar(player, 'Prog') == 2 and
                        npcUtil.tradeHas(trade, invaderXim.item.IMPERIAL_BRONZE_PIECE)
                    then
                        return quest:progressEvent(850)
                    end
                end,

                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 2 then
                        return quest:event(853)
                    elseif questProgress >= 3 then
                        return quest:event(854)
                    end
                end,
            },

            onEventFinish =
            {
                [849] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,

                [850] = function(player, csid, option, npc)
                    player:confirmTrade()
                    quest:setVar(player, 'Prog', 3)
                end,
            },
        },

        [invaderXim.zone.NASHMAU] =
        {
            ['Kakkaroon'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 6 then
                        return quest:progressEvent(312)
                    else
                        return quest:event(313)
                    end
                end,
            },

            ['Kyokyoroon'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        quest:getVar(player, 'Prog') == 5 and
                        npcUtil.tradeHasExactly(trade, invaderXim.item.BOWL_OF_NASHMAU_STEW)
                    then
                        return quest:progressEvent(311)
                    end
                end,

                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 6 then
                        return quest:event(316)
                    end
                end,
            },

            ['Ququroon'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        quest:getVar(player, 'Prog') == 4 and
                        npcUtil.tradeHasExactly(trade, { invaderXim.item.AHTAPOT, invaderXim.item.ISTAKOZ, invaderXim.item.ISTAVRIT, invaderXim.item.ISTIRIDYE, invaderXim.item.MERCANBALIGI })
                    then
                        return quest:progressEvent(310)
                    end
                end,

                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 3 then
                        return quest:progressEvent(309)
                    elseif questProgress == 4 then
                        return quest:event(242)
                    elseif questProgress >= 5 then
                        return quest:event(315)
                    end
                end,
            },

            onEventFinish =
            {
                [309] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 4)
                end,

                [310] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.BOWL_OF_NASHMAU_STEW) then
                        player:confirmTrade()
                        quest:setVar(player, 'Prog', 5)
                    end
                end,

                [311] = function(player, csid, option, npc)
                    player:confirmTrade()
                    quest:setVar(player, 'Prog', 6)
                end,

                [312] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },
    },

    -- Section: Quest completed
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.NASHMAU] =
        {
            ['Kakkaroon']  = quest:event(314),
            ['Kyokyoroon'] = quest:event(317),
        },
    },
}

return quest
