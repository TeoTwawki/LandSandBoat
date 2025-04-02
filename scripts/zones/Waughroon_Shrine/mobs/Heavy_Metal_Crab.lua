-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Heavy Metal Crab
-- BCNM: Crustacean Conundrum
-- TODO: You can only do 0-2 damage no matter what your attack is.
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    if VanadielDayOfTheWeek() == invaderXim.day.WATERSDAY then
        mob:setMod(invaderXim.mod.REGEN, 6)
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.HP_DRAIN)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
