-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Fortalice Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 710, 1, invaderXim.regime.type.GROUNDS)
end

return entity
