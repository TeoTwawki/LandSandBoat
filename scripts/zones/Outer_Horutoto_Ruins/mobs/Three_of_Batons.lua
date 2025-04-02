-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Three of Batons
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.amk.helpers.cardianOrbDrop(mob, player, invaderXim.ki.ORB_OF_BATONS)
end

return entity
