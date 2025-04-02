-----------------------------------
-- Grauberg - Dominion Op #07
-----------------------------------
-- !addquest 8 121
-- Dominion Sergeant (Wolfgang's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_07_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_GRAUBERG] =
        {
            ['Sensenmann'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 594)
                end,
            },
        },
    },
}

return quest
