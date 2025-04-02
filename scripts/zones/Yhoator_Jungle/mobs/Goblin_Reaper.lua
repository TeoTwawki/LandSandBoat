-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Goblin Reaper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 129, 2, invaderXim.regime.type.FIELDS)
end

return entity
