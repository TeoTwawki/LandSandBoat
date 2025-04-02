-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Kaboom
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 709, 2, invaderXim.regime.type.GROUNDS)
end

return entity
