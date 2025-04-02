-----------------------------------
-- Area: Aydeewa Subterrane
--   NM: Lizardtrap
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PARALYZE)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 462)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(7200, 7800)) -- 120 to 130 minutes
end

return entity
