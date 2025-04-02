-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Blade Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 602, 2, invaderXim.regime.type.GROUNDS)
end

return entity
