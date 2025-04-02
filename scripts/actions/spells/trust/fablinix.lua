-----------------------------------
-- Trust: Fablinix
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.MOOGLE] = invaderXim.trust.messageOffset.TEAMWORK_1,
    })

    mob:addGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })

    mob:addGambit(ai.t.TANK, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.ENWATER }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ENWATER })

    mob:addGambit(ai.t.TARGET, { ai.c.RANDOM, 50 }, { ai.r.RATTACK, 0, 0 }, 30) -- TODO: Verify rate of ranged attacks

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 1500)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
