-----------------------------------
-- Area: Behemoths Dominion
--  Mob: Greater Gayla
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 101, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 103, 1, invaderXim.regime.type.FIELDS)
end

return entity
