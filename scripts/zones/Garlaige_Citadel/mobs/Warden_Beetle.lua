-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Warden Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 710, 2, invaderXim.regime.type.GROUNDS)
end

return entity
