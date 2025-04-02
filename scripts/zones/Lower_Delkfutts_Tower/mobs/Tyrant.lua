-----------------------------------
-- Area: Lower Delkfutt's Tower
--   NM: Tyrant
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 14)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 343)
end

return entity
