-----------------------------------
-- Trust: Yoran-Oran UC
-- All changes made are from BGWiki and in game observations. Wiki says he has Fast Cast, but doesn't specify how much so it has been left out.
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

    -- TODO: Nott weaponskill needs implemented and logic added here for Yoran-Oran to use at 50% MP at level 50.
    -- TODO: UC trusts are supposed to get bonuses depending on unity ranking. Needs research.
    -- TODO: Custom spawn messages if Unity ranking is higher.
    -- TODO: Figure out what level of Fast Cast he has.

    mob:addMod(invaderXim.mod.CURE_POTENCY, 50)
    mob:addMod(invaderXim.mod.REGAIN, 50)
    mob:addMod(invaderXim.mod.MPP, 15) -- TODO: This is supposed to increase with Unity rank, but I don't believe that's implemented so it is set to the minimum.

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.AFFLATUS_SOLACE }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.AFFLATUS_SOLACE })
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 25 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE }) -- Prioritizes curing party members at lower HP%.
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PROTECTRA })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SHELLRA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.POISON }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.POISONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PARALYSIS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.PARALYNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.BLINDNESS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.BLINDNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SILENCE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.SILENA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PETRIFICATION }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.DISEASE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.VIRUNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.CURSE_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURSNA })
    mob:addGambit(ai.t.SELF, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.STONESKIN }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STONESKIN })

    mob:setAutoAttackEnabled(false)
    mob:setMobMod(invaderXim.mobMod.TRUST_DISTANCE, invaderXim.trust.movementType.LONG_RANGE)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
