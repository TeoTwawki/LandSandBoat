-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Babaulas
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 776, 1, invaderXim.regime.type.GROUNDS)
end

return entity
