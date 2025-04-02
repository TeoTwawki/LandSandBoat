-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Goblin Digger
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 57, 2, invaderXim.regime.type.FIELDS)
end

return entity
