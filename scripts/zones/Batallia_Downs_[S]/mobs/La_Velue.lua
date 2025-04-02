-----------------------------------
-- Area: Batallia Downs [S]
--   NM: La Velue
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 491)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 6, 516, 895 })
end

return entity
