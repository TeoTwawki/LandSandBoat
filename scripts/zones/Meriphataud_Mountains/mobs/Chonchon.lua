-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Chonchon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 20) -- "Double Attack: Frequent and accurate"
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENSTONE)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 270)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(3600, 5400)) -- 60 to 90 minutes
end

return entity
