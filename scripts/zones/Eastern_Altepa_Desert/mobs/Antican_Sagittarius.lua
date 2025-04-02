-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Sagittarius
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 112, 2, invaderXim.regime.type.FIELDS)
end

return entity
