-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Boggart
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 63, 2, invaderXim.regime.type.FIELDS)
end

return entity
