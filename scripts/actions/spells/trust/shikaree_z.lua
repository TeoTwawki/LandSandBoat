-----------------------------------
-- Trust: Shikaree Z
-- Possesses MP+100%
-- Uses Ancient Circle if the enemy is a dragon
-- Super Jump is used when ShikareeZ is in the top enmity slot
-- Gains 205 TP on hit; has high TP return on Jump (655 TP) and High Jump (1065 TP).
-- TODO: Add/Apply MOD for HIGH_JUMP_TP_BONUS
-- Holds TP to 2000 to try to close skillchains. (TODO)
-- Saves Cure for party members under 50% HP or affected by Sleep
-- Prioritizes Haste over other spells, except to cast Erase when Slow would prevent Haste.
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
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.SPAWN)

    -- MPP mod migrated to sql/mob_pool_mods to apply at spawn
    mob:addMod(invaderXim.mod.STORETP, 174)
    mob:addMod(invaderXim.mod.JUMP_TP_BONUS, 164)

    mob:addGambit(ai.t.SELF, { ai.c.STATUS, invaderXim.effect.SLOW }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.HASTE })
    mob:addGambit(ai.t.MASTER, { ai.c.STATUS, invaderXim.effect.SLOW }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })
    mob:addGambit(ai.t.MASTER, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.HASTE })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.POISON }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.POISONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PARALYSIS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.PARALYNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.BLINDNESS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.BLINDNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SILENCE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.SILENA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PETRIFICATION }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.DISEASE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.VIRUNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.CURSE_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURSNA })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.TARGET, { ai.c.IS_ECOSYSTEM, invaderXim.ecosystem.DRAGON }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.ANCIENT_CIRCLE })

    mob:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.JUMP })
    mob:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.HIGH_JUMP })
    mob:addGambit(ai.t.SELF, { ai.c.HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SUPER_JUMP })

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 2000)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
