-----------------------------------
-- Area: Valkurm Dunes
--   NM: Valkurm Emperor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 209)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 777 })
end

return entity
