-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Vault Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 705, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 708, 2, invaderXim.regime.type.GROUNDS)
end

return entity
