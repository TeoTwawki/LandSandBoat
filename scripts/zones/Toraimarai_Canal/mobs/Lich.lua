-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Lich
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 619, 2, invaderXim.regime.type.GROUNDS)
end

return entity
