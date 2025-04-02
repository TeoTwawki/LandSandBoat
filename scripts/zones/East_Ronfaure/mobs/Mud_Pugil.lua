-----------------------------------
-- Area: East Ronfaure
--  Mob: Mud Pugil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 64, 1, invaderXim.regime.type.FIELDS)
end

return entity
