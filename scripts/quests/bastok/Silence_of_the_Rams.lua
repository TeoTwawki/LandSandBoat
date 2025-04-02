-----------------------------------
-- Silence of the Rams
-----------------------------------
-- Log ID: 1, Quest ID: 48
-- Paujean : !pos -93.738 4.649 34.373 236
-----------------------------------
local portBastokID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.SILENCE_OF_THE_RAMS)

quest.reward =
{
    fame     = 125,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.PURPLE_BELT,
    title    = invaderXim.title.PURPLE_BELT,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.NORG) >= 2
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Paujean'] = quest:progressEvent(195),

            onEventFinish =
            {
                [195] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Paujean'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { invaderXim.item.LUMBERING_HORN, invaderXim.item.RAMPAGING_HORN }) then
                        return quest:progressEvent(196)
                    end
                end,

                onTrigger = quest:messageName(portBastokID.text.PAUJEAN_DIALOG_1),
            },

            onEventFinish =
            {
                [196] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
