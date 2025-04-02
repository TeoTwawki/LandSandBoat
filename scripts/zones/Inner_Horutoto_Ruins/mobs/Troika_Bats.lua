-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Troika Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 651, 1, invaderXim.regime.type.GROUNDS)
end

return entity
