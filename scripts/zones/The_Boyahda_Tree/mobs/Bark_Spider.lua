-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Bark Spider
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 719, 2, invaderXim.regime.type.GROUNDS)
end

return entity
