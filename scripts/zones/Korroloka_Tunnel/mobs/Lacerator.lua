-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Lacerator
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 734, 1, invaderXim.regime.type.GROUNDS)
end

return entity
