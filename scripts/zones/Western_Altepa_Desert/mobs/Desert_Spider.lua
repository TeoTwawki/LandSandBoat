-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Desert Spider
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 134, 1, invaderXim.regime.type.FIELDS)
end

return entity
