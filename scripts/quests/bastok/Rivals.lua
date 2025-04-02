-----------------------------------
-- Rivals
-----------------------------------
-- Log ID: 1, Quest ID: 20
-- Detzo : !pos 5.365 6.999 9.891 234
-----------------------------------
local bastokMinesID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.RIVALS)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.WOLF_GORGET,
    title    = invaderXim.title.CONTEST_RIGGER,
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
            ['Detzo'] = quest:progressEvent(93),

            onEventFinish =
            {
                [93] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Detzo'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.MYTHRIL_SALLET) then
                        return quest:progressEvent(94)
                    end
                end,

                onTrigger = quest:messageName(bastokMinesID.text.DETZO_RIVALS_DIALOG),
            },

            onEventFinish =
            {
                [94] = function(player, csid, option, npc)
                    -- TODO: Since Detzo 'borrows' the Mythril Sallet, need to verify if
                    -- a message is displayed for returning it (Obtained:, etc).

                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
