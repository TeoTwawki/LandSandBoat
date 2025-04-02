-----------------------------------
-- Trust: Mihli Aliapoh
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    -- Records of Eminence: Alter Ego: Mihli Aliapoh
    if caster:getEminenceProgress(934) then
        invaderXim.roe.onRecordTrigger(caster, 934)
    end

    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.RUGHADJEEN] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.GADALAR] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.NAJELITH] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.ZAZARG] = invaderXim.trust.messageOffset.TEAMWORK_4,
    })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 25 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.AFFLATUS_SOLACE }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.AFFLATUS_SOLACE })

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

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.PARALYSIS }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PARALYZE }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.SLOW }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SLOW }, 60)

    mob:addListener('WEAPONSKILL_USE', 'MIHLI_ALIAPOH_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3203 then -- Scouring Bubbles
        -- Bah! Guess I'll pull out another one of my trrricks!
            if math.random(1, 100) <= 33 then
                invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
            end
        end
    end)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
