-----------------------------------
-- Trust: Ulmia
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
        [invaderXim.magic.spell.PRISHE] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.MILDAURION] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    -- TODO: BRD trusts need better logic and major overhaul, for now they compliment each other
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.MADRIGAL }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.MADRIGAL })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.MINUET }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.VALOR_MINUET })

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
