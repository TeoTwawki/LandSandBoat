-----------------------------------
-- Area: Mount Zhayolm
--   NM: Ignamoth
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 50)
    mob:setMod(invaderXim.mod.REGAIN, 200)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PARALYZE, { duration = 60 })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 457)
end

return entity
