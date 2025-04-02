-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Mildaunegeux
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 2664, 2680, 2691 })
end

return entity
