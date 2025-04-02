-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Living Statue
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 47, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 48, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 49, 3, invaderXim.regime.type.FIELDS)
end

return entity
