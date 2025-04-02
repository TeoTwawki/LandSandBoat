-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Blackwater Pugil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 624, 1, invaderXim.regime.type.GROUNDS)
end

return entity
