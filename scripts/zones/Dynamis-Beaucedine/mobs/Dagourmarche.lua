-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Dagourmarche
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 2672, 2678, 2686 })
end

return entity
