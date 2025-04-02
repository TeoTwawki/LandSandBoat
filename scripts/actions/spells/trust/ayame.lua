-----------------------------------
-- Trust: Ayame
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.AYAME_UC)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.NAJI] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.GILGAMESH] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.HASSO }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.HASSO })

    mob:addGambit(ai.t.SELF, { ai.c.HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.THIRD_EYE })

    mob:addGambit(ai.t.SELF, { ai.c.TP_LT, 1000 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.MEDITATE })

    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.SPECIAL_AYAME)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
