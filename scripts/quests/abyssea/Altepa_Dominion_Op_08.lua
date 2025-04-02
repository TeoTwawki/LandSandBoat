-----------------------------------
-- Altepa - Dominion Op #08
-----------------------------------
-- !addquest 8 94
-- Dominion Sergeant (Excenmille's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_08_ALTEPA)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ALTEPA] =
        {
            ['Ergdrake'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 567)
                end,
            },
        },
    },
}

return quest
