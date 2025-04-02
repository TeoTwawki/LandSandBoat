-----------------------------------
-- Area: Cloister of Storms
--  Mob: Ramuh Prime
-- Involved in Quest: Trial by Lightning
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = 893, hpp = math.random(30, 55) }, -- uses Judgment Bolt once while near 50% HPP.
        },
    })

    mob:setMobMod(invaderXim.mobMod.NO_STANDBACK, 1)
    mob:setMobMod(invaderXim.mobMod.SIGHT_RANGE, 20)
    mob:setMobMod(invaderXim.mobMod.MAGIC_RANGE, 40)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMod(invaderXim.mod.LTNG_ABSORB, 100)
    -- res rank for mob that absorbs is always lowest value
    mob:setMod(invaderXim.mod.THUNDER_RES_RANK, -3)
    mob:setMod(invaderXim.mod.UDMGPHYS, -6000)
    mob:setMod(invaderXim.mod.UDMGRANGE, -6000)

    mob:addImmunity(invaderXim.immunity.BLIND)
    mob:addImmunity(invaderXim.immunity.SLOW)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.TERROR)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENTHUNDER, { chance = 100, power = math.random(20, 40) })
end

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
