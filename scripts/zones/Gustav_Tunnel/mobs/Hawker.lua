-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Hawker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 764, 1, invaderXim.regime.type.GROUNDS)
end

return entity
