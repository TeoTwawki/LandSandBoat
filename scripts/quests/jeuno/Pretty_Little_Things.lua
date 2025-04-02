-----------------------------------
-- Pretty Little Things
-----------------------------------
-- Log ID: 3, Quest ID: 43
-- Zona Shodhun : !pos -175 -5 -4 246
-----------------------------------
local portJeunoID = zones[invaderXim.zone.PORT_JEUNO]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.PRETTY_LITTLE_THINGS)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.JEUNO,
}

local invalidRocks =
{
    invaderXim.item.RED_ROCK,
    invaderXim.item.BLUE_ROCK,
    invaderXim.item.GREEN_ROCK,
    invaderXim.item.TRANSLUCENT_ROCK,
    invaderXim.item.PURPLE_ROCK,
    invaderXim.item.BLACK_ROCK,
    invaderXim.item.WHITE_ROCK,
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
}

local function isTradeInTable(trade, itemTable)
    for _, itemID in ipairs(itemTable) do
        if npcUtil.tradeHasExactly(trade, itemID) then
            return true
        end
    end

    return false
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE or status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PORT_JEUNO] =
        {
            -- Any trade or onTrigger flags this quest.  Default action is handled
            -- in the NPC script (onTrigger).  All valid items are consumed until
            -- quest is completed.
            ['Zona_Shodhun'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.YELLOW_ROCK) then
                        return quest:progressEvent(10023, 1, 246, 2, 1, 0, 1, 5, 1)
                    elseif isTradeInTable(trade, invalidRocks) then
                        return quest:progressEvent(10023, 0, 246, 1, 1, 0, 1, 7, 1)
                    elseif isTradeInTable(trade, flowerItems) then
                        return quest:progressEvent(10023, 0, 246, 1, 1, 1, 0, 7, 0)
                    else
                        return quest:progressEvent(10023, 0, 246, 0, 0, 0, 0, 7, 0)
                    end
                end,
            },

            onEventFinish =
            {
                [10023] = function(player, csid, option, npc)
                    -- Three possible event options are returned from the above triggers:
                    -- 0    : Invalid Item was traded
                    -- 1    : Valid Item was traded
                    -- 4002 : Yellow Rock was traded
                    if option > 0 then
                        player:confirmTrade()
                    end

                    if option == 4002 then
                        if quest:complete(player) then
                            player:confirmTrade()
                            local mhflag = player:getMoghouseFlag()
                            player:setMoghouseFlag(mhflag + 0x0008)
                            player:messageSpecial(portJeunoID.text.MOGHOUSE_IXIMT)
                        end
                    elseif player:getQuestStatus(quest.areaId, quest.questId) == invaderXim.questStatus.QUEST_AVAILABLE then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.PORT_JEUNO] =
        {
            ['Zona_Shodhun'] =
            {
                -- NOTE: No items are consumed after quest complete.
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.YELLOW_ROCK) then
                        return quest:progressEvent(10023, 0, 246, 4, 1, 0, 1, 7, 0)
                    elseif isTradeInTable(trade, invalidRocks) then
                        return quest:progressEvent(10023, 0, 246, 5, 1, 0, 1, 7, 0)
                    elseif isTradeInTable(trade, flowerItems) then
                        return quest:progressEvent(10023, 0, 246, 3, 1, 1, 0, 7, 0)
                    else
                        return quest:progressEvent(10023, 0, 246, 5, 0, 0, 0, 7, 0)
                    end
                end,
            },
        },
    },
}

return quest
