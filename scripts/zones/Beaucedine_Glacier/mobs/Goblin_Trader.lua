-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Goblin Trader
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 46, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 49, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 50, 2, invaderXim.regime.type.FIELDS)
end

return entity
