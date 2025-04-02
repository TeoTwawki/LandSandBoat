-----------------------------------
-- Area: Fei'Yin
--  Mob: Balayang
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 717, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 718, 1, invaderXim.regime.type.GROUNDS)
end

return entity
