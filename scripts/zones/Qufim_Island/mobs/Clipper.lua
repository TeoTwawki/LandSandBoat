-----------------------------------
-- Area: Qufim Island
--  Mob: Clipper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 41, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 42, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 43, 2, invaderXim.regime.type.FIELDS)
end

return entity
