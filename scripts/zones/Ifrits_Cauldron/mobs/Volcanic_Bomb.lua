-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Volcanic Bomb
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 760, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 761, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 762, 2, invaderXim.regime.type.GROUNDS)
end

return entity
