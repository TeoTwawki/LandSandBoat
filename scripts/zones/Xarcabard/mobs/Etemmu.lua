-----------------------------------
-- Area: Xarcabard
--  Mob: Etemmu
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 51, 2, invaderXim.regime.type.FIELDS)
end

return entity
