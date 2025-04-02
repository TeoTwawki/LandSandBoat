-----------------------------------
-- Area: East Ronfaure
--  Mob: Scarab Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 68, 2, invaderXim.regime.type.FIELDS)
end

return entity
