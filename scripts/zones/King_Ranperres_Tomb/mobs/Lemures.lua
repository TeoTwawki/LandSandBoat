-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Lemures
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 636, 2, invaderXim.regime.type.GROUNDS)
end

return entity
