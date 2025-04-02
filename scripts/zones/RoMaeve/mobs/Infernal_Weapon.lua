-----------------------------------
-- Area: RoMaeve
--  Mob: Infernal Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 123, 1, invaderXim.regime.type.FIELDS)
end

return entity
