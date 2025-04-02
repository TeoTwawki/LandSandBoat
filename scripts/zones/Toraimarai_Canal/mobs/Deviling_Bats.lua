-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Deviling Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 622, 2, invaderXim.regime.type.GROUNDS)
end

return entity
