-----------------------------------
-- Uleguerand - Dominion Op #03
-----------------------------------
-- !addquest 8 103
-- Dominion Sergeant (Zazarg's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_03_ULEGUERAND)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ULEGUERAND] =
        {
            ['Sub-zero_Gear'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 576)
                end,
            },
        },
    },
}

return quest
