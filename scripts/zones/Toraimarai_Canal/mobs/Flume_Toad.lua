-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Flume Toad
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 625, 1, invaderXim.regime.type.GROUNDS)
end

return entity
