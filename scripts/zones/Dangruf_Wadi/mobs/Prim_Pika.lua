-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Prim Pika
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 644, 1, invaderXim.regime.type.GROUNDS)
end

return entity
