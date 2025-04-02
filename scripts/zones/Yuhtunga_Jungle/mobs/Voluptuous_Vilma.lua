-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Voluptuous Vilma
-----------------------------------
local ID = zones[invaderXim.zone.YUHTUNGA_JUNGLE]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.REGEN, 25)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- Vilma randomly effects its target with one of the following effects
    local effects =
    {
        [1] = invaderXim.mob.ae.POISON,
        [2] = invaderXim.mob.ae.PARALYZE,
        [3] = invaderXim.mob.ae.BLIND,
        [4] = invaderXim.mob.ae.SILENCE,
        [5] = invaderXim.mob.ae.WEIGHT,
        [6] = invaderXim.mob.ae.SLOW,
        [7] = invaderXim.mob.ae.BIND,
    }
    local random = math.random(1, #effects)

    return invaderXim.mob.onAddEffect(mob, target, damage, effects[random])
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    DisallowRespawn(ID.mob.VOLUPTUOUS_VILMA, true)
    DisallowRespawn(ID.mob.ROSE_GARDEN_PH, false)
    GetMobByID(ID.mob.ROSE_GARDEN_PH):setRespawnTime(GetMobRespawnTime(ID.mob.ROSE_GARDEN_PH))
end

return entity
