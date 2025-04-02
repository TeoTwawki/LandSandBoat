-----------------------------------
-- Trust: Zeid II
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.ZEID)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.LION_II] = invaderXim.trust.messageOffset.TEAMWORK_1,
    })

    mob:addListener('WEAPONSKILL_USE', 'ZEID_II_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 56 then -- Ground Strike
            -- Never again will I lose sight of who I am
            invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    -- Stun all the things!
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })

    mob:addGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })

    mob:addGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })

    mob:addGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })

    -- Non-stun things
    mob:addGambit(ai.t.SELF, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SOULEATER })

    mob:addGambit(ai.t.SELF, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.LAST_RESORT })

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.RANDOM, 3000)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
