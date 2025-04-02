-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Lesath
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.POISON, { power = 20 })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 294)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(3600, 10800)) -- 1 to 3 hours
end

return entity
