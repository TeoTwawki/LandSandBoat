-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Hellbound Warlock
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 671, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 675, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 678, 1, invaderXim.regime.type.GROUNDS)
end

return entity
