-----------------------------------
-- Area: North Gustaberg [S]
--   NM: Gloomanita
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.POISON, { power = 5 })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 498)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 779 })
end

return entity
