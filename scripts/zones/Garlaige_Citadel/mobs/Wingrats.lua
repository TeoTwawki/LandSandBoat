-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Wingrats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 703, 1, invaderXim.regime.type.GROUNDS)
end

return entity
