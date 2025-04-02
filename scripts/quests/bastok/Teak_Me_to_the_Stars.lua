-----------------------------------
-- Teak Me to the Stars
-----------------------------------
-- Log ID: 1, Quest ID: 79
-- Raibaht : !gotoid 17748012
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TEAK_ME_TO_THE_STARS)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.BASTOK,
    gil      = 2100,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 3
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Raibaht'] =
            {
                onTrigger = function(player, npc)
                    local option = 0
                    if player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_CALL_OF_THE_WYRMKING) then
                        option = 2 -- additional dialogue regarding Crystal propulsion unit and hooded scientists as mentioned in cop wyrmking mission
                    end

                    return quest:progressEvent(864, 0, invaderXim.item.GARHADA_TEAK_LUMBER, 0, 0, 0, 0, option)
                end,
            },

            onEventFinish =
            {
                [864] = function(player, csid, option, npc)
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
            ['Raibaht'] =
            {
                onTrigger = function(player, npc)
                    -- Cycle between event 871 and default 501
                    return quest:event(871, 0, invaderXim.item.GARHADA_TEAK_LUMBER):setPriority(10)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.GARHADA_TEAK_LUMBER) then
                        return quest:event(865)
                    end
                end,
            },

            onEventFinish =
            {
                [865] = function(player, csid, option, npc)
                    player:confirmTrade()
                    invaderXim.quest.setMustZone(player, invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.HYPER_ACTIVE)
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
