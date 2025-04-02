-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Panna Cotta
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 614, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 615, 2, invaderXim.regime.type.GROUNDS)
end

return entity
