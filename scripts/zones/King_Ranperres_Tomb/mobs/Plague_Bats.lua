-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Plague Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 634, 1, invaderXim.regime.type.GROUNDS)
end

return entity
