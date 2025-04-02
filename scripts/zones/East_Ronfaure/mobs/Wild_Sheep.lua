-----------------------------------
-- Area: East Ronfaure
--  Mob: Wild Sheep
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 68, 1, invaderXim.regime.type.FIELDS)
end

return entity
