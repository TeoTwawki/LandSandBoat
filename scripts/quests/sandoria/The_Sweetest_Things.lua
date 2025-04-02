-----------------------------------
-- The Sweetest Things
-----------------------------------
-- Log ID: 0, Quest ID: 8
-- Raimbroy : !pos -141 -3 34.6 230
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_SWEETEST_THINGS)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.SANDORIA,
    title    = invaderXim.title.APIARIST,
}

local raimbroyOnTrade = function(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.POT_OF_HONEY, 5 } }) then
        return quest:progressEvent(535, 400 * invaderXim.settings.main.GIL_RATE)
    else
        return quest:event(522)
    end
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 2
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Raimbroy'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 0 then
                        return quest:event(532)
                    elseif questProgress == 1 then
                        return quest:event(533)
                    elseif questProgress == 2 then
                        return quest:event(534)
                    end
                end,
            },

            onEventFinish =
            {
                [532] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,

                [533] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    else
                        quest:setVar(player, 'Prog', 2)
                    end
                end,

                [534] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Raimbroy'] =
            {
                onTrade   = raimbroyOnTrade,
                onTrigger = quest:event(536),
            },

            onEventFinish =
            {
                [535] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        -- Note: Gil is mentioned in the event, so add silently here.  Also,
                        -- we need to implement a latch, since both event finishes will trigger
                        -- after the complete.

                        player:addGil(400 * invaderXim.settings.main.GIL_RATE)
                        quest:setLocalVar(player, 'firstComplete', 1)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Raimbroy'] =
            {
                onTrade   = raimbroyOnTrade,
                onTrigger = quest:event(537),
            },

            onEventFinish =
            {
                [535] = function(player, csid, option, npc)
                    if quest:getLocalVar(player, 'firstComplete') == 0 then
                        player:confirmTrade()

                        player:addTitle(invaderXim.title.APIARIST)
                        player:addGil(400 * invaderXim.settings.main.GIL_RATE)
                        player:addFame(invaderXim.fameArea.SANDORIA, 5)
                    else
                        quest:setLocalVar(player, 'firstComplete', 0)
                    end
                end,
            },
        },
    },
}

return quest
