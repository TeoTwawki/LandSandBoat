-----------------------------------
-- Trust: Prishe
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.PRISHE_II)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.ULMIA] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.CHERUKIKI] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.KUKKI_CHEBUKKI] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.MAKKI_CHEBUKKI] = invaderXim.trust.messageOffset.TEAMWORK_4,
        [invaderXim.magic.spell.MILDAURION] = invaderXim.trust.messageOffset.TEAMWORK_5,
    })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 25 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
