-----------------------------------
-- Mom, the Adventurer?
-----------------------------------
-- Log ID: 1, Quest ID: 21
-- Nbu Latteh : !pos -114.777 -4 -113.301 235
-- Roh Latteh : !pos -11.823 6.999 -9.249 234
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.MOM_THE_ADVENTURER)

quest.reward =
{
    fame     = 20,
    fameArea = invaderXim.fameArea.BASTOK,
    title    = invaderXim.title.RINGBEARER,
}

local handleEventFinish = function(player, csid, option, npc)
    if quest:complete(player) then
        local gilReward = csid == 233 and 200 or 100

        player:delKeyItem(invaderXim.ki.LETTER_FROM_ROH_LATTEH)
        npcUtil.giveCurrency(player, 'gil', gilReward)
        quest:setMustZone(player)
    end
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_ACCEPTED and
                vars.Prog == 0
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Nbu_Latteh'] = quest:progressEvent(230),

            onEventFinish =
            {
                [230] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.FIRE_CRYSTAL) then
                        quest:setVar(player, 'Prog', 1)

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
            return status ~= invaderXim.questStatus.QUEST_AVAILABLE and
                vars.Prog == 1
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Nbu_Latteh'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.LETTER_FROM_ROH_LATTEH) then
                        if player:seenKeyItem(invaderXim.ki.LETTER_FROM_ROH_LATTEH) then
                            return quest:progressEvent(234)
                        else
                            return quest:progressEvent(233)
                        end
                    else
                        return quest:event(231)
                    end
                end,
            },

            onEventFinish =
            {
                [233] = handleEventFinish,
                [234] = handleEventFinish,
            },
        },

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Roh_Latteh'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, invaderXim.item.COPPER_RING) and
                        not player:hasKeyItem(invaderXim.ki.LETTER_FROM_ROH_LATTEH)
                    then
                        return quest:progressEvent(95)
                    end
                end,
            },

            onEventFinish =
            {
                [95] = function(player, csid, option, npc)
                    player:confirmTrade()

                    npcUtil.giveKeyItem(player, invaderXim.ki.LETTER_FROM_ROH_LATTEH)
                end,
            },
        },
    },
}

return quest
