-----------------------------------
-- Love and Ice
-----------------------------------
-- Log ID: 1, Quest ID: 43
-- Carmelo           : !pos -146.476 -7.48 -10.889 236
-- Mirror Pond (J-8) : !pos -96.165 1.518 -392.700 111
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.LOVE_AND_ICE)

quest.reward =
{
    fame     = 120,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.LAMIA_HARP,
    title    = invaderXim.title.SORROW_DROWNER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:seenKeyItem(invaderXim.ki.CARRIER_PIGEON_LETTER)
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Carmelo'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_SIRENS_TEAR) and
                        player:getFameLevel(invaderXim.fameArea.BASTOK) >= 5
                    then
                        return quest:progressEvent(185)
                    else
                        return quest:event(187)
                    end
                end,
            },

            onEventFinish =
            {
                [185] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.CARMELOS_SONG_SHEET)
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
            ['Carmelo'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.CARMELOS_SONG_SHEET) then
                        return quest:progressEvent(186)
                    end
                end,
            },

            onEventFinish =
            {
                [186] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        invaderXim.quest.setMustZone(player, invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.A_TEST_OF_TRUE_LOVE)
                    end
                end,
            },
        },

        [invaderXim.zone.BEAUCEDINE_GLACIER] =
        {
            ['Mirror_Pond_1'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.CARMELOS_SONG_SHEET) then
                        return quest:progressEvent(100)
                    end
                end,
            },

            onEventFinish =
            {
                [100] = function(player, csid, option, npc)
                    player:delKeyItem(invaderXim.ki.CARMELOS_SONG_SHEET)
                end,
            },
        },
    },
}

return quest
