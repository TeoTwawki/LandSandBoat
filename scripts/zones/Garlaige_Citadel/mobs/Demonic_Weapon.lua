-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Demonic Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 705, 1, invaderXim.regime.type.GROUNDS)
end

return entity
