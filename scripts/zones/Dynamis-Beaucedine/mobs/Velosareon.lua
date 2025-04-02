-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Velosareon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 2676, 2682, 2690 })
end

return entity
