-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Goblin Bounty Hunter
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 57, 2, invaderXim.regime.type.FIELDS)
end

return entity
