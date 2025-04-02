-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Snow Gigas
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 50, 1, invaderXim.regime.type.FIELDS)
end

return entity
