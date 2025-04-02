-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Masan
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 1500)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 1800)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 371)
end

return entity
