-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Funnel Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 706, 1, invaderXim.regime.type.GROUNDS)
end

return entity
