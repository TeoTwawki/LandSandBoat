-----------------------------------
-- Area: Jugner_Forest_[S]
--   NM: Boll Weevil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.BLIND)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 483)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(5400, 7200)) -- 90 to 120 minutes
end

return entity
