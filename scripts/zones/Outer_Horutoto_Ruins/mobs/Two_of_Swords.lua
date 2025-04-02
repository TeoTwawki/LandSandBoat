-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Two of Swords
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.amk.helpers.cardianOrbDrop(mob, player, invaderXim.ki.ORB_OF_SWORDS)
end

return entity
