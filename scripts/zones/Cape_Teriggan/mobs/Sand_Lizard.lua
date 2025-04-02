-----------------------------------
-- Area: Cape Teriggan
--  Mob: Sand Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 104, 2, invaderXim.regime.type.FIELDS)
end

return entity
