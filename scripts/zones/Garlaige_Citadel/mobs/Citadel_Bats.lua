-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Citadel Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 705, 2, invaderXim.regime.type.GROUNDS)
end

return entity
