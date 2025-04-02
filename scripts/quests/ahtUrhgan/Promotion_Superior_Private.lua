-----------------------------------
-- Promotion: Superior Private
-- Log ID: 6, Quest ID: 91
-- Naja Salaheem !pos 26 -8 -45.5 50
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.PROMOTION_SUPERIOR_PRIVATE)

quest.reward =
{
    keyItem = invaderXim.ki.SP_WILDCAT_BADGE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and player:getCharVar('AssaultPromotion') >= 25 and
            player:getQuestStatus(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.PROMOTION_PRIVATE_FIRST_CLASS) == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5020, { text_table = 0 }),

            onEventFinish =
            {
                [5020] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and not player:hasKeyItem(invaderXim.ki.DARK_RIDER_HOOFPRINT)
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:event(5021, { text_table = 0 }),
        },

        [invaderXim.zone.BHAFLAU_THICKETS] =
        {
            ['Warhorse_Hoofprint'] = quest:keyItem(invaderXim.ki.DARK_RIDER_HOOFPRINT)
        },
        [invaderXim.zone.CAEDARVA_MIRE] =
        {
            ['Warhorse_Hoofprint'] = quest:keyItem(invaderXim.ki.DARK_RIDER_HOOFPRINT)
        },
        [invaderXim.zone.MOUNT_ZHAYOLM] =
        {
            ['Warhorse_Hoofprint'] = quest:keyItem(invaderXim.ki.DARK_RIDER_HOOFPRINT)
        },
        [invaderXim.zone.WAJAOM_WOODLANDS] =
        {
            ['Warhorse_Hoofprint'] = quest:keyItem(invaderXim.ki.DARK_RIDER_HOOFPRINT)
        },

    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and player:hasKeyItem(invaderXim.ki.DARK_RIDER_HOOFPRINT)
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5022, { text_table = 0 }),

            onEventFinish =
            {
                [5022] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:setCharVar('AssaultPromotion', 0)
                        player:delKeyItem(invaderXim.ki.PFC_WILDCAT_BADGE)
                        player:delKeyItem(invaderXim.ki.DARK_RIDER_HOOFPRINT)
                    end
                end,
            },
        },
    },
}

return quest
