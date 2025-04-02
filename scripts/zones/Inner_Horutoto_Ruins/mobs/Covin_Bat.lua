-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Covin Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 653, 1, invaderXim.regime.type.GROUNDS)
end

return entity
