-----------------------------------
-- Uleguerand - Dominion Op #13
-----------------------------------
-- !addquest 8 113
-- Dominion Sergeant (Romaa Mihgo's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_13_ULEGUERAND)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ULEGUERAND] =
        {
            ['Bluffalo'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 586)
                end,
            },
        },
    },
}

return quest
