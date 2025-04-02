-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Elder Goobbue
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 722, 2, invaderXim.regime.type.GROUNDS)
end

return entity
