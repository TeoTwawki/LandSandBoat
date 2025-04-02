-----------------------------------
-- Growing Flowers
-----------------------------------
-- Log ID: 0, Quest ID: 58
-- Kuu Mohzolhi : !pos -123 0 80 231
-----------------------------------
local northenSandoriaID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.GROWING_FLOWERS)

quest.reward =
{
    fame     = 120,
    fameArea = invaderXim.fameArea.SANDORIA,
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

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Kuu_Mohzolhi'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.MARGUERITE) then
                        return quest:progressEvent(605, 0, 231, 2)
                    elseif isTradeInTable(trade, flowerItems) then
                        return quest:progressEvent(605, 0, 231, 1)
                    else
                        return quest:progressEvent(605, 0, 231, 0)
                    end
                end,

                onTrigger = quest:progressEvent(605, 0, 231, 10),
            },

            onEventFinish =
            {
                [605] = function(player, csid, option, npc)
                    -- Three possible event options are returned from the above triggers:
                    -- 0    : Invalid Item was traded
                    -- 1    : Valid Item was traded
                    -- 10   : Cancel/Exit event option.
                    -- 1002 : Marguerite was traded

                    -- Correct trade option (Marguerite).
                    if option == 1002 then
                        if quest:complete(player) then
                            player:confirmTrade()
                            local mhflag = player:getMoghouseFlag()
                            player:setMoghouseFlag(mhflag + 0x0001)
                            player:messageSpecial(northenSandoriaID.text.MOGHOUSE_IXIMT)
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

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Kuu_Mohzolhi'] =
            {
                onTrade = function(player, npc, trade)
                    -- NOTE: After completing this quest, trade is not consumed.

                    if npcUtil.tradeHasExactly(trade, invaderXim.item.MARGUERITE) then
                        return quest:progressEvent(605, 0, 231, 4)
                    elseif isTradeInTable(trade, flowerItems) then
                        return quest:progressEvent(605, 0, 231, 5)
                    else
                        return quest:progressEvent(605, 0, 231, 0)
                    end
                end,

                onTrigger = quest:progressEvent(605, 0, 231, 10),
            },
        },
    },
}

return quest
