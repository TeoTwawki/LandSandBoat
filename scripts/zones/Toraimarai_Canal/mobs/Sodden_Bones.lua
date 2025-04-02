-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Sodden Bones
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 623, 2, invaderXim.regime.type.GROUNDS)
end

return entity
