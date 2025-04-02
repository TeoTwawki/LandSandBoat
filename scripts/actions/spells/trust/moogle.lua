-----------------------------------
-- Trust: Moogle
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
        [invaderXim.magic.spell.FABLINIX] = invaderXim.trust.messageOffset.TEAMWORK_1,
    })

    local mlvl = mob:getMainLvl()
    local tick_amount
    if mlvl == 99 then
        tick_amount = 3
    elseif mlvl < 99 and mlvl > 58 then
        tick_amount = 2
    else
        tick_amount = 1
    end

    mob:addStatusEffectEx(invaderXim.effect.COLURE_ACTIVE, invaderXim.effect.COLURE_ACTIVE, 6, 3, 0, invaderXim.effect.GEO_REFRESH, tick_amount, invaderXim.auraTarget.ALLIES, invaderXim.effectFlag.AURA)
    mob:setAutoAttackEnabled(false)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
