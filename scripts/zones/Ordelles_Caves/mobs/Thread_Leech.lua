-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Thread Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 655, 2, invaderXim.regime.type.GROUNDS)
end

return entity
