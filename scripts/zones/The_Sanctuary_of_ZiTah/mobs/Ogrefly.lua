-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Ogrefly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 114, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 115, 2, invaderXim.regime.type.FIELDS)
end

return entity
