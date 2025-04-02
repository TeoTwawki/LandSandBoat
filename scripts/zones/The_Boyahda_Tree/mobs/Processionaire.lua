-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Processionaire
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 724, 1, invaderXim.regime.type.GROUNDS)
end

return entity
