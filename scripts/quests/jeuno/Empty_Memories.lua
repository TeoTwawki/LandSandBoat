-----------------------------------
-- Empty Memories
-----------------------------------
-- !addquest 3 70
-- Harith : !pos -4.349 1 134.014 243
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.EMPTY_MEMORIES)

quest.reward =
{
    fame     = 5,
    fameArea = invaderXim.fameArea.JEUNO,
}

local rewardItems =
{
--  Awarded Item id                       Required Items for Trade
    [invaderXim.item.BOTTLE_OF_HYSTEROANIMA] = { tradeItem = invaderXim.item.RECOLLECTION_OF_PAIN,      gil = 2000 },
    [invaderXim.item.BOTTLE_OF_PSYCHOANIMA ] = { tradeItem = invaderXim.item.RECOLLECTION_OF_FEAR,      gil = 2000 },
    [invaderXim.item.BOTTLE_OF_TERROANIMA  ] = { tradeItem = invaderXim.item.RECOLLECTION_OF_GUILT,     gil = 2000 },
    [invaderXim.item.HAMAYUMI              ] = { tradeItem = invaderXim.item.RECOLLECTION_OF_SUFFERING, gil =  nil },
    [invaderXim.item.STONE_GORGET          ] = { tradeItem = invaderXim.item.RECOLLECTION_OF_ANXIETY,   gil =  nil },
    [invaderXim.item.DIA_WAND              ] = { tradeItem = invaderXim.item.RECOLLECTION_OF_ANIMOSITY, gil =  nil },
}

local memoriesOnEventFinish = function(player, csid, option, npc)
    local rewardItem = quest:getLocalVar(player, 'rewardItem')

    if npcUtil.giveItem(player, rewardItem) then
        player:confirmTrade()

        if rewardItems[rewardItem].gil then
            player:delGil(rewardItems[rewardItem].gil)
        end

        if player:getQuestStatus(quest.areaId, quest.questId) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:addFame(invaderXim.fameArea.JEUNO, 25)
        end

        quest:complete(player)
    end
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
            (player:getCurrentMission(invaderXim.mission.log_id.COP) > invaderXim.mission.id.cop.THE_MOTHERCRYSTALS or
            invaderXim.mission.getVar(player, invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_MOTHERCRYSTALS, 'Option') > 0)
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Harith'] = quest:progressEvent(113),

            onEventFinish =
            {
                [113] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status >= invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Harith'] =
            {
                onTrade = function(player, npc, trade)
                    for rewardItemId, requiredItems in pairs(rewardItems) do
                        if trade:hasItemQty(requiredItems.tradeItem, 1) then
                            if requiredItems.gil and trade:getGil() ~= requiredItems.gil then
                                return quest:event(108, requiredItems.gil)
                            end

                            local eventId = requiredItems.gil and 109 or 110

                            trade:confirmItem(requiredItems.tradeItem, 1)
                            quest:setLocalVar(player, 'rewardItem', rewardItemId)

                            return quest:progressEvent(eventId)
                        end
                    end
                end,

                onTrigger = quest:event(114),
            },

            onEventFinish =
            {
                [109] = memoriesOnEventFinish,
                [110] = memoriesOnEventFinish,
            },
        },
    },
}

return quest
