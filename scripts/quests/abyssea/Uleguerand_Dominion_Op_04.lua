-----------------------------------
-- Uleguerand - Dominion Op #04
-----------------------------------
-- !addquest 8 104
-- Dominion Sergeant (Maat's Camp)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DOMINION_OP_04_ULEGUERAND)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ABYSSEA_ULEGUERAND] =
        {
            ['Snowflake'] =
            {
                onMobDeath = function(mob, player, optParams)
                    invaderXim.abyssea.dominionOnMobDeath(mob, player, 577)
                end,
            },
        },
    },
}

return quest
