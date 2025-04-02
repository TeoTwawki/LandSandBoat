-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Rock Eater
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 634, 2, invaderXim.regime.type.GROUNDS)
end

return entity
