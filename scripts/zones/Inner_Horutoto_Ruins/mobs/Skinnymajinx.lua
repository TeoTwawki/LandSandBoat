-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Skinnymajinx
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 654, 2, invaderXim.regime.type.GROUNDS)
end

return entity
