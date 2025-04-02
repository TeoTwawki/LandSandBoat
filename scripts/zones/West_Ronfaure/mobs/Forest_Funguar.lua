-----------------------------------
-- Area: West Ronfaure
--  Mob: Forest Funguar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 3, 2, invaderXim.regime.type.FIELDS)
end

return entity
