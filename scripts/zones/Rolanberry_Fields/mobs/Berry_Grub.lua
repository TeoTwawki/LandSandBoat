-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Berry Grub
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 25, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 86, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 87, 1, invaderXim.regime.type.FIELDS)
end

return entity
