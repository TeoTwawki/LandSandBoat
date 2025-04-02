-----------------------------------
-- Trust: Sylvie UC
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
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.SPAWN)

    local master = mob:getMaster()
    if not master then
        return
    end

    local mJob   = master:getMainJob()

    -- TODO: Nott weaponskill needs implemented and logic added here for Apururu to use at 50% MP at level 50.
    -- Has Regain (50/tick) and uses Nott when MP falls below 66%.
    -- cure IV cures 456 HP @99

    mob:addMod(invaderXim.mod.GEOMANCY_SKILL, 8 * mob:getMainLvl() + 1)
    mob:addMod(invaderXim.mod.INDI_DURATION, 180)
    mob:addMod(invaderXim.mod.REGAIN, 50)

    if mob:getMainLvl() >= 99 then
        mob:addMod(invaderXim.mod.GEOMANCY_BONUS, 3)
    end

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 25 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.MASTER, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })
    mob:addGambit(ai.t.SELF, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })

    if mob:getMainLvl() >= 20 then
        mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.COLURE_ACTIVE }, { ai.r.MA, ai.s.BEST_INDI, invaderXim.magic.spellFamily.NONE })
    end

    if mob:getMainLvl() >= 93 and mJob ~= invaderXim.job.GEO then
        mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.ENTRUST }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.jobAbility.ENTRUST })
        mob:addGambit(ai.t.SELF, { ai.c.STATUS, invaderXim.effect.ENTRUST }, { ai.r.MA, ai.s.ENTRUSTED, invaderXim.magic.spellFamily.INDI_BUFF })
    end

    mob:addGambit(ai.t.MASTER, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.HASTE })
    mob:addGambit(ai.t.MELEE, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.HASTE })

    mob:setAutoAttackEnabled(false)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
