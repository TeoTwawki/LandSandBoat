-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Goblin Tanner
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 609, 1, invaderXim.regime.type.GROUNDS)
end

return entity
