-----------------------------------
-- Trust: Ajido-Marujido
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
        [invaderXim.magic.spell.STAR_SIBYL] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.KORU_MORU] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.KARAHA_BARUHA] = invaderXim.trust.messageOffset.TEAMWORK_4,
        [invaderXim.magic.spell.SEMIH_LAFIHNA] = invaderXim.trust.messageOffset.TEAMWORK_5,
    })

    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, invaderXim.magic.spellFamily.NONE })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 25 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.SLOW }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SLOW }, 60)

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.NONE }, 60)

    mob:setMobMod(invaderXim.mobMod.TRUST_DISTANCE, invaderXim.trust.movementType.NO_MOVE)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
