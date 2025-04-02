-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Trailblazer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 651, 2, invaderXim.regime.type.GROUNDS)
end

return entity
