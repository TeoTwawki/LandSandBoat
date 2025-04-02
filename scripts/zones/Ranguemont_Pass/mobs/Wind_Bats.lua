-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Wind Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 602, 1, invaderXim.regime.type.GROUNDS)
end

return entity
