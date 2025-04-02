-----------------------------------
-- The Stars of Ifrit
-----------------------------------
-- Log ID: 1, Quest ID: 42
-- Agapito : !pos -72.093 -3.097 9.309 236
-- qm1     : !pos -9 -5 -13 223
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_STARS_OF_IFRIT)

quest.reward =
{
    fame     = 100,
    fameArea = invaderXim.fameArea.BASTOK,
    gil      = 2100,
    title    = invaderXim.title.STAR_OF_IFRIT,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasKeyItem(invaderXim.ki.AIRSHIP_PASS) and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 3
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Agapito'] = quest:progressEvent(180),

            onEventFinish =
            {
                [180] = function(player, csid, option, npc)
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
            ['Agapito'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.CARRIER_PIGEON_LETTER) then
                        return quest:progressEvent(181)
                    end
                end,
            },

            onEventFinish =
            {
                [181] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },

        [invaderXim.zone.SAN_DORIA_JEUNO_AIRSHIP] =
        {
            ['qm1'] =
            {
                onTrigger = function(player, npc)
                    -- NOTE: Visibility of this NPC is limited to Full Moon and Night Time,
                    -- and is handled in onGameHour in Zone.lua for San d'Oria-Jeuno Airship.
                    -- This is a permanent Key Item.

                    if not player:hasKeyItem(invaderXim.ki.CARRIER_PIGEON_LETTER) then
                        return quest:keyItem(invaderXim.ki.CARRIER_PIGEON_LETTER)
                    end
                end,
            },
        },
    },
}

return quest
