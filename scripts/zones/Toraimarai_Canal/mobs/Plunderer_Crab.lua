-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Plunderer Crab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 623, 1, invaderXim.regime.type.GROUNDS)
end

return entity
