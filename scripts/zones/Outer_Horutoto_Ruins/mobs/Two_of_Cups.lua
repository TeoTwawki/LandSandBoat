-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Two of Cups
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.amk.helpers.cardianOrbDrop(mob, player, invaderXim.ki.ORB_OF_CUPS)
end

return entity
