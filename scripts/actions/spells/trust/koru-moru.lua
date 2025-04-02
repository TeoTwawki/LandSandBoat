-----------------------------------
-- Trust: Koru-Moru
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
        [invaderXim.magic.spell.SHANTOTTO] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.SHANTOTTO_II] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.AJIDO_MARUJIDO] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    mob:addGambit(ai.t.SELF, { ai.c.MPP_LT, 5 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.CONVERT })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.MELEE, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.HASTE })

    mob:addGambit(ai.t.CASTER, {
        { ai.c.NOT_STATUS, invaderXim.effect.REFRESH },
        { ai.c.NOT_STATUS, invaderXim.effect.SUBLIMATION_ACTIVATED },
        { ai.c.NOT_STATUS, invaderXim.effect.SUBLIMATION_COMPLETE },
    }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.REFRESH })

    mob:addGambit(ai.t.TANK, { ai.c.NOT_STATUS, invaderXim.effect.REFRESH }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.REFRESH })

    mob:addGambit(ai.t.RANGED, {
            { ai.c.NOT_STATUS, invaderXim.effect.FLURRY_II }, -- invaderXim.effect.FLURRY_II is not a typo
            { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, -- No overwriting Haste
        }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.FLURRY })

    mob:addGambit(ai.t.TOP_ENMITY, { ai.c.NOT_STATUS, invaderXim.effect.PHALANX }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.PHALANX_II })

    mob:addGambit(ai.t.TARGET, { ai.c.STATUS_FLAG, invaderXim.effectFlag.DISPELABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.DISPEL })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.DIA }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.DIA }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.SLOW }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SLOW }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.EVASION_DOWN }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.DISTRACT }, 60)

    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PROTECT })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SHELL })

    mob:setAutoAttackEnabled(false)

    mob:setMobMod(invaderXim.mobMod.TRUST_DISTANCE, invaderXim.trust.movementType.NO_MOVE)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
