-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Jolly Green
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 212)
    invaderXim.regime.checkRegime(player, mob, 60, 3, invaderXim.regime.type.FIELDS)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 942 })
end

return entity
