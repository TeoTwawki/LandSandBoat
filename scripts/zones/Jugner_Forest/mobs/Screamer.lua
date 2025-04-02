-----------------------------------
-- Area: Jugner Forest
--  Mob: Screamer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 58, 2, invaderXim.regime.type.FIELDS)
end

return entity
