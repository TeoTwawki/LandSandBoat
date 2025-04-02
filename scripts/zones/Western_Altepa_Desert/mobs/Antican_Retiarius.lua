-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Retiarius
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 135, 3, invaderXim.regime.type.FIELDS)
end

return entity
