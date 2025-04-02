-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Four of Coins
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.amk.helpers.cardianOrbDrop(mob, player, invaderXim.ki.ORB_OF_COINS)
    invaderXim.regime.checkRegime(player, mob, 663, 4, invaderXim.regime.type.GROUNDS)
end

return entity
