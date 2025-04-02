-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Wurdalak
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 617, 1, invaderXim.regime.type.GROUNDS)
end

return entity
