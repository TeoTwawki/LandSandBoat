-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Azer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 673, 2, invaderXim.regime.type.GROUNDS)
end

return entity
