-----------------------------------
-- Trust: Cherukiki
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
        [invaderXim.magic.spell.MAKKI_CHEBUKKI] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.KUKKI_CHEBUKKI] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.PRISHE] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.TENZEN] = invaderXim.trust.messageOffset.TEAMWORK_4,
    })

    -- TODO: Research numerous emotes
    -- TODO: Verify amount of Regen potency, Regen effect
    -- TODO: Is supposed to path erratically during battle
    -- TODO: Meteor casting with siblings
    -- TODO: Any intelligence with casting Silence on mobs?

    mob:addGambit(ai.t.MASTER, { ai.c.NOT_STATUS, invaderXim.effect.REGEN }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.REGEN })
    mob:addGambit(ai.t.MELEE, { ai.c.NOT_STATUS, invaderXim.effect.REGEN }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.REGEN })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 25 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PROTECTRA })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SHELLRA })

    mob:addGambit(ai.t.MASTER, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.HASTE })
    mob:addGambit(ai.t.MELEE, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.HASTE })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.PARALYSIS }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PARALYZE }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.SLOW }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SLOW }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.SILENCE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.SILENCE }, 60)

    -- BGwiki states 5/tick regen.
    mob:addMod(invaderXim.mod.REGEN, 5)

    mob:setAutoAttackEnabled(false)

    mob:setMobMod(invaderXim.mobMod.TRUST_DISTANCE, invaderXim.trust.movementType.MID_RANGE)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
