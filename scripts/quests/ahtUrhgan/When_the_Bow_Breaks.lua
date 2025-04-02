-----------------------------------
-- When the Bow Breaks
-----------------------------------
-- Log ID: 6, Quest ID: 45
-- Gaweesh: !pos -64 -7 38 48
-- Giwahb Watchtower: !pos -339 -37 654 51
-----------------------------------
local ID = zones[invaderXim.zone.WAJAOM_WOODLANDS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.WHEN_THE_BOW_BREAKS)

quest.reward =
{
    title = invaderXim.title.GALESERPENT_GUARDIAN,
}

quest.sections =
{

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
            player:hasCompletedQuest(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.ODE_TO_THE_SERPENTS)
        end,

        [invaderXim.zone.AL_ZAHBI] =
        {
            ['Gaweesh'] = quest:progressEvent(280),

            onEventFinish =
            {
                [280] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WAJAOM_WOODLANDS] =
        {
            ['Giwahb_Watchtower'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.FRAYED_ARROW) then
                        return quest:progressEvent(512)
                    end
                end,
            },

            onEventFinish =
            {
                [512] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        player:messageSpecial(ID.text.INCREASED_STANDING)
                        player:addCurrency('imperial_standing', 500)
                    end
                end,
            },
        },
    },
}

return quest
