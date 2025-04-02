-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Battue Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 647, 1, invaderXim.regime.type.GROUNDS)
end

return entity
