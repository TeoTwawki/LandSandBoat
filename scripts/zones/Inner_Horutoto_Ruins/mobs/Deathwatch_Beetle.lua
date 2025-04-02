-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Deathwatch Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 652, 1, invaderXim.regime.type.GROUNDS)
end

return entity
