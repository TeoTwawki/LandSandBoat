-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Decurio
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 112, 1, invaderXim.regime.type.FIELDS)
end

return entity
