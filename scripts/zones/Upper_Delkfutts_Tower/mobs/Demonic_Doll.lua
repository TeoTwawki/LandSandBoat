-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Demonic Doll
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 788, 3, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 789, 3, invaderXim.regime.type.GROUNDS)
end

return entity
