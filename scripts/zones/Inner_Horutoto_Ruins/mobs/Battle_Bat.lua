-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Battle Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 649, 1, invaderXim.regime.type.GROUNDS)
end

return entity
