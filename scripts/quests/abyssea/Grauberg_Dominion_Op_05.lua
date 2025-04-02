-----------------------------------
-- Grauberg - Dominion Op #05
-----------------------------------
-- !addquest 8 119
-- Dominion Sergeant : !pos -15.513 0.64 -482.04 254
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_05_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_GRAUBERG] =
        {
            ['Putrid_Peapuk'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 592)
                end,
            },
        },
    },
}

return quest
