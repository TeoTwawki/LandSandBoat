-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Poison Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 35, 1, invaderXim.regime.type.FIELDS)
end

return entity
