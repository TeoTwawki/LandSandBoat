-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Targe Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 661, 2, invaderXim.regime.type.GROUNDS)
end

return entity
