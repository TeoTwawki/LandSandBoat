-----------------------------------
-- Trust: Zeid II
-----------------------------------

local quest = HiddenQuest:new('TrustZeidII')

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return not player:hasSpell(invaderXim.magic.spell.ZEID_II) and
                not player:findItem(invaderXim.item.CIPHER_OF_ZEIDS_ALTER_EGO_II) and
                player:hasCompletedMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.VOLTO_OSCURO)
        end,

        [invaderXim.zone.NORG] =
        {
            ['_700'] =
            {
                onTrigger = function(player, npc)
                    -- NOTE: No cap has been provided to determine if there is separate dialogue.  This
                    -- exists as a stopgap to ensure that the player can receive the item in case of full
                    -- inventory, or having already progressed.

                    npcUtil.giveItem(player, invaderXim.item.CIPHER_OF_ZEIDS_ALTER_EGO_II)
                    return quest:noAction()
                end,
            },
        },
    },
}

return quest
