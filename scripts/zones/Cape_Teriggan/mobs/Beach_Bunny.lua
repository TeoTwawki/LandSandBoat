-----------------------------------
-- Area: Cape Teriggan
--  Mob: Beach Bunny
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 104, 1, invaderXim.regime.type.FIELDS)
end

return entity
