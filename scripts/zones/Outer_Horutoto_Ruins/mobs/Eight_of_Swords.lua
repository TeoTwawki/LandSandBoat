-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Eight of Swords
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.amk.helpers.cardianOrbDrop(mob, player, invaderXim.ki.ORB_OF_SWORDS)
    invaderXim.regime.checkRegime(player, mob, 667, 3, invaderXim.regime.type.GROUNDS)
end

return entity
