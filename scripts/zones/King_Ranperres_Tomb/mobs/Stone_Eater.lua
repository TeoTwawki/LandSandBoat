-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Stone Eater
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 632, 1, invaderXim.regime.type.GROUNDS)
end

return entity
