-----------------------------------
-- Area: South Gustaberg
--  Mob: Land Crab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 80, 2, invaderXim.regime.type.FIELDS)
end

return entity
