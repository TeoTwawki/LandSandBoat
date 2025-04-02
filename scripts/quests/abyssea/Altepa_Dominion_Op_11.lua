-----------------------------------
-- Altepa - Dominion Op #11
-----------------------------------
-- !addquest 8 97
-- Dominion Sergeant (Volker's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_11_ALTEPA)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ALTEPA] =
        {
            ['Nannakola'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 570)
                end,
            },
        },
    },
}

return quest
