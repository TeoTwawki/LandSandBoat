-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Five of Batons
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.amk.helpers.cardianOrbDrop(mob, player, invaderXim.ki.ORB_OF_BATONS)
    invaderXim.regime.checkRegime(player, mob, 664, 2, invaderXim.regime.type.GROUNDS)
end

return entity
