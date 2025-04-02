-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Wind Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 632, 2, invaderXim.regime.type.GROUNDS)
end

return entity
