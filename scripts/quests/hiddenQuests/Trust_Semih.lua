-----------------------------------
-- Trust: Semih
-----------------------------------

local quest = HiddenQuest:new('TrustSemih')

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return invaderXim.settings.main.ENABLE_TRUST_QUESTS == 1 and
                not player:hasSpell(invaderXim.magic.spell.SEMIH_LAFIHNA) and
                not player:findItem(invaderXim.item.CIPHER_OF_SEMIHS_ALTER_EGO) and
                player:hasCompletedMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.THE_PATH_UNTRAVELED)
        end,

        [invaderXim.zone.HEAVENS_TOWER] =
        {
            ['Kupipi'] =
            {
                onTrigger = function(player, npc)
                    -- NOTE: No cap has been provided to determine if there is separate dialogue.  This
                    -- exists as a stopgap to ensure that the player can receive the item in case of full
                    -- inventory, or having already progressed.

                    npcUtil.giveItem(player, invaderXim.item.CIPHER_OF_SEMIHS_ALTER_EGO)
                    return quest:noAction()
                end,
            },
        },
    },
}

return quest
