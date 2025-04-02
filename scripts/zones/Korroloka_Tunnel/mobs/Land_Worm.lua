-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Land Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 727, 1, invaderXim.regime.type.GROUNDS)
end

return entity
