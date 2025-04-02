-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Yhoator Mandragora
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 130, 1, invaderXim.regime.type.FIELDS)
end

return entity
