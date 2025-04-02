-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Goblin Shepherd
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 764, 3, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 765, 3, invaderXim.regime.type.GROUNDS)
end

return entity
