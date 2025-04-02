-----------------------------------
-- Altepa - Dominion Op #05
-----------------------------------
-- !addquest 8 91
-- Dominion Sergeant (Volker's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_05_ALTEPA)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ALTEPA] =
        {
            ['Manigordo'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 564)
                end,
            },
        },
    },
}

return quest
