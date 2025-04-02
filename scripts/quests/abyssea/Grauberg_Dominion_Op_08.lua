-----------------------------------
-- Grauberg - Dominion Op #08
-----------------------------------
-- !addquest 8 122
-- Dominion Sergeant (Tosuka-Porika's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_08_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_GRAUBERG] =
        {
            ['Deimobugard'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 595)
                end,
            },
        },
    },
}

return quest
