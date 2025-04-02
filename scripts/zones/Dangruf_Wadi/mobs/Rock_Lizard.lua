-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Rock Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 639, 2, invaderXim.regime.type.GROUNDS)
end

return entity
