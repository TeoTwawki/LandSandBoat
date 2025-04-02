-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Valley Manticore
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 140, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 141, 2, invaderXim.regime.type.FIELDS)
end

return entity
