-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Robber Crab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 765, 1, invaderXim.regime.type.GROUNDS)
end

return entity
