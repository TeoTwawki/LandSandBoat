-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Boribaba
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 776, 2, invaderXim.regime.type.GROUNDS)
end

return entity
