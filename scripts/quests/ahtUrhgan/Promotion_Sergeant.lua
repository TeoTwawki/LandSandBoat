-----------------------------------
-- Promotion: Sergeant
-- Log ID: 6, Quest ID: 94
-- Naja Salaheem      : !pos 26 -8 -45.5 50
-- Region 10 Whitegate: !pos -80 0 0 50
-- Region 1 Nashmau   : !pos 0 0 -40 53
-- Totoroon           : !pos -13 0 -24 53
-- qm11               : !pos 195 2 -616 79
-----------------------------------
local whitegateID = zones[invaderXim.zone.AHT_URHGAN_WHITEGATE]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.PROMOTION_SERGEANT)

quest.reward =
{
    keyItem = invaderXim.ki.S_WILDCAT_BADGE,
    title   = invaderXim.title.SERGEANT,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and player:getCharVar('AssaultPromotion') >= 25 and
            player:getQuestStatus(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.PROMOTION_CORPORAL) == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5055),

            onEventFinish =
            {
                [5055] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog == 0
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5058):oncePerZone(),

            onTriggerAreaEnter =
            {
                [10] = function(player, triggerArea)
                    return quest:progressEvent(5056)
                end,
            },

            onEventFinish =
            {
                [5056] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog == 1
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5058):oncePerZone(),
        },

        [invaderXim.zone.NASHMAU] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    if VanadielUniqueDay() > quest:getVar(player, 'Stage') then
                        return quest:progressEvent(303)
                    end
                end,
            },

            onEventFinish =
            {
                [303] = function(player, csid, option, npc)
                    if option == 2 then
                        quest:setVar(player, 'Prog', 2)
                    else
                        quest:setVar(player, 'Stage', VanadielUniqueDay() + 1)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog == 2
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5058):oncePerZone(),
        },

        [invaderXim.zone.NASHMAU] =
        {
            ['Totoroon'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.BOWL_OF_SUTLAC) then
                        return quest:progressEvent(304)
                    end
                end,

                onTrigger = function(player, npc)
                    return quest:event(252)
                end,
            },

            onEventFinish =
            {
                [304] = function(player, csid, option, npc)
                    player:confirmTrade()
                    quest:setVar(player, 'Prog', 3)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog == 3
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5058):oncePerZone(),
        },

        [invaderXim.zone.CAEDARVA_MIRE] =
        {
            ['qm11'] = quest:progressEvent(20),

            onEventFinish =
            {
                [20] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 4)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog == 4
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = quest:progressEvent(5057),

            onEventFinish =
            {
                [5057] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:setCharVar('AssaultPromotion', 0)
                        player:messageSpecial(whitegateID.text.PROMOTION_SERGEANT)
                        player:delKeyItem(invaderXim.ki.C_WILDCAT_BADGE)
                    end
                end,
            },
        },
    },
}

return quest
