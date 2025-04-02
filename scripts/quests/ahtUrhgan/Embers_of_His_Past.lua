-----------------------------------
-- Embers of His Past
-- Logid: 6 Questid: 48
-- Fari-Wari          : !pos 80 -6 -137 50
-- Sprightly Footsteps: !pos 822 -18 176 61
-- Withered Petals    : !pos 857 -14 248 61
-----------------------------------
local wajaomID  = zones[invaderXim.zone.WAJAOM_WOODLANDS]
local whitegateID = zones[invaderXim.zone.AHT_URHGAN_WHITEGATE]

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.EMBERS_OF_HIS_PAST)

quest.reward =
{
    item  = invaderXim.item.IMPERIAL_GOLD_PIECE,
    title = invaderXim.title.FLAMESERPENT_FACILITATOR
}

quest.sections =
{

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
            player:getQuestStatus(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.SOOTHING_WATERS) == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] = quest:progressEvent(916, { text_table = 0 }),

            onEventFinish =
            {
                [916] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                    quest:begin(player)
                    player:setPos(0, 0, 0, 0, invaderXim.zone.WAJAOM_WOODLANDS)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 1
        end,

        [invaderXim.zone.WAJAOM_WOODLANDS] =
        {
            onZoneIn = function(player, prevZone)
                return 16
            end,

            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                    player:setPos(0, 0, 0, 0, invaderXim.zone.WAJAOM_WOODLANDS)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 2
        end,

        [invaderXim.zone.WAJAOM_WOODLANDS] =
        {
            onZoneIn = function(player, prevZone)
                return 17
            end,

            onEventFinish =
            {
                [17] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                    player:setPos(80, -6, -123, 55, invaderXim.zone.AHT_URHGAN_WHITEGATE)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 3
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] = quest:event(917),
        },

        [invaderXim.zone.MOUNT_ZHAYOLM] =
        {
            ['Sprightly_Footsteps'] =
            {
                onTrigger = function(player, npc)
                    if VanadielHour() >= 18 or VanadielHour() <= 6 then
                        return quest:progressCutscene(15)
                    end
                end,
            },

            onEventFinish =
            {
                [15] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 4)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 4
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] = quest:event(917),
        },

        [invaderXim.zone.MOUNT_ZHAYOLM] =
        {
            ['Withered_Petals'] =
            {
                onTrigger = function(player, npc)
                    if VanadielHour() >= 18 or VanadielHour() <= 6 then
                        return quest:progressCutscene(16)
                    end
                end,
            },

            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 5)
                    player:setPos(141.740, -2, 0, 132, invaderXim.zone.AHT_URHGAN_WHITEGATE)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 5
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.HYDRANGEA) then
                        return quest:progressEvent(918, { text_table = 0 })
                    end
                end,

                onTrigger = function(player, npc)
                    return quest:event(924)
                end,
            },
            onEventFinish =
            {
                [918] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 6)
                    player:setPos(0, 0, 0, 0, invaderXim.zone.WAJAOM_WOODLANDS)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 6
        end,

        [invaderXim.zone.WAJAOM_WOODLANDS] =
        {
            onZoneIn = function(player, prevZone)
                return 18
            end,

            onEventFinish =
            {
                [18] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 7)
                    player:setPos(0, 0, 0, 0, invaderXim.zone.WAJAOM_WOODLANDS)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 7
        end,

        [invaderXim.zone.WAJAOM_WOODLANDS] =
        {
            onZoneIn = function(player, prevZone)
                return 19
            end,

            onEventFinish =
            {
                [19] = function(player, csid, option, npc)
                    player:messageSpecial(wajaomID.text.ITEM_RETURNED, invaderXim.item.HYDRANGEA)
                    quest:setVar(player, 'Prog', 8)
                    player:timer(1000, function(playerArg)
                        playerArg:setPos(80, -6, -123, 55, invaderXim.zone.AHT_URHGAN_WHITEGATE)
                    end)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 8
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] = quest:event(919),
        },

        [invaderXim.zone.MOUNT_ZHAYOLM] =
        {
            ['Withered_Petals'] =
            {
                onTrade = function(player, npc, trade)
                    if VanadielHour() >= 18 or VanadielHour() <= 6 then
                        if npcUtil.tradeHasExactly(trade, invaderXim.item.HYDRANGEA) then
                            return quest:progressCutscene(17)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [17] = function(player, csid, option, npc)
                    player:confirmTrade()
                    player:startCutscene(18)
                end,

                [18] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 9)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            vars.Prog == 9
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] = quest:progressEvent(920, { text_table = 0 }),

            onEventFinish =
            {
                [920] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:addCurrency('imperial_standing', 500)
                        player:messageSpecial(whitegateID.text.BESIEGED_OFFSET)
                        player:needToZone(true)
                        quest:setVar(player, 'Option', 1)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
            not player:needToZone()
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Option') == 1 then
                        return quest:progressEvent(921, { text_table = 0 })
                    else
                        return quest:event(923, { text_table = 0 }):replaceDefault()
                    end
                end,
            },

            onEventFinish =
            {
                [921] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.MERCENARY_CAMP_ENTRY_SLIP) then
                        quest:setVar(player, 'Option', 0)
                    end
                end,
            },
        },
    },
}

return quest
