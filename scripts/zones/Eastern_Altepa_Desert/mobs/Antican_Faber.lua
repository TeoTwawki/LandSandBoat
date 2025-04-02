-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Faber
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 110, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 111, 2, invaderXim.regime.type.FIELDS)
end

return entity
