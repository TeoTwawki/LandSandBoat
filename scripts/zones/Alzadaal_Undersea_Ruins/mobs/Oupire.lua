-----------------------------------
-- Area: Alzadaal Undersea Ruins
--   NM: Oupire
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PLAGUE)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 478)
    player:addTitle(invaderXim.title.OUPIRE_IMPALER)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(14400, 18000)) -- 4 to 5 hours
end

return entity
