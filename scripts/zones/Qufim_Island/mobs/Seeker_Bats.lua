-----------------------------------
-- Area: Qufim Island
--  Mob: Seeker Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 42, 2, invaderXim.regime.type.FIELDS)
end

return entity
