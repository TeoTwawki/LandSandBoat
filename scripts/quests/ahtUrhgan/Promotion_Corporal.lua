-----------------------------------
-- Promotion: Corporal
-- Naja Salaheem !pos 26 -8 -45.5 50
-- LogID: 6 QuestID: 93
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.PROMOTION_CORPORAL)

quest.reward =
{
    keyItem = invaderXim.ki.C_WILDCAT_BADGE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
            player:getCharVar('AssaultPromotion') >= 25 and
            player:getQuestStatus(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.PROMOTION_LANCE_CORPORAL) == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5045, { text_table = 0 }),

            onEventFinish =
            {
                [5045] = function(player, csid, option, npc)
                    quest:begin(player)
                    npcUtil.giveKeyItem(player, invaderXim.ki.QUARTZ_TRANSMITTER)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            player:hasKeyItem(invaderXim.ki.QUARTZ_TRANSMITTER)
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5047, { text_table = 0 }):oncePerZone(),
        },

        [invaderXim.zone.BHAFLAU_THICKETS] =
        {
            ['Warhorse_Hoofprint'] =
            {
                onTrigger = function(player, npc)
                    player:delKeyItem(invaderXim.ki.QUARTZ_TRANSMITTER)
                    quest:setVar(player, 'Prog', 2)
                    return quest:messageSpecial(zones[player:getZoneID()].text.WARHORSE_HOOFPRINT + 1, invaderXim.ki.QUARTZ_TRANSMITTER)
                end,
            },
        },
        [invaderXim.zone.CAEDARVA_MIRE] =
        {
            ['Warhorse_Hoofprint'] =
            {
                onTrigger = function(player, npc)
                    player:delKeyItem(invaderXim.ki.QUARTZ_TRANSMITTER)
                    quest:setVar(player, 'Prog', 4)
                    return quest:messageSpecial(zones[player:getZoneID()].text.WARHORSE_HOOFPRINT + 1, invaderXim.ki.QUARTZ_TRANSMITTER)
                end,
            },
        },
        [invaderXim.zone.MOUNT_ZHAYOLM] =
        {
            ['Warhorse_Hoofprint'] =
            {
                onTrigger = function(player, npc)
                    player:delKeyItem(invaderXim.ki.QUARTZ_TRANSMITTER)
                    quest:setVar(player, 'Prog', 3)
                    return quest:messageSpecial(zones[player:getZoneID()].text.WARHORSE_HOOFPRINT + 1, invaderXim.ki.QUARTZ_TRANSMITTER)
                end,
            },
        },
        [invaderXim.zone.WAJAOM_WOODLANDS] =
        {
            ['Warhorse_Hoofprint'] =
            {
                onTrigger = function(player, npc)
                    player:delKeyItem(invaderXim.ki.QUARTZ_TRANSMITTER)
                    quest:setVar(player, 'Prog', 1)
                    return quest:messageSpecial(zones[player:getZoneID()].text.WARHORSE_HOOFPRINT + 1, invaderXim.ki.QUARTZ_TRANSMITTER)
                end,
            },
        },

    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
            not player:hasKeyItem(invaderXim.ki.QUARTZ_TRANSMITTER)
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] =
            {
                onTrigger = function(player, npc)
                    local hoofprintZone = quest:getVar(player, 'Prog')
                    return quest:progressEvent(5046, { [0] = hoofprintZone, text_table = 0 })
                end,
            },

            onEventFinish =
            {
                [5046] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:setVar('AssaultPromotion', 0)
                        player:delKeyItem(invaderXim.ki.LC_WILDCAT_BADGE)
                    end
                end,
            },
        },
    },
}

return quest
