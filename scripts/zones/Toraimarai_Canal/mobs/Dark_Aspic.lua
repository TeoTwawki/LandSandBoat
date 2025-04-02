-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Dark Aspic
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 619, 3, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 620, 1, invaderXim.regime.type.GROUNDS)
end

return entity
