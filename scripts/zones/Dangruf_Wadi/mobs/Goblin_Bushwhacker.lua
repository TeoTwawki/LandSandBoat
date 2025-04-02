-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Goblin Bushwhacker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 640, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 645, 3, invaderXim.regime.type.GROUNDS)
end

return entity
