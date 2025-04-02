-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Doom Mage
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 765, 2, invaderXim.regime.type.GROUNDS)
end

return entity
