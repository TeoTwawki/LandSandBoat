-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 28, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 29, 2, invaderXim.regime.type.FIELDS)
end

return entity
