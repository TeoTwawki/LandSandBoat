-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Stygian Pugil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 621, 2, invaderXim.regime.type.GROUNDS)
end

return entity
