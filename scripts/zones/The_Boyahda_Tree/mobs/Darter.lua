-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Darter
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 724, 2, invaderXim.regime.type.GROUNDS)
end

return entity
