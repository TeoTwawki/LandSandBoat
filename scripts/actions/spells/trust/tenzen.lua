-----------------------------------
-- Trust: Tenzen
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.TENZEN_II)
end

spellObject.onSpellCast = function(caster, target, spell)
    -- Records of Eminence: Alter Ego: Tenzen
    if caster:getEminenceProgress(935) then
        invaderXim.roe.onRecordTrigger(caster, 935)
    end

    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.IROHA] = invaderXim.trust.messageOffset.TEAMWORK_1,
    })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.HASSO }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.HASSO })

    mob:addGambit(ai.t.SELF, { ai.c.HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.THIRD_EYE })

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 1500)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
