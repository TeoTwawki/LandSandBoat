-----------------------------------
-- Altepa - Dominion Op #04
-----------------------------------
-- !addquest 8 90
-- Dominion Sergeant (Volker's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_04_ALTEPA)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ALTEPA] =
        {
            ['Dune_Manticore'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 563)
                end,
            },
        },
    },
}

return quest
