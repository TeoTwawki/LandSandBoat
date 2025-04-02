-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Doom Guard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 765, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 767, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 768, 1, invaderXim.regime.type.GROUNDS)
end

return entity
