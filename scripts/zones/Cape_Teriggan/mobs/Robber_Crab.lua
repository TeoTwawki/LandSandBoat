-----------------------------------
-- Area: Cape Teriggan
--  Mob: Robber Crab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 105, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 106, 1, invaderXim.regime.type.FIELDS)
end

return entity
