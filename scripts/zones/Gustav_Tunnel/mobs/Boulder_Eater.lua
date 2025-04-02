-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Boulder Eater
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 770, 1, invaderXim.regime.type.GROUNDS)
end

return entity
