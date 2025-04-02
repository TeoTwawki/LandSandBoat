-----------------------------------
-- The Seamstress
-----------------------------------
-- Log ID: 0, Quest ID: 5
-- Hanaa Punaa : !pos -179.726 -8.8 27.574 230
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_SEAMSTRESS)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.SANDORIA,
    -- Repeatable Items handled within the Trigger:
    -- item = invaderXim.item.LEATHER_GLOVES,
    -- title = invaderXim.title.SILENCER_OF_THE_LAMBS,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Hanaa_Punaa'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 0 then
                        return quest:progressEvent(528)
                    elseif questProgress == 1 then
                        return quest:progressEvent(531)
                    end
                end,
            },

            onEventFinish =
            {
                [528] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    else
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [531] = function(player, csid, option, npc)
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
            ['Hanaa_Punaa'] = quest:progressEvent(529),
        },
    },

    -- These functions check the status of ~= invaderXim.questStatus.QUEST_AVAILABLE to support repeating
    -- the quest.  Does not have to be flagged again to complete an additional time.
    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Hanaa_Punaa'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.SHEEPSKIN, 3 } }) then
                        return quest:progressEvent(530)
                    end
                end,
            },

            onEventFinish =
            {
                [530] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.LEATHER_GLOVES, { fromTrade = true }) then
                        player:confirmTrade()
                        player:addTitle(invaderXim.title.SILENCER_OF_THE_LAMBS)
                        if not player:hasCompletedQuest(quest.areaId, quest.questId) then
                            quest:complete(player)
                        else
                            player:addFame(invaderXim.fameArea.SANDORIA, 5)
                        end
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and player:getFameLevel(invaderXim.fameArea.SANDORIA) < 2
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Hanaa_Punaa'] = quest:event(590):replaceDefault()
        },
    },
}

return quest
