-----------------------------------
-- Trust: Halver
-----------------------------------

local quest = HiddenQuest:new('TrustHalver')

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return invaderXim.settings.main.ENABLE_TRUST_QUESTS == 1 and
                not player:hasSpell(invaderXim.magic.spell.HALVER) and
                not player:findItem(invaderXim.item.CIPHER_OF_HALVERS_ALTER_EGO) and
                player:hasCompletedMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.THE_PATH_UNTRAVELED)
        end,

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Halver'] =
            {
                onTrigger = function(player, npc)
                    -- NOTE: No cap has been provided to determine if there is separate dialogue.  This
                    -- exists as a stopgap to ensure that the player can receive the item in case of full
                    -- inventory, or having already progressed.

                    npcUtil.giveItem(player, invaderXim.item.CIPHER_OF_HALVERS_ALTER_EGO)
                    return quest:noAction()
                end,
            },
        },
    },
}

return quest
