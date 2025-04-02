-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Blade Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 648, 1, invaderXim.regime.type.GROUNDS)
end

return entity
