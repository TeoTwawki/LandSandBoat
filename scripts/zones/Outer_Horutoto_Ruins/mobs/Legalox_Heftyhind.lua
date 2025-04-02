-----------------------------------
-- Area: Outer Horutoto Ruins
--   NM: Legalox Heftyhind
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 75) -- "Has a high but not 100% Double Attack rate."
end

entity.onMobSpawn = function(mob)
    mob:addStatusEffect(invaderXim.effect.STONESKIN, 100, 0, 300) -- "Spawns with the effect of Stoneskin."
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SLOW) -- "Physical attacks have an additional effect: Slow, but does not always activate."
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 292)
end

return entity
