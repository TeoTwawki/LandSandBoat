-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Old Opo-opo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 756, 1, invaderXim.regime.type.GROUNDS)
end

return entity
