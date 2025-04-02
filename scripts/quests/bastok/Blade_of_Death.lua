-----------------------------------
-- Blade of Death
-----------------------------------
-- Log ID: 1, Quest ID: 47
-- Gumbah : !pos 52 0 -36 234
-- qm2    : !pos 206 -60 -101 196
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BLADE_OF_DEATH)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.DEATHBRINGER,
    title    = invaderXim.title.BLACK_DEATH,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BLADE_OF_DARKNESS) and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 3
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Gumbah'] = quest:progressEvent(130),

            onEventFinish =
            {
                [130] = function(player, csid, option, npc)
                    quest:begin(player)
                    npcUtil.giveKeyItem(player, invaderXim.ki.LETTER_FROM_ZEID)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ZERUHN_MINES] =
        {
            onZoneIn = function(player, prevZone)
                if
                    prevZone == invaderXim.zone.PALBOROUGH_MINES and
                    not player:hasItem(invaderXim.item.CHAOSBRINGER)
                then
                    return 131
                end
            end,

            onEventFinish =
            {
                [131] = function(player, csid, option, npc)
                    npcUtil.giveItem(player, invaderXim.item.CHAOSBRINGER)
                end,
            },
        },

        [invaderXim.zone.GUSGEN_MINES] =
        {
            ['qm2'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, invaderXim.item.CHAOSBRINGER) and
                        player:getCharVar('ChaosbringerKills') >= 200
                    then
                        return quest:progressEvent(10)
                    end
                end,
            },

            onEventFinish =
            {
                [10] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        player:delKeyItem(invaderXim.ki.LETTER_FROM_ZEID)
                    end
                end,
            },
        },
    },
}

return quest
