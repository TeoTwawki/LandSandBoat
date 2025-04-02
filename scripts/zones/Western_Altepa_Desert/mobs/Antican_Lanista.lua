-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Lanista
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 138, 2, invaderXim.regime.type.FIELDS)
end

return entity
