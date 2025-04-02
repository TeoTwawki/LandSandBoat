-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Fuligo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 669, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 670, 2, invaderXim.regime.type.GROUNDS)
end

return entity
