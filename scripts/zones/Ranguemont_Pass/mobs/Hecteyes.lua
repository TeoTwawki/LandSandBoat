-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Hecteyes
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 606, 2, invaderXim.regime.type.GROUNDS)
end

return entity
