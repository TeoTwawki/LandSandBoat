-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Daggerclaw Dracos
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 268)
    invaderXim.regime.checkRegime(player, mob, 39, 1, invaderXim.regime.type.FIELDS)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 365 })
end

return entity
