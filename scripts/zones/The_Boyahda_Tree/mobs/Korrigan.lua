-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Korrigan
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 722, 1, invaderXim.regime.type.GROUNDS)
end

return entity
