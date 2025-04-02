-----------------------------------
-- The Gift
-----------------------------------
-- Log ID: 4, Quest ID: 21
-- !addquest 4 21
-- !additem 4375
-- Oswald  : !pos 47.119 -15.273 7.989 248
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_GIFT)

quest.reward =
{
    item     = invaderXim.item.SLEEP_DAGGER,
    title    = invaderXim.title.SAVIOR_OF_LOVE,
    fameArea = invaderXim.fameArea.SELBINA_RABAO,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.UNDER_THE_SEA) == invaderXim.questStatus.QUEST_COMPLETED and
                player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_SAND_CHARM) >= invaderXim.questStatus.QUEST_ACCEPTED and
                invaderXim.settings.map.FISHING_ENABLE == true
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Oswald'] = quest:progressEvent(70, invaderXim.item.DANCESHROOM), -- Girlfriend needs a shroom

            onEventFinish =
            {
                [70] = function(player, csid, option, npc)
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
                    return quest:event(71) -- They are really hard to come by
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.DANCESHROOM) then
                        return quest:progressEvent(72, 0, invaderXim.item.DANCESHROOM) -- You found it! Please take this reward
                    end
                end,
            },

            onEventFinish =
            {
                [72] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_REAL_GIFT) == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Oswald'] = quest:progressEvent(78):replaceDefault(),
            -- I've been all over Vana'diel, but the inn is my favorite.
        },
    },
}

return quest
