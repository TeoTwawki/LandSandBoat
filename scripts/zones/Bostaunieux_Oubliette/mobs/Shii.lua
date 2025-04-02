-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Shii
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1) -- "has an Additional Effect: Terror in melee attacks"
    mob:setMod(invaderXim.mod.REGEN, 20) -- "also has an Auto Regen of medium strength" (guessing 20)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.TERROR)
end

entity.onMobRoam = function(mob)
    if VanadielHour() >= 6 and VanadielHour() < 18 then -- Despawn if its day
        DespawnMob(mob:getID())
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 179)
end

return entity
