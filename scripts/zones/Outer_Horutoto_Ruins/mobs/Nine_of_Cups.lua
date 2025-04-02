-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Nine of Cups
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.amk.helpers.cardianOrbDrop(mob, player, invaderXim.ki.ORB_OF_CUPS)
    invaderXim.regime.checkRegime(player, mob, 668, 1, invaderXim.regime.type.GROUNDS)
end

return entity
