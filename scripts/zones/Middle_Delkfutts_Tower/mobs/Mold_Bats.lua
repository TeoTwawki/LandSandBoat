-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Mold Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 782, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 783, 2, invaderXim.regime.type.GROUNDS)
end

return entity
