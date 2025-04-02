-----------------------------------
-- Grauberg - Dominion Op #11
-----------------------------------
-- !addquest 8 188
-- Dominion Sergeant (Tosuka-Porika's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_11_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_GRAUBERG] =
        {
            ['Seelie'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 598)
                end,
            },
        },
    },
}

return quest
