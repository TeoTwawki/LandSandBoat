-----------------------------------
-- Trust: Maat
-----------------------------------
local ruludeID = zones[invaderXim.zone.RULUDE_GARDENS]
-----------------------------------

local quest = HiddenQuest:new('TrustMaat')

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return invaderXim.trust.hasPermit(player) and
                not player:hasSpell(invaderXim.magic.spell.MAAT)
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    if utils.mask.countBits(player:getCharVar('maatsCap'), 16) >= 6 then
                        return quest:event(10241)
                    else
                        return quest:event(10242)
                    end
                end,
            },

            onEventFinish =
            {
                [10241] = function(player, csid, option, npc)
                    if option == 2 and quest:complete(player) then
                        player:addSpell(invaderXim.magic.spell.MAAT, true, true)
                        player:messageSpecial(ruludeID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.MAAT)
                    end
                end,
            },
        },
    },
}

return quest
