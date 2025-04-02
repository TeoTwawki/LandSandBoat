-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Young Opo-opo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 131, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 132, 2, invaderXim.regime.type.FIELDS)
end

return entity
