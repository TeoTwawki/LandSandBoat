-----------------------------------
-- Lovers in the Dusk
-----------------------------------
-- Log ID: 1, Quest ID: 63
-- Carmelo : !pos -146.476 -7.48 -10.889 236
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.LOVERS_IN_THE_DUSK)

quest.reward =
{
    fame     = 120,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.SIREN_FLUTE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.A_TEST_OF_TRUE_LOVE) and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 6 and
                not quest:getMustZone(player)
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Carmelo'] = quest:progressEvent(275),

            onEventFinish =
            {
                [275] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.CHANSON_DE_LIBERTE)
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
            ['Carmelo'] = quest:event(276),
        },

        [invaderXim.zone.THE_SANCTUARY_OF_ZITAH] =
        {
            ['qm4'] =
            {
                onTrigger = function(player, npc)
                    if VanadielTOTD() == invaderXim.time.DUSK then
                        return quest:progressEvent(204)
                    end
                end,
            },

            onEventFinish =
            {
                [204] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.CHANSON_DE_LIBERTE)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Carmelo'] = quest:event(277):replaceDefault(),
        },
    },
}

return quest
