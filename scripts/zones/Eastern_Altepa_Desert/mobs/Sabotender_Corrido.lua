-----------------------------------
-- Area: Eastern Altepa Desert
--   NM: Sabotender Corrido
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 25)
    mob:setMod(invaderXim.mod.MOVE_SPEED_STACKABLE, 25)
end

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.HUNDRED_FISTS, hpp = 25 },
        },
    })
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SLOW)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 411)
end

return entity
