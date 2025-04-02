-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Goblin Shaman
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 782, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 784, 1, invaderXim.regime.type.GROUNDS)
end

return entity
