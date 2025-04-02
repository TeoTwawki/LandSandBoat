-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Velociraptor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 139, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 140, 1, invaderXim.regime.type.FIELDS)
end

return entity
