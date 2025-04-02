-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Kuftal Digger
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 739, 1, invaderXim.regime.type.GROUNDS)
end

return entity
