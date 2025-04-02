-----------------------------------
-- Area: Ve'Lugannon Palace
--  Mob: Water Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 748, 1, invaderXim.regime.type.GROUNDS)
end

return entity
