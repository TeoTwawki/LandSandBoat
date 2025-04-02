-----------------------------------
-- Area: Beaucedine Glacier
--   NM: Gargantua
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 312)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 153, 367, 581 })
end

return entity
