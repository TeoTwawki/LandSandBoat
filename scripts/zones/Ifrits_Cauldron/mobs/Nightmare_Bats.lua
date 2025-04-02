-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Nightmare Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 760, 1, invaderXim.regime.type.GROUNDS)
end

return entity
