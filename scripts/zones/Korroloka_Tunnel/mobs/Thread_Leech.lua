-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Thread Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 730, 1, invaderXim.regime.type.GROUNDS)
end

return entity
