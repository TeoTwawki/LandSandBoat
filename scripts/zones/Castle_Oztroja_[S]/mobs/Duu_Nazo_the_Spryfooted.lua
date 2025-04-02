-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Duu Nazo the Spryfooted
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.EXP_BONUS, -100)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, -1)
    mob:setMod(invaderXim.mod.REGEN, 100)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
