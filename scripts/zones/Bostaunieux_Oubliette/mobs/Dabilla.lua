-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Dabilla
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 612, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 614, 1, invaderXim.regime.type.GROUNDS)
end

return entity
