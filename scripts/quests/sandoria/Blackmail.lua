-----------------------------------
-- Blackmail
-----------------------------------
-- Log ID: 0, Quest ID: 71
-----------------------------------
-- Dauperiat : !pos -20 0 -26 231
-- Halver    : !pos 2 0 0 233
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_KNIGHTS_TEST)

quest.reward =
{
    gil = 900,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Dauperiat'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 3 and
                        player:getRank(player:getNation()) >= 3
                    then
                        return quest:progressEvent(643)
                    else
                        if player:needToZone() then
                            return quest:event(642)
                        else
                            return quest:event(641)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [641] = function(player, csid, option, npc)
                    player:needToZone(true)
                end,

                [643] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.SUSPICIOUS_ENVELOPE)
                    quest:begin(player)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                player:hasKeyItem(invaderXim.ki.SUSPICIOUS_ENVELOPE)
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Dauperiat'] = quest:event(645),
        },

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Halver'] = quest:progressEvent(549),

            onEventFinish =
            {
                [549] = function(player, csid, option, npc)
                    player:delKeyItem(invaderXim.ki.SUSPICIOUS_ENVELOPE)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                vars.Prog == 1
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Dauperiat'] = quest:progressEvent(646, { [1] = invaderXim.item.COPY_OF_THE_CASTLE_FLOOR_PLANS }),

            onEventFinish =
            {
                [646] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:setVar(player, 'Prog', 2)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                vars.Prog == 2
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Dauperiat'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHas(trade, invaderXim.item.COPY_OF_THE_CASTLE_FLOOR_PLANS) then
                        return quest:progressEvent(648, { [1] = invaderXim.item.COPY_OF_THE_CASTLE_FLOOR_PLANS })
                    end
                end,

                onTrigger = quest:event(647, { [1] = invaderXim.item.COPY_OF_THE_CASTLE_FLOOR_PLANS }),
            },

            onEventFinish =
            {
                [648] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                vars.Prog == 0
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Dauperiat'] = quest:progressEvent(650, { [1] = invaderXim.item.COPY_OF_THE_CASTLE_FLOOR_PLANS }),

            onEventFinish =
            {
                [650] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                vars.Prog == 1
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Dauperiat'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHas(trade, invaderXim.item.COPY_OF_THE_CASTLE_FLOOR_PLANS) then
                        return quest:progressEvent(648, { [1] = invaderXim.item.COPY_OF_THE_CASTLE_FLOOR_PLANS })
                    end
                end,

                onTrigger = quest:event(647, { [1] = invaderXim.item.COPY_OF_THE_CASTLE_FLOOR_PLANS }),
            },

            onEventFinish =
            {
                [648] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 0)
                    player:confirmTrade()
                    npcUtil.giveCurrency(player, 'gil', 900)
                    player:addFame(invaderXim.quest.fameArea.SANDORIA, 5)
                end,
            },
        },
    },
}

return quest
