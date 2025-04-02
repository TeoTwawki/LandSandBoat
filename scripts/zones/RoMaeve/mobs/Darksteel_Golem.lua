-----------------------------------
-- Area: RoMaeve
--  Mob: Darksteel Golem
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 122, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 123, 2, invaderXim.regime.type.FIELDS)
end

return entity
