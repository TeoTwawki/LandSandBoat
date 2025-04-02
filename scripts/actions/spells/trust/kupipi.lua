-----------------------------------
-- Trust: Kupipi
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    local windurstFirstTrust = caster:getCharVar('WindurstFirstTrust')
    local zone = caster:getZoneID()

    if
        windurstFirstTrust == 1 and
        (zone == invaderXim.zone.EAST_SARUTABARUTA or zone == invaderXim.zone.WEST_SARUTABARUTA)
    then
        caster:setCharVar('WindurstFirstTrust', 2)
    end

    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.SHANTOTTO] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.STAR_SIBYL] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 25 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })

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

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.FLASH }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.FLASH }, 60)

    mob:setMobMod(invaderXim.mobMod.TRUST_DISTANCE, invaderXim.trust.movementType.NO_MOVE)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
