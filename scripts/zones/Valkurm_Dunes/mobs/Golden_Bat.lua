-----------------------------------
-- Area: Valkurm Dunes (103)
--   NM: Golden Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 208)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 217 })
end

return entity
