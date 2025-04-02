-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--   NM: Ah Puch
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 291)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 513 })
end

return entity
