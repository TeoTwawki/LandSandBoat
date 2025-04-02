-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Goblin Gambler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 777, 2, invaderXim.regime.type.GROUNDS)
end

return entity
