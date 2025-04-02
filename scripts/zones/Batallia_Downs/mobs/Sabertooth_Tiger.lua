-----------------------------------
-- Area: Batallia Downs
--  Mob: Sabertooth Tiger
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 74, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 75, 1, invaderXim.regime.type.FIELDS)
end

return entity
