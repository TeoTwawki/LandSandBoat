-----------------------------------
-- Area: East Ronfaure
--  Mob: Forest Funguar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 67, 2, invaderXim.regime.type.FIELDS)
end

return entity
