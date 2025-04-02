-----------------------------------
-- Area: East Ronfaure
--  Mob: Forest Hare
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 66, 1, invaderXim.regime.type.FIELDS)
end

return entity
