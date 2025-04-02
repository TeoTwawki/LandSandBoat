-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Bloodsucker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 620, 2, invaderXim.regime.type.GROUNDS)
end

return entity
