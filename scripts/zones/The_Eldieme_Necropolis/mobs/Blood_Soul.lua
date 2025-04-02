-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Blood Soul
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 674, 2, invaderXim.regime.type.GROUNDS)
end

return entity
