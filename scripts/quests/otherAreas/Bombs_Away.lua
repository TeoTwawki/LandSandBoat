-----------------------------------
-- Bombs Away!
-----------------------------------
-- Log ID: 4, Quest ID: 96
-- Buffalostalker_Dodzbraz : !pos -380.171 -24.89 -180.797 5
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.BOMBS_AWAY)

quest.reward =
{
    item  = invaderXim.item.CHUNK_OF_SHUMEYO_SALT,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.ULEGUERAND_RANGE] =
        {
            ['Buffalostalker_Dodzbraz'] = quest:progressEvent(6),

            onEventFinish =
            {
                [6] = function(player, csid, option, npc)
                    if option == 1 then -- You climb mountain.
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.ULEGUERAND_RANGE] =
        {
            ['Buffalostalker_Dodzbraz'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(7)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.CLUSTER_CORE, 2 } }) then
                        return quest:progressEvent(8) -- Quest completed dialog.
                    end
                end,

            },

            onEventFinish =
            {
                [8] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:tradeComplete()
                    end
                end,
            },
        },
    },
}

return quest
