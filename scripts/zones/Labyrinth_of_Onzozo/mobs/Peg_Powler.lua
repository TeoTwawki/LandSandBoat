-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Peg Powler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 297)
    invaderXim.regime.checkRegime(player, mob, 774, 1, invaderXim.regime.type.GROUNDS)
end

return entity
