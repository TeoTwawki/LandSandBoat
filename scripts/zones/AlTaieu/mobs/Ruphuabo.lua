-----------------------------------
-- Area: Al'Taieu
--  Mob: Ru'phuabo
-- Jailor of Love Pet version
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.EXP_BONUS, -100)
    mob:setMobMod(invaderXim.mobMod.GIL_BONUS, -100)
    mob:setMobMod(invaderXim.mobMod.NO_DROPS, 1)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
