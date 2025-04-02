-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Wadi Crab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 640, 2, invaderXim.regime.type.GROUNDS)
end

return entity
