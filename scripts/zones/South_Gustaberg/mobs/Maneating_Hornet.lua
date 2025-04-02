-----------------------------------
-- Area: South Gustaberg
--  Mob: Maneating Hornet
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 76, 1, invaderXim.regime.type.FIELDS)
end

return entity
