-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Pygmytoise
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 770, 2, invaderXim.regime.type.GROUNDS)
end

return entity
