-----------------------------------
-- Area: West Ronfaure
--  Mob: Tunnel Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 1, 1, invaderXim.regime.type.FIELDS)
end

return entity
