-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Yagudo Initiate
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 29, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 61, 1, invaderXim.regime.type.FIELDS)
end

return entity
