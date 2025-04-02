-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Cockatrice
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 772, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 773, 2, invaderXim.regime.type.GROUNDS)
end

return entity
