-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Over Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 705, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 708, 1, invaderXim.regime.type.GROUNDS)
end

return entity
