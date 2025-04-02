-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Ka
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 672, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 673, 1, invaderXim.regime.type.GROUNDS)
end

return entity
