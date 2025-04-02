-----------------------------------
-- Trust: Karaha-Baruha
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
    -- TODO: Add logic so that Spirit Taker is used if lower on mana, instead of holding to close TP.
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.STAR_SIBYL] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.ROBEL_AKBEL] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 55 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PROTECTRA })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SHELLRA })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PROTECT })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SHELL })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.HASTE })
    -- -na Spells
    mob:addGambit(ai.t.PARTY, { ai.l.OR(
                                { ai.c.STATUS, invaderXim.effect.CURSE_I },
                                { ai.c.STATUS, invaderXim.effect.CURSE_II },
                                { ai.c.STATUS, invaderXim.effect.BANE },
                                { ai.c.STATUS, invaderXim.effect.DOOM })
                                }, { ai.r.MS, ai.s.SPECIFIC, invaderXim.magic.spell.CURSNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PARALYSIS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.PARALYNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.BLINDNESS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.BLINDNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SILENCE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.SILENA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PETRIFICATION }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.DISEASE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.VIRUNA })

    -- Handle his Barelementra tracking --
    mob:addListener('TAKE_DAMAGE', 'KARAHA-BARUHA_TAKE_DAMAGE', function(mobArg, amount, attacker, attackType, damageType)
        local elemTable = {
            [invaderXim.damageType.FIRE] = { effect = invaderXim.effect.BARFIRE, spell = 66 },
            [invaderXim.damageType.ICE] = { effect = invaderXim.effect.BARBLIZZARD, spell = 67 },
            [invaderXim.damageType.WIND] = { effect = invaderXim.effect.BARAERO, spell = 68 },
            [invaderXim.damageType.EARTH] = { effect = invaderXim.effect.BARSTONE, spell = 69 },
            [invaderXim.damageType.THUNDER] = { effect = invaderXim.effect.BARTHUNDER, spell = 70 },
            [invaderXim.damageType.WATER] = { effect = invaderXim.effect.BARWATER, spell = 71 },
        }
        local elemData = elemTable[damageType]
        if elemData and not mobArg:getStatusEffect(elemData.effect) then
            mobArg:timer(30, function(mobBar)
                mobBar:castSpell(elemData.spell)
            end)
        end
    end)

    mob:addListener('WEAPONSKILL_USE', 'KARAHA-BARUHA_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3336 then -- Howling Moon
        -- The light shall never fade!
            if math.random(1, 100) <= 25 then
                invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
            end
        end
    end)

    if
        mob:getMPP() < 30
    then
        mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
    else
        mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 3000)
    end
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
