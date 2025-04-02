-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Master Coeurl
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 117, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 118, 2, invaderXim.regime.type.FIELDS)
end

return entity
