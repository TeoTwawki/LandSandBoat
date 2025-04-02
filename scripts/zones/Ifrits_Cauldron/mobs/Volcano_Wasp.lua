-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Volcano Wasp
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 755, 1, invaderXim.regime.type.GROUNDS)
end

return entity
