-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Machairodus
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 742, 2, invaderXim.regime.type.GROUNDS)
end

return entity
