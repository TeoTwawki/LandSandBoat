-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Ash Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 761, 1, invaderXim.regime.type.GROUNDS)
end

return entity
