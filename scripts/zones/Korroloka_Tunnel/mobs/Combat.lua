-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Combat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 728, 2, invaderXim.regime.type.GROUNDS)
end

return entity
