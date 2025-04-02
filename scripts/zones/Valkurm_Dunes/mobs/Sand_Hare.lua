-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Sand Hare
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 7, 2, invaderXim.regime.type.FIELDS)
end

return entity
