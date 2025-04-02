-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Chamber Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 707, 2, invaderXim.regime.type.GROUNDS)
end

return entity
