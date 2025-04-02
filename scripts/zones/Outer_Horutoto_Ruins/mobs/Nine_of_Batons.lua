-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Nine of Batons
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.amk.helpers.cardianOrbDrop(mob, player, invaderXim.ki.ORB_OF_BATONS)
    invaderXim.regime.checkRegime(player, mob, 668, 2, invaderXim.regime.type.GROUNDS)
end

return entity
