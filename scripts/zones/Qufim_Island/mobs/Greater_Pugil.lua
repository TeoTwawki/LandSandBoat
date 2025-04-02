-----------------------------------
-- Area: Qufim Island
--  Mob: Greater Pugil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 43, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 44, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 45, 3, invaderXim.regime.type.FIELDS)
end

return entity
