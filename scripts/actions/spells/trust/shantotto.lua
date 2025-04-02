-----------------------------------
-- Trust: Shantotto
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.SHANTOTTO_II)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.AJIDO_MARUJIDO] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.STAR_SIBYL] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.KORU_MORU] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.KING_OF_HEARTS] = invaderXim.trust.messageOffset.TEAMWORK_4
    })

    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, invaderXim.magic.spellFamily.NONE })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.NONE }, 60)

    local power = mob:getMainLvl() / 10
    mob:addMod(invaderXim.mod.MATT, power)
    mob:addMod(invaderXim.mod.MACC, power)
    mob:addMod(invaderXim.mod.HASTE_MAGIC, 1000) -- 10% Haste (Magic)

    mob:setAutoAttackEnabled(false)

    mob:setMobMod(invaderXim.mobMod.TRUST_DISTANCE, invaderXim.trust.movementType.NO_MOVE)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
