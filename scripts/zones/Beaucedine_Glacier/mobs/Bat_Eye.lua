-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Bat Eye
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 48, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 49, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 50, 3, invaderXim.regime.type.FIELDS)
end

return entity
