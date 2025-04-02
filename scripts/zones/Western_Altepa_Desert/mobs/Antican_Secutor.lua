-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Secutor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 138, 1, invaderXim.regime.type.FIELDS)
end

return entity
