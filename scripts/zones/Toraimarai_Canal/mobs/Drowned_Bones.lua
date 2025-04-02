-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Drowned Bones
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 624, 2, invaderXim.regime.type.GROUNDS)
end

return entity
