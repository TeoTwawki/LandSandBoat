-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Nekros Hound
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 677, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 678, 2, invaderXim.regime.type.GROUNDS)
end

return entity
