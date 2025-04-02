-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Robber Crab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 809, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 810, 1, invaderXim.regime.type.GROUNDS)
end

return entity
