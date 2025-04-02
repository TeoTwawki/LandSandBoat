-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Peryton
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 139, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 141, 1, invaderXim.regime.type.FIELDS)
end

return entity
