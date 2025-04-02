-----------------------------------
-- Area: Xarcabard
--  Mob: Demon Warlock
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 55, 1, invaderXim.regime.type.FIELDS)
end

return entity
