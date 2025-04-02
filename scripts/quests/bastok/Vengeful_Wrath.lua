-----------------------------------
-- Vengeful Wrath
-----------------------------------
-- Log ID: 1, Quest ID: 32
-- Goraow : !pos 38 .1 14 234
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.VENGEFUL_WRATH)

quest.reward =
{
    fameArea = invaderXim.fameArea.BASTOK,
    gil      = 900,
    title    = invaderXim.title.AVENGER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 3
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Goraow'] = quest:progressEvent(106),

            onEventFinish =
            {
                [106] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Goraow'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.QUADAV_HELM) then
                        return quest:progressEvent(107)
                    end
                end,
            },

            onEventFinish =
            {
                [107] = function(player, csid, option, npc)
                    player:confirmTrade()

                    if player:getQuestStatus(quest.areaId, quest.questId) == invaderXim.questStatus.QUEST_ACCEPTED then
                        player:addFame(invaderXim.fameArea.BASTOK, 112)
                    end

                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
