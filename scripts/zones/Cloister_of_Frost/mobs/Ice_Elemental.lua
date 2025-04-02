-----------------------------------
-- Area: Cloister of Frost
-- Mob: Ice Elemental
-- Quest: Waking the Beast
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.UDMGPHYS, -2500)
    mob:setMod(invaderXim.mod.ICE_ABSORB, 100)
    -- res rank for mob that absorbs is always lowest value
    -- set here as this shares a mob_resistances row with many other eles
    mob:setMod(invaderXim.mod.ICE_RES_RANK, -3)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
    mob:setMobMod(invaderXim.mobMod.SKIP_ALLEGIANCE_CHECK, 1)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.MAGIC_DELAY, 12)
    mob:setMagicCastingEnabled(false)
end

entity.onMobEngage = function(mob, target)
    mob:setMagicCastingEnabled(true)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PARALYZE, { chance = 10, duration = 30 })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
