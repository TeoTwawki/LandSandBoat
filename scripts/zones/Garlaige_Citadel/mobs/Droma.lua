-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Droma
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 707, 1, invaderXim.regime.type.GROUNDS)
end

return entity
