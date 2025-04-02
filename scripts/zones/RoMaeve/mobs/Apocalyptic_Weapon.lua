-----------------------------------
-- Area: RoMaeve
--  Mob: Apocalyptic Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 122, 1, invaderXim.regime.type.FIELDS)
end

return entity
