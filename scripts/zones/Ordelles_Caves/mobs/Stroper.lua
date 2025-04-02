-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Stroper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 660, 2, invaderXim.regime.type.GROUNDS)
end

return entity
