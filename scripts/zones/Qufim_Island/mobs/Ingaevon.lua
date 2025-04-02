-----------------------------------
-- Area: Qufim Island
--   NM: Ingaevon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 44, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 45, 2, invaderXim.regime.type.FIELDS)
end

return entity
