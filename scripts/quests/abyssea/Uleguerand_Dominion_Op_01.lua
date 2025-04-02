-----------------------------------
-- Uleguerand - Dominion Op #01
-----------------------------------
-- !addquest 8 101
-- Dominion Sergeant (Zazarg's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_01_ULEGUERAND)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ULEGUERAND] =
        {
            ['Mechanical_Menace'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 574)
                end,
            },
        },
    },
}

return quest
