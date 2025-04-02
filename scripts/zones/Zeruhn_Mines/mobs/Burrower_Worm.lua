-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Burrower Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 629, 2, invaderXim.regime.type.GROUNDS)
end

return entity
