-----------------------------------
-- A Sentry's Peril
-- !addquest 0 60
-- Curilla : !pos 27 0.1 0.1 233
-- Hot Springs : !pos 444 -37 -18 139
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_GENERALS_SECRET)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.SANDORIA,
    item = invaderXim.item.LYNX_BAGHNAKHS,
}

quest.sections =
{
    {
        check = function(player, status)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and player:getFameLevel(invaderXim.fameArea.SANDORIA) > 1
        end,

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Curilla'] = quest:progressEvent(55),

            onEventFinish =
            {
                [55] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, invaderXim.ki.CURILLAS_BOTTLE_EMPTY)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Curilla'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.CURILLAS_BOTTLE_FULL) then
                        return quest:progressEvent(54)
                    else
                        return quest:progressEvent(53)
                    end
                end,
            },

            onEventFinish =
            {
                [54] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.CURILLAS_BOTTLE_FULL)
                    end
                end,
            },
        },

        [invaderXim.zone.HORLAIS_PEAK] =
        {
            ['Hot_Springs'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.CURILLAS_BOTTLE_EMPTY) then
                        player:delKeyItem(invaderXim.ki.CURILLAS_BOTTLE_EMPTY)
                        return quest:keyItem(invaderXim.ki.CURILLAS_BOTTLE_FULL)
                    end
                end,
            },
        },
    },
}

return quest
