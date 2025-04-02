-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Makara
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 764, 2, invaderXim.regime.type.GROUNDS)
end

return entity
