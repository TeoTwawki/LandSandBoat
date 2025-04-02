-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Flesher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 652, 2, invaderXim.regime.type.GROUNDS)
end

return entity
