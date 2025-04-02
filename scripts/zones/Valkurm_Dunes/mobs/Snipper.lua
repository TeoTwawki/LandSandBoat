-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Snipper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 8, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 9, 2, invaderXim.regime.type.FIELDS)
end

return entity
