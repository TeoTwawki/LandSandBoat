-----------------------------------
-- Her Majestys Garden
-----------------------------------
-- Log ID: 0, Quest ID: 62
-----------------------------------
-- Chalvatot : !pos -105 0.1 72 233
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.HER_MAJESTYS_GARDEN)

quest.reward =
{
    keyItem = invaderXim.ki.MAP_OF_THE_NORTHLANDS_AREA,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 4
        end,

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Chalvatot'] = quest:progressEvent(84),

            onEventFinish =
            {
                [84] = function(player, csid, option, npc)
                    if option == 1 then
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

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Chalvatot'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHas(trade, invaderXim.item.CHUNK_OF_DERFLAND_HUMUS) then
                        return quest:progressEvent(83)
                    end
                end,

                onTrigger = quest:event(82),
            },

            onEventFinish =
            {
                [83] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
