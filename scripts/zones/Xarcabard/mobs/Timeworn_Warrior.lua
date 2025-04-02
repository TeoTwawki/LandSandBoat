-----------------------------------
-- Area: Xarcabard
--   NM: Timeworn Warrior
--  WOTG Nov 2009 NM: Immune to Bind, Sleep, Gravity.
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.HP_DRAIN)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 317)
end

return entity
