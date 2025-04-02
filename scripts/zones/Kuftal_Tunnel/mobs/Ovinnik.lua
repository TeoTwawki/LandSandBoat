-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Ovinnik
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 741, 1, invaderXim.regime.type.GROUNDS)
end

return entity
