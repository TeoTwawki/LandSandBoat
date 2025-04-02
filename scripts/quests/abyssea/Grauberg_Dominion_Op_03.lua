-----------------------------------
-- Grauberg - Dominion Op #03
-----------------------------------
-- !addquest 8 117
-- Dominion Sergeant (Wolfgang's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_03_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_GRAUBERG] =
        {
            ['Stygian_Djinn'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 590)
                end,
            },
        },
    },
}

return quest
