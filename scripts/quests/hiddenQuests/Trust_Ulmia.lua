-----------------------------------
-- Trust: Ulmia
-----------------------------------
-- Dilapidated Gate : !pos 260.000 7.319 -440.001 25
-----------------------------------
local misareauxID = zones[invaderXim.zone.MISAREAUX_COAST]
-----------------------------------

local quest = HiddenQuest:new('TrustUlmia')

local trustMemory = function(player)
    local memories = 0

    -- When I sang the Lay of the Immortals before the fifth crystal, it stirred up emotions within me.
    -- It dawned on me that it was not the oppressive weight of darkness that brought us together, but the holy light of the crystals.
    -- So now...
    if player:hasCompletedQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.APOCALYPSE_NIGH) then
        memories = memories + 2
    end

    return memories
end

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return invaderXim.trust.hasPermit(player) and
            not player:hasSpell(invaderXim.magic.spell.ULMIA) and
            -- On Dawn, but past "the boss"
            (player:getCurrentMission(invaderXim.mission.log_id.COP) > invaderXim.mission.id.cop.DAWN and
            invaderXim.mission.getVar(player, invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.DAWN, 'Status') >= 2)
            -- TODO: Additional conditions
        end,

        [invaderXim.zone.MISAREAUX_COAST] =
        {
            -- Dilapidated Gate
            ['_0p0'] =
            {
                onTrigger = function(player, npc, trade)
                    return quest:progressEvent(560, 0, 0, 0, trustMemory(player))
                end,
            },

            onEventFinish =
            {
                [560] = function(player, csid, option, npc)
                    if option == 2 and quest:complete(player) then
                        player:addSpell(invaderXim.magic.spell.ULMIA, true, true)
                        player:messageSpecial(misareauxID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.ULMIA)
                    end
                end,
            },
        },
    },
}

return quest
