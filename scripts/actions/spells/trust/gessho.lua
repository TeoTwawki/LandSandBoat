-----------------------------------
-- Trust: Gessho
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
        [invaderXim.magic.spell.NAJA_SALAHEEM] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.ABQUHBAH] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    mob:addListener('WEAPONSKILL_USE', 'GESSHO_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3257 then -- Shibaraku
            -- You have left me no choice. Prepare yourself!
            invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    -- Shadows are represented by invaderXim.effect.COPY_IMAGE, but with different icons depending on the tier
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.COPY_IMAGE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.UTSUSEMI })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.BLINDNESS }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.KURAYAMI }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.SLOW }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.HOJO }, 60)

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.YONIN }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.YONIN })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.PROVOKE })

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
