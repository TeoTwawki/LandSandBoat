-----------------------------------
-- Area: Fei'Yin
--   NM: Southern Shadow
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.ALWAYS_AGGRO, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.EVA_DOWN)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
