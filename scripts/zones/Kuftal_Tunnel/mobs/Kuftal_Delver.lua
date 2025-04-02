-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Kuftal Delver
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 742, 1, invaderXim.regime.type.GROUNDS)
end

return entity
