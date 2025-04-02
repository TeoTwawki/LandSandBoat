-----------------------------------
-- Area: RuAun Gardens
--  Mob: Flamingo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 142, 1, invaderXim.regime.type.FIELDS)
end

return entity
