-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Mushussu
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 773, 1, invaderXim.regime.type.GROUNDS)
end

return entity
