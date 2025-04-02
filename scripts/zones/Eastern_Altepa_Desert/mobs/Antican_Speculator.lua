-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Speculator
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 112, 3, invaderXim.regime.type.FIELDS)
end

return entity
