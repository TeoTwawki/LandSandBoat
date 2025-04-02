-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Goblin Chaser
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 608, 2, invaderXim.regime.type.GROUNDS)
end

return entity
