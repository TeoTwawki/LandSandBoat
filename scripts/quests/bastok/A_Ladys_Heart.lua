-----------------------------------
-- A Lady's Heart
-----------------------------------
-- Log ID: 1, Quest ID: 50
-- Valah Molkot : !pos 59 8 -221 236
-----------------------------------
local portBastokID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.A_LADYS_HEART)

quest.reward =
{
    fame     = 120,
    fameArea = invaderXim.fameArea.BASTOK,
}

local flowerItems =
{
    invaderXim.item.AMARYLLIS,
    invaderXim.item.ASPHODEL,
    invaderXim.item.CARNATION,
    invaderXim.item.CASABLANCA,
    invaderXim.item.CATTLEYA,
    invaderXim.item.CHAMOMILE,
    invaderXim.item.DAHLIA,
    invaderXim.item.FLAX_FLOWER,
    invaderXim.item.LILAC,
    invaderXim.item.LYCOPODIUM_FLOWER,
    invaderXim.item.MARGUERITE,
    invaderXim.item.OLIVE_FLOWER,
    invaderXim.item.PAPAKA_GRASS,
    invaderXim.item.PHALAENOPSIS,
    invaderXim.item.RAIN_LILY,
    invaderXim.item.RED_ROSE,
    invaderXim.item.SNOW_LILY,
    invaderXim.item.SWEET_WILLIAM,
    invaderXim.item.TAHRONGI_CACTUS,
    invaderXim.item.WATER_LILY,
    invaderXim.item.WIJNRUIT,
}

local function isTradeInTable(trade, itemTable)
    for _, itemId in ipairs(itemTable) do
        if npcUtil.tradeHasExactly(trade, itemId) then
            return true
        end
    end

    return false
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Valah_Molkot'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.AMARYLLIS) then
                        return quest:progressEvent(160, 0, 236, 2)
                    elseif isTradeInTable(trade, flowerItems) then
                        return quest:progressEvent(160, 0, 236, 1)
                    else
                        return quest:progressEvent(160, 0, 236, 0)
                    end
                end,

                onTrigger = quest:progressEvent(160, 0, 236, 10),
            },

            onEventFinish =
            {
                [160] = function(player, csid, option, npc)
                    -- Three possible event options are returned from the above triggers:
                    -- 0    : Invalid Item was traded
                    -- 1    : Valid Item was traded
                    -- 10   : Cancel/Exit event option.
                    -- 2002 : Amaryllis was traded

                    -- Correct trade option (Amaryllis).
                    if option == 2002 then
                        if quest:complete(player) then
                            player:confirmTrade()
                            local mhflag = player:getMoghouseFlag()
                            player:setMoghouseFlag(mhflag + 0x0002)
                            player:messageSpecial(portBastokID.text.MOGHOUSE_IXIMT)
                        end

                    else
                        if option == 1 then
                            player:confirmTrade()
                        end

                        if player:getQuestStatus(quest.areaId, quest.questId) == invaderXim.questStatus.QUEST_AVAILABLE then
                            quest:begin(player)
                        end
                    end
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
            ['Valah_Molkot'] =
            {
                onTrade = function(player, npc, trade)
                    -- NOTE: After completing this quest, trade is not consumed.

                    if npcUtil.tradeHasExactly(trade, invaderXim.item.AMARYLLIS) then
                        return quest:progressEvent(160, 0, 236, 4)
                    elseif isTradeInTable(trade, flowerItems) then
                        return quest:progressEvent(160, 0, 236, 5)
                    else
                        return quest:progressEvent(160, 0, 236, 0)
                    end
                end,

                onTrigger = quest:progressEvent(160, 0, 236, 10),
            },
        },
    },
}

return quest
