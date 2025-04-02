-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Ose
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
end

return entity
