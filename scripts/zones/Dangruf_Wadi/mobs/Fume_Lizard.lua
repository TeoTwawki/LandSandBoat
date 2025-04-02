-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Fume Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 642, 1, invaderXim.regime.type.GROUNDS)
end

return entity
