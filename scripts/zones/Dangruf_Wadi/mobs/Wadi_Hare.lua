-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Wadi Hare
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 641, 1, invaderXim.regime.type.GROUNDS)
end

return entity
