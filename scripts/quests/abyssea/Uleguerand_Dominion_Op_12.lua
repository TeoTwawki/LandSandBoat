-----------------------------------
-- Uleguerand - Dominion Op #12
-----------------------------------
-- !addquest 8 112
-- Dominion Sergeant (Zazarg's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_12_ULEGUERAND)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ULEGUERAND] =
        {
            ['Benumbed_Vodoriga'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 585)
                end,
            },
        },
    },
}

return quest
