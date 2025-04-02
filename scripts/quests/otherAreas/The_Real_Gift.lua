-----------------------------------
-- The Real Gift
-----------------------------------
-- Log ID: 4, Quest ID: 22
-- !addquest 4 22
-- !additem 4484
-- Oswald  : !pos 47.119 -15.273 7.989 248
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_REAL_GIFT)

quest.reward =
{
    item     = invaderXim.item.GLASS_FIBER_FISHING_ROD,
    title    = invaderXim.title.THE_LOVE_DOCTOR,
    fameArea = invaderXim.fameArea.SELBINA_RABAO,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.UNDER_THE_SEA) == invaderXim.questStatus.QUEST_COMPLETED and
                player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_SAND_CHARM) >= invaderXim.questStatus.QUEST_COMPLETED and
                invaderXim.settings.map.FISHING_ENABLE == true
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Oswald'] = quest:progressEvent(73, invaderXim.item.SHALL_SHELL), -- Bring me a shall shell

            onEventFinish =
            {
                [73] = function(player, csid, option, npc)
                    if option == 50 then
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

        [invaderXim.zone.SELBINA] =
        {
            ['Oswald'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(74, invaderXim.item.SHALL_SHELL) -- Shall shells yield pearls
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.SHALL_SHELL) then
                        return quest:progressEvent(75) -- You're so fantastic! Thank you!
                    end
                end,
            },

            onEventFinish =
            {
                [75] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Oswald'] = quest:progressEvent(76):replaceDefault(),
            -- Thanks for all you've done.
        },
    },
}

return quest
