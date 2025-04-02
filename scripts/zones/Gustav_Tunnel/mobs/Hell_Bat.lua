-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Hell Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 763, 3, invaderXim.regime.type.GROUNDS)
end

return entity
