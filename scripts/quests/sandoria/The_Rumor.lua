-----------------------------------
-- The Rumor
-----------------------------------
-- Log ID: 0, Quest ID: 61
-----------------------------------
-- Novalmauge !pos 70 -24 21 167
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_RUMOR)

quest.reward =
{
    item = invaderXim.item.SCROLL_OF_DRAIN,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 3 and
                player:getMainLvl() >= 10
        end,

        [invaderXim.zone.BOSTAUNIEUX_OUBLIETTE] =
        {
            ['Novalmauge'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(13)
                end,
            },

            onEventFinish =
            {
                [13] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        }
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BOSTAUNIEUX_OUBLIETTE] =
        {
            ['Novalmauge'] =
            {
                onTrigger = quest:event(11),

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.VIAL_OF_BEASTMAN_BLOOD) then
                        return quest:progressEvent(12)
                    end
                end,
            },

            onEventFinish =
            {
                [12] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
    {
        check = function(player, status)
            return status == invaderXim.quest.status.COMPLETED
        end,

        [invaderXim.zone.BOSTAUNIEUX_OUBLIETTE] =
        {
            ['Novalmauge'] = quest:event(14):replaceDefault(),
        },
    },
}

return quest
