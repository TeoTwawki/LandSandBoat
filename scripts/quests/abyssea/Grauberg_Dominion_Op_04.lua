-----------------------------------
-- Grauberg - Dominion Op #04
-----------------------------------
-- !addquest 8 118
-- Dominion Sergeant : !pos -15.513 0.64 -482.04 254
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_04_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_GRAUBERG] =
        {
            ['Faunus_Wyvern'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 591)
                end,
            },
        },
    },
}

return quest
