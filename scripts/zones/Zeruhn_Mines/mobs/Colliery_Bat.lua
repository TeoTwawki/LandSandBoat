-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Colliery Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 628, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 629, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 630, 1, invaderXim.regime.type.GROUNDS)
end

return entity
