-----------------------------------
-- Trust: Naja Salaheem
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.NAJA_UC)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.GESSHO] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.RONGELOUTS] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.ABQUHBAH] = invaderXim.trust.messageOffset.TEAMWORK_3,
    })

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    mob:addListener('WEAPONSKILL_USE', 'NAJA_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3215 then -- Peacebreaker
            --  Cha-ching! Thirty gold coins!
            invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    mob:addGambit(ai.t.SELF, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.FOCUS })

    mob:addGambit(ai.t.SELF, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.DODGE })

    mob:addGambit(ai.t.SELF, { ai.c.HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.COUNTERSTANCE })
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
