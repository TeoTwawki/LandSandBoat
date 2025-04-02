-----------------------------------
-- Trust: Abquhbah
-----------------------------------

local quest = HiddenQuest:new('TrustAbquhbah')

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return not player:hasSpell(invaderXim.magic.spell.ABQUHBAH) and
                not player:findItem(invaderXim.item.CIPHER_OF_ABQUHBAHS_ALTER_EGO) and
                player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.IMMORTAL_SENTRIES) and
                player:getCurrentMission(invaderXim.mission.log_id.ROV) >= invaderXim.mission.id.rov.EVER_FORWARD
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Abquhbah'] =
            {
                onTrigger = function(player, npc)
                    local hasTrustPermit = invaderXim.trust.hasPermit(player) and 1 or 0

                    return quest:progressEvent(170, { [1] = hasTrustPermit, [2] = player:getNation(), text_table = 0 })
                end,
            },

            onEventFinish =
            {
                [170] = function(player, csid, option, npc)
                    if invaderXim.trust.hasPermit(player) then
                        npcUtil.giveItem(player, invaderXim.item.CIPHER_OF_ABQUHBAHS_ALTER_EGO)
                    end
                end,
            },
        },
    },
}

return quest
