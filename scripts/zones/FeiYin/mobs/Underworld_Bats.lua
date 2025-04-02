-----------------------------------
-- Area: Fei'Yin
--  Mob: Underworld Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 713, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 714, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 715, 1, invaderXim.regime.type.GROUNDS)
end

return entity
