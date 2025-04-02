-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Rock Golem
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 118, 1, invaderXim.regime.type.FIELDS)
end

return entity
