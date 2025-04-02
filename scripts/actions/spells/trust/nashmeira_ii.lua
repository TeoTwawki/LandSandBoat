-----------------------------------
-- Trust: Nashmeira II
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.NASHMEIRA)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.LILISETTE_II] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.ARCIELA_II] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.IROHA_II] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.LION_II] = invaderXim.trust.messageOffset.TEAMWORK_4,
        [invaderXim.magic.spell.PRISHE_II] = invaderXim.trust.messageOffset.TEAMWORK_5,
    })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
    -- TODO: Should only use Curaga when *3* or more party members are below 75%
    -- Setting the Curaga threshold a bit lower here to prevent a priority conflict with regular Cure gambit, above.
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURAGA })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.POISON }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.POISONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PARALYSIS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.PARALYNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.BLINDNESS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.BLINDNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SILENCE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.SILENA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PETRIFICATION }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.DISEASE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.VIRUNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.CURSE_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURSNA })

    mob:addGambit(ai.t.SELF, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })

    mob:addListener('WEAPONSKILL_USE', 'NASHMEIRA_II_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3243 then -- Imperial Authority
            -- No! Stand back!
            invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
