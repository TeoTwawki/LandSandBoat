-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Blob
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 649, 2, invaderXim.regime.type.GROUNDS)
end

return entity
