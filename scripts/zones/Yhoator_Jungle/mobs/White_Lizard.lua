-----------------------------------
-- Area: Yhoator Jungle
--  Mob: White Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 129, 1, invaderXim.regime.type.FIELDS)
end

return entity
