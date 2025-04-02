-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Goblin Artificer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 609, 2, invaderXim.regime.type.GROUNDS)
end

return entity
