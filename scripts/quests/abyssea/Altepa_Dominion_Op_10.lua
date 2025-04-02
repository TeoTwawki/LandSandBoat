-----------------------------------
-- Altepa - Dominion Op #10
-----------------------------------
-- !addquest 8 96
-- Dominion Sergeant (Excenmille's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_10_ALTEPA)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ALTEPA] =
        {
            ['Gastornis'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 569)
                end,
            },
        },
    },
}

return quest
