-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Essedarius
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 134, 2, invaderXim.regime.type.FIELDS)
end

return entity
