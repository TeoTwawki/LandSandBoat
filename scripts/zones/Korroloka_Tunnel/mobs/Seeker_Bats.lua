-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Seeker Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 727, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 728, 1, invaderXim.regime.type.GROUNDS)
end

return entity
