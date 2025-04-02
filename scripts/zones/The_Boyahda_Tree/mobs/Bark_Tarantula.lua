-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Bark Tarantula
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 725, 2, invaderXim.regime.type.GROUNDS)
end

return entity
