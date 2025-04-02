-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Thorn Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 670, 1, invaderXim.regime.type.GROUNDS)
end

return entity
