-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Jelly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 729, 2, invaderXim.regime.type.GROUNDS)
end

return entity
