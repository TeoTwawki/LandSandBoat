-----------------------------------
-- Area: Den of Rancor
--  Mob: Hakutaku
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 18000)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 120)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.PETRIFY)

    mob:setMod(invaderXim.mod.SILENCE_MEVA, 200)
    mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 25)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 15)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
