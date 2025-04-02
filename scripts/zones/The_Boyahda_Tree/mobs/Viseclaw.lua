-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Viseclaw
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 726, 1, invaderXim.regime.type.GROUNDS)
end

return entity
