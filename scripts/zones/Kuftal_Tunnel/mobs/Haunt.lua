-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Haunt
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 736, 2, invaderXim.regime.type.GROUNDS)
end

return entity
