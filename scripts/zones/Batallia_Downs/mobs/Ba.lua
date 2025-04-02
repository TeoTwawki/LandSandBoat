-----------------------------------
-- Area: Batallia Downs
--  Mob: Ba
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 15, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 73, 2, invaderXim.regime.type.FIELDS)
end

return entity
