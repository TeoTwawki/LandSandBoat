-----------------------------------
-- Glyph Hanger
-----------------------------------
-- !addquest 2 30
-- Hariga-Origa : !pos -62 -6 105 238
-- Ipupu        : !pos 251.745 -5.5 35.539 115
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.GLYPH_HANGER)

quest.reward =
{
    keyItem  = invaderXim.ki.MAP_OF_THE_HORUTOTO_RUINS,
    fameArea = invaderXim.fameArea.WINDURST,
    fame     = 120,
    exp      = 2000,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Hariga-Origa'] = quest:progressEvent(381),

            onEventFinish =
            {
                [381] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, invaderXim.ki.NOTE_FROM_HARIGA_ORIGA)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Hariga-Origa'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.NOTE_FROM_IPUPU) then
                        return quest:progressEvent(385)
                    else
                        return quest:event(382)
                    end
                end,
            },

            ['Serukoko'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.NOTE_FROM_IPUPU) then
                        return quest:progressEvent(383)
                    end
                end,
            },

            ['Sohdede'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.NOTE_FROM_IPUPU) then
                        return quest:progressEvent(384)
                    end
                end,
            },

            onEventFinish =
            {
                [385] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.NOTE_FROM_IPUPU)

                        -- Player must zone before being able to flag the next quest
                        player:setLocalVar('Quest[2][20]mustZone', 1)
                    end
                end,
            },
        },

        [invaderXim.zone.WEST_SARUTABARUTA] =
        {
            ['Ipupu'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.NOTE_FROM_HARIGA_ORIGA) then
                        return quest:progressEvent(47, 0, invaderXim.ki.NOTE_FROM_HARIGA_ORIGA)
                    end
                end,
            },

            onEventFinish =
            {
                [47] = function(player, csid, option, npc)
                    player:delKeyItem(invaderXim.ki.NOTE_FROM_HARIGA_ORIGA)
                    npcUtil.giveKeyItem(player, invaderXim.ki.NOTE_FROM_IPUPU)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                not player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CHASING_TALES)
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Hariga-Origa'] = quest:event(386):replaceDefault()
        },
    },
}

return quest
