-----------------------------------
-- Flower Child
-----------------------------------
-- Log ID: 2, Quest ID: 65
-- Ojha Rhawash : !pos -209 0 -134 239
-----------------------------------
local windurstWallsID = zones[invaderXim.zone.WINDURST_WALLS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.FLOWER_CHILD)

quest.reward =
{
    fame     = 120,
    fameArea = invaderXim.fameArea.WINDURST,
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

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Ojha_Rhawash'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.LILAC) then
                        return quest:progressEvent(10000, 0, 239, 2)
                    elseif isTradeInTable(trade, flowerItems) then
                        return quest:progressEvent(10000, 0, 239, 1)
                    else
                        return quest:progressEvent(10000, 0, 239, 0)
                    end
                end,

                onTrigger = quest:progressEvent(10000, 0, 239, 10),
            },

            onEventFinish =
            {
                [10000] = function(player, csid, option, npc)
                    -- Three possible event options are returned from the above triggers:
                    -- 0    : Invalid Item was traded
                    -- 1    : Valid Item was traded
                    -- 10   : Cancel/Exit event option.
                    -- 3002 : Lilac was traded

                    -- Correct trade option (Lilac).
                    if option == 3002 then
                        if quest:complete(player) then
                            player:confirmTrade()
                            local mhflag = player:getMoghouseFlag()
                            player:setMoghouseFlag(mhflag + 0x0004)
                            player:messageSpecial(windurstWallsID.text.MOGHOUSE_IXIMT)
                        end

                    else
                        -- Confirm trade if there was a trade.
                        if option == 1 then
                            player:confirmTrade()
                        end

                        -- Start quest if it wasn't.
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

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Ojha_Rhawash'] =
            {
                onTrade = function(player, npc, trade)
                    -- NOTE: After completing this quest, trade is not consumed.

                    if npcUtil.tradeHasExactly(trade, invaderXim.item.LILAC) then
                        return quest:progressEvent(10000, 0, 239, 4)
                    elseif isTradeInTable(trade, flowerItems) then
                        return quest:progressEvent(10000, 0, 239, 5)
                    else
                        return quest:progressEvent(10000, 0, 239, 0)
                    end
                end,

                onTrigger = quest:progressEvent(10000, 0, 239, 10),
            },
        },
    },
}

return quest
