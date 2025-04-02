-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Gigas Stonecarrier
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 733, 1, invaderXim.regime.type.GROUNDS)
end

return entity
