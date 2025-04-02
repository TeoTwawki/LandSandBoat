-----------------------------------
-- The Flipside of Things
-----------------------------------
-- !addquest 7 11
-- Rarcasmeault : !pos 146.175 -6.000 93.04
-- _qm2         : !pos -69.588 -1.415 57.695
-----------------------------------

local quest = Quest:new(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_FLIPSIDE_OF_THINGS)

quest.reward =
{
    exp     = 2000,
    gil     = 2000,
    keyItem = invaderXim.keyItem.MAP_OF_VUNKERL_INLET,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.GARLAIGE_CITADEL_S] =
        {
            ['Rarcasmeault'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(6)
                end,
            },

            onEventFinish =
            {
                [6] = function(player, csid, option, npc)
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

        [invaderXim.zone.GARLAIGE_CITADEL_S] =
        {
            ['Rarcasmeault'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.FIREPOWER_CASE) then
                        return quest:progressEvent(9)
                    else
                        return quest:event(8) -- This is their default action until the quest is completed.
                    end
                end,
            },

            ['_qm2'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.FIREPOWER_CASE) then
                        return quest:progressEvent(7)
                    end
                end,
            },

            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.FIREPOWER_CASE)
                end,

                [9] = function(player, csid, option, npc)
                    quest:complete(player)
                    player:delKeyItem(invaderXim.ki.FIREPOWER_CASE)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.GARLAIGE_CITADEL_S] =
        {
            ['Rarcasmeault'] = quest:event(4):replaceDefault(),
        },
    },
}

return quest
