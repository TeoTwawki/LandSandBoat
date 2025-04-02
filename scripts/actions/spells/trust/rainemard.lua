-----------------------------------
-- Trust: Rainemard
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
        [invaderXim.magic.spell.CURILLA] = invaderXim.trust.messageOffset.TEAMWORK_1,
    })

    -- TODO: Selection based on enemy weakness
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.ENFIRE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ENFIRE })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.EVASION_DOWN }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.DISTRACT }, 60)

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.PHALANX }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PHALANX })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.HASTE })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.REFRESH }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.REFRESH })

    -- If Curilla is present, will cast Haste/Phalanx/Refresh on her.
    mob:addGambit(ai.t.CURILLA, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.HASTE })
    mob:addGambit(ai.t.CURILLA, { ai.c.NOT_STATUS, invaderXim.effect.PHALANX }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.PHALANX_II })
    mob:addGambit(ai.t.CURILLA, { ai.c.NOT_STATUS, invaderXim.effect.REFRESH }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.REFRESH })

    -- NOTE: Do these late, to try and avoid clashing with healers casting -ra's
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PROTECT })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SHELL })
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
