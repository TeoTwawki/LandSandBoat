-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Eques
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 135, 2, invaderXim.regime.type.FIELDS)
end

return entity
