-----------------------------------
-- Area: Jugner Forest
--  Mob: Forest Tiger
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 14, 2, invaderXim.regime.type.FIELDS)
end

return entity
