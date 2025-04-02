-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Death Wasp
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 25, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 85, 1, invaderXim.regime.type.FIELDS)
end

return entity
